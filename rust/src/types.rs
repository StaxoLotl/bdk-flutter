use bdk::bitcoin::blockdata::transaction::TxIn as BdkTxIn;
use bdk::bitcoin::blockdata::transaction::TxOut as BdkTxOut;
use bdk::bitcoin::hashes::hex::{FromHex, ToHex};
use bdk::bitcoin::locktime::Error;
use bdk::bitcoin::util::address::{Payload as BdkPayload, WitnessVersion as BdkWitnessVersion};
use bdk::bitcoin::{Address as BdkAddress, OutPoint as BdkOutPoint, Txid};
use bdk::{Balance as BdkBalance, Error as BdkError};
use serde::{Deserialize, Serialize};
use std::str::FromStr;
use std::sync::Arc;
#[derive(Debug, Clone)]
pub struct TxIn {
    pub previous_output: OutPoint,
    pub script_sig: BdkScript,
    pub sequence: u32,
    pub witness: Vec<String>,
}

impl From<&BdkTxIn> for TxIn {
    fn from(x: &BdkTxIn) -> Self {
        TxIn {
            previous_output: x.previous_output.into(),
            script_sig: BdkScript {
                script_hex: x.script_sig.to_hex(),
            },
            sequence: x.sequence.0,
            witness: x
                .witness
                .to_vec()
                .iter()
                .map(|x| String::from_utf8(x.to_vec()).expect("Found invalid UTF-8"))
                .collect(),
        }
    }
}

///A transaction output, which defines new coins to be created from old ones.
pub struct TxOut {
    /// The value of the output, in satoshis.
    pub value: u64,
    /// The address of the output.
    pub script_pubkey: BdkScript,
}
impl From<&BdkTxOut> for TxOut {
    fn from(x: &BdkTxOut) -> Self {
        TxOut {
            value: x.value,
            script_pubkey: BdkScript {
                script_hex: x.script_pubkey.to_hex(),
            },
        }
    }
}

/// A reference to a transaction output.
#[derive(Clone, Debug, PartialEq, Eq, Hash)]
pub struct OutPoint {
    /// The referenced transaction's txid.
    pub(crate) txid: String,
    /// The index of the referenced output in its transaction's vout.
    pub(crate) vout: u32,
}
impl From<&OutPoint> for BdkOutPoint {
    fn from(x: &OutPoint) -> BdkOutPoint {
        BdkOutPoint {
            txid: Txid::from_str(&x.clone().txid).unwrap(),
            vout: x.clone().vout,
        }
    }
}
impl From<BdkOutPoint> for OutPoint {
    fn from(x: BdkOutPoint) -> OutPoint {
        OutPoint {
            txid: x.txid.to_string(),
            vout: x.clone().vout,
        }
    }
}

/// Local Wallet's Balance
#[derive(Deserialize)]
pub struct Balance {
    // All coinbase outputs not yet matured
    pub immature: u64,
    /// Unconfirmed UTXOs generated by a wallet tx
    pub trusted_pending: u64,
    /// Unconfirmed UTXOs received from an external wallet
    pub untrusted_pending: u64,
    /// Confirmed and immediately spendable balance
    pub confirmed: u64,
    /// Get sum of trusted_pending and confirmed coins
    pub spendable: u64,
    /// Get the whole balance visible to the wallet
    pub total: u64,
}
impl From<BdkBalance> for Balance {
    fn from(bdk_balance: BdkBalance) -> Self {
        Balance {
            immature: bdk_balance.immature,
            trusted_pending: bdk_balance.trusted_pending,
            untrusted_pending: bdk_balance.untrusted_pending,
            confirmed: bdk_balance.confirmed,
            spendable: bdk_balance.get_spendable(),
            total: bdk_balance.get_total(),
        }
    }
}

/// The address index selection strategy to use to derived an address from the wallet's external
/// descriptor.
pub enum AddressIndex {
    ///Return a new address after incrementing the current descriptor index.
    New,
    ///Return the address for the current descriptor index if it has not been used in a received transaction. Otherwise return a new address as with AddressIndex.New.
    ///Use with caution, if the wallet has not yet detected an address has been used it could return an already used address. This function is primarily meant for situations where the caller is untrusted; for example when deriving donation addresses on-demand for a public web page.
    LastUnused,
    /// Return the address for a specific descriptor index. Does not change the current descriptor
    /// index used by `AddressIndex` and `AddressIndex.LastUsed`.
    /// Use with caution, if an index is given that is less than the current descriptor index
    /// then the returned address may have already been used.
    Peek { index: u32 },
    /// Return the address for a specific descriptor index and reset the current descriptor index
    /// used by `AddressIndex` and `AddressIndex.LastUsed` to this value.
    /// Use with caution, if an index is given that is less than the current descriptor index
    /// then the returned address and subsequent addresses returned by calls to `AddressIndex`
    /// and `AddressIndex.LastUsed` may have already been used. Also if the index is reset to a
    /// value earlier than the Blockchain stopGap (default is 20) then a
    /// larger stopGap should be used to monitor for all possibly used addresses.
    Reset { index: u32 },
}
impl From<AddressIndex> for bdk::wallet::AddressIndex {
    fn from(x: AddressIndex) -> bdk::wallet::AddressIndex {
        match x {
            AddressIndex::New => bdk::wallet::AddressIndex::New,
            AddressIndex::LastUnused => bdk::wallet::AddressIndex::LastUnused,
            AddressIndex::Peek { index } => bdk::wallet::AddressIndex::Peek(index),
            AddressIndex::Reset { index } => bdk::wallet::AddressIndex::Reset(index),
        }
    }
}

///A derived address and the index it was found at For convenience this automatically derefs to Address
pub struct AddressInfo {
    ///Child index of this address
    pub index: u32,
    /// Address
    pub address: String,
}
impl From<bdk::wallet::AddressInfo> for AddressInfo {
    fn from(x: bdk::wallet::AddressInfo) -> AddressInfo {
        AddressInfo {
            index: x.index,
            address: x.address.to_string(),
        }
    }
}

#[derive(Debug, Clone, PartialEq, Eq, Default, Serialize)]
///A wallet transaction
pub struct TransactionDetails {
    /// Transaction id.
    pub txid: String,
    /// Received value (sats)
    /// Sum of owned outputs of this transaction.
    pub received: u64,
    /// Sent value (sats)
    /// Sum of owned inputs of this transaction.
    pub sent: u64,
    /// Fee value (sats) if confirmed.
    /// The availability of the fee depends on the backend. It's never None with an Electrum
    /// Server backend, but it could be None with a Bitcoin RPC node without txindex that receive
    /// funds while offline.
    pub fee: Option<u64>,
    /// If the transaction is confirmed, contains height and timestamp of the block containing the
    /// transaction, unconfirmed transaction contains `None`.
    pub confirmation_time: Option<BlockTime>,
}
/// A wallet transaction
impl From<&bdk::TransactionDetails> for TransactionDetails {
    fn from(x: &bdk::TransactionDetails) -> TransactionDetails {
        TransactionDetails {
            fee: x.clone().fee,
            txid: x.clone().txid.to_string(),
            received: x.clone().received,
            sent: x.clone().sent,
            confirmation_time: set_block_time(x.confirmation_time.clone()),
        }
    }
}

fn set_block_time(time: Option<bdk::BlockTime>) -> Option<BlockTime> {
    if let Some(time) = time {
        Some(time.into())
    } else {
        None
    }
}

#[derive(Debug, Clone, PartialEq, Eq, Deserialize, Serialize)]
///Block height and timestamp of a block
pub struct BlockTime {
    ///Confirmation block height
    pub height: u32,
    ///Confirmation block timestamp
    pub timestamp: u64,
}

impl From<bdk::BlockTime> for BlockTime {
    fn from(x: bdk::BlockTime) -> Self {
        BlockTime {
            height: x.height,
            timestamp: x.timestamp,
        }
    }
}

/// A output script and an amount of satoshis.
pub struct ScriptAmount {
    pub script: BdkScript,
    pub amount: u64,
}

#[allow(dead_code)]
#[derive(Clone, Debug)]
pub enum RbfValue {
    RbfDefault,
    Value(u32),
}

/// The result after calling the TxBuilder finish() function. Contains unsigned PSBT and
/// transaction details.
pub struct BdkTxBuilderResult(pub String, pub TransactionDetails);

///Types of keychains
pub enum KeychainKind {
    External,
    ///Internal, usually used for change outputs
    Internal,
}
impl From<bdk::KeychainKind> for KeychainKind {
    fn from(e: bdk::KeychainKind) -> Self {
        match e {
            bdk::KeychainKind::External => KeychainKind::External,
            bdk::KeychainKind::Internal => KeychainKind::Internal,
        }
    }
}
impl From<KeychainKind> for bdk::KeychainKind {
    fn from(kind: KeychainKind) -> Self {
        match kind {
            KeychainKind::External => bdk::KeychainKind::External,
            KeychainKind::Internal => bdk::KeychainKind::Internal,
        }
    }
}

#[derive(Clone)]
///The cryptocurrency to act on
pub enum Network {
    ///Bitcoin’s testnet
    Testnet,
    ///Bitcoin’s regtest
    Regtest,
    ///Classic Bitcoin
    Bitcoin,
    ///Bitcoin’s signet
    Signet,
}
impl Default for Network {
    fn default() -> Self {
        Network::Testnet
    }
}
impl From<Network> for bdk::bitcoin::Network {
    fn from(network: Network) -> Self {
        match network {
            Network::Signet => bdk::bitcoin::Network::Signet,
            Network::Testnet => bdk::bitcoin::Network::Testnet,
            Network::Regtest => bdk::bitcoin::Network::Regtest,
            Network::Bitcoin => bdk::bitcoin::Network::Bitcoin,
        }
    }
}
impl From<bdk::bitcoin::Network> for Network {
    fn from(network: bdk::bitcoin::Network) -> Self {
        match network {
            bdk::bitcoin::Network::Signet => Network::Signet,
            bdk::bitcoin::Network::Testnet => Network::Testnet,
            bdk::bitcoin::Network::Regtest => Network::Regtest,
            bdk::bitcoin::Network::Bitcoin => Network::Bitcoin,
        }
    }
}

///Type describing entropy length (aka word count) in the mnemonic
pub enum WordCount {
    ///12 words mnemonic (128 bits entropy)
    Words12,
    ///18 words mnemonic (192 bits entropy)
    Words18,
    ///24 words mnemonic (256 bits entropy)
    Words24,
}
impl From<WordCount> for bdk::keys::bip39::WordCount {
    fn from(word_count: WordCount) -> Self {
        match word_count {
            WordCount::Words12 => bdk::keys::bip39::WordCount::Words12,
            WordCount::Words18 => bdk::keys::bip39::WordCount::Words18,
            WordCount::Words24 => bdk::keys::bip39::WordCount::Words24,
        }
    }
}
pub struct Address {
    pub address: BdkAddress,
}
impl Address {
    pub fn new(address: String) -> Result<Self, BdkError> {
        BdkAddress::from_str(address.as_str())
            .map(|a| Address { address: a })
            .map_err(|e| BdkError::Generic(e.to_string()))
    }

    pub fn from_script(script: BdkScript, network: Network) -> Result<Self, BdkError> {
        BdkAddress::from_script(&script.into(), network.into())
            .map(|a| Address { address: a })
            .map_err(|e| BdkError::Generic(e.to_string()))
    }
    pub fn payload(&self) -> Payload {
        match &self.address.payload.clone() {
            BdkPayload::PubkeyHash(pubkey_hash) => Payload::PubkeyHash {
                pubkey_hash: pubkey_hash.to_vec(),
            },
            BdkPayload::ScriptHash(script_hash) => Payload::ScriptHash {
                script_hash: script_hash.to_vec(),
            },
            BdkPayload::WitnessProgram { version, program } => Payload::WitnessProgram {
                version: version.to_owned().into(),
                program: program.clone(),
            },
        }
    }

    pub fn network(&self) -> Network {
        self.address.network.into()
    }

    pub fn script_pubkey(&self) -> Arc<bdk::bitcoin::Script> {
        Arc::new(self.address.script_pubkey())
    }
}
/// A Bitcoin script.
#[derive(Clone, Default, Debug)]
pub struct BdkScript {
    pub script_hex: String,
}
impl BdkScript {
    pub fn new(raw_output_script: Vec<u8>) -> Result<BdkScript, Error> {
        let script = bdk::bitcoin::Script::from(raw_output_script);
        Ok(BdkScript {
            script_hex: script.to_hex(),
        })
    }
}

impl From<BdkScript> for bdk::bitcoin::Script {
    fn from(value: BdkScript) -> Self {
        bdk::bitcoin::Script::from_hex(value.script_hex.as_str()).unwrap()
    }
}

#[derive(Debug, Clone)]
pub enum WitnessVersion {
    /// Initial version of witness program. Used for P2WPKH and P2WPK outputs
    V0 = 0,
    /// Version of witness program used for Taproot P2TR outputs.
    V1 = 1,
    /// Future (unsupported) version of witness program.
    V2 = 2,
    /// Future (unsupported) version of witness program.
    V3 = 3,
    /// Future (unsupported) version of witness program.
    V4 = 4,
    /// Future (unsupported) version of witness program.
    V5 = 5,
    /// Future (unsupported) version of witness program.
    V6 = 6,
    /// Future (unsupported) version of witness program.
    V7 = 7,
    /// Future (unsupported) version of witness program.
    V8 = 8,
    /// Future (unsupported) version of witness program.
    V9 = 9,
    /// Future (unsupported) version of witness program.
    V10 = 10,
    /// Future (unsupported) version of witness program.
    V11 = 11,
    /// Future (unsupported) version of witness program.
    V12 = 12,
    /// Future (unsupported) version of witness program.
    V13 = 13,
    /// Future (unsupported) version of witness program.
    V14 = 14,
    /// Future (unsupported) version of witness program.
    V15 = 15,
    /// Future (unsupported) version of witness program.
    V16 = 16,
}
impl From<BdkWitnessVersion> for WitnessVersion {
    fn from(value: BdkWitnessVersion) -> Self {
        match value {
            BdkWitnessVersion::V0 => WitnessVersion::V0,
            BdkWitnessVersion::V1 => WitnessVersion::V1,
            BdkWitnessVersion::V2 => WitnessVersion::V2,
            BdkWitnessVersion::V3 => WitnessVersion::V3,
            BdkWitnessVersion::V4 => WitnessVersion::V4,
            BdkWitnessVersion::V5 => WitnessVersion::V5,
            BdkWitnessVersion::V6 => WitnessVersion::V6,
            BdkWitnessVersion::V7 => WitnessVersion::V7,
            BdkWitnessVersion::V8 => WitnessVersion::V8,
            BdkWitnessVersion::V9 => WitnessVersion::V9,
            BdkWitnessVersion::V10 => WitnessVersion::V10,
            BdkWitnessVersion::V11 => WitnessVersion::V11,
            BdkWitnessVersion::V12 => WitnessVersion::V12,
            BdkWitnessVersion::V13 => WitnessVersion::V13,
            BdkWitnessVersion::V14 => WitnessVersion::V14,
            BdkWitnessVersion::V15 => WitnessVersion::V15,
            BdkWitnessVersion::V16 => WitnessVersion::V16,
        }
    }
}
/// The method used to produce an address.
#[derive(Debug)]
pub enum Payload {
    /// P2PKH address.
    PubkeyHash { pubkey_hash: Vec<u8> },
    /// P2SH address.
    ScriptHash { script_hash: Vec<u8> },
    /// Segwit address.
    WitnessProgram {
        /// The witness program version.
        version: WitnessVersion,
        /// The witness program.
        program: Vec<u8>,
    },
}
