import 'package:bdk_flutter/bdk_flutter.dart';
import 'package:bdk_flutter/src/utils/exceptions/blockchain_exception.dart';
import 'package:bdk_flutter/src/utils/exceptions/key_exception.dart';
import 'package:bdk_flutter/src/utils/exceptions/path_exception.dart';
import 'package:bdk_flutter/src/utils/exceptions/tx_builder_exception.dart';
import 'package:bdk_flutter/src/utils/exceptions/wallet_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'bdk_flutter_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Wallet>()])
@GenerateNiceMocks([MockSpec<Blockchain>()])
@GenerateNiceMocks([MockSpec<DescriptorSecretKey>()])
@GenerateNiceMocks([MockSpec<DescriptorPublicKey>()])
@GenerateNiceMocks([MockSpec<PartiallySignedBitcoinTransaction>()])
@GenerateNiceMocks([MockSpec<TxBuilder>()])
@GenerateNiceMocks([MockSpec<BumpFeeTxBuilder>()])
@GenerateNiceMocks([MockSpec<Script>()])
@GenerateNiceMocks([MockSpec<Address>()])
@GenerateNiceMocks([MockSpec<BdkFlutter>()])
@GenerateNiceMocks([MockSpec<DerivationPath>()])
abstract class BdkFlutter {
  Future<String> generateMnemonic({required WordCount wordCount});
}

void main() {
  final mockWallet = MockWallet();
  final mockSDescriptorSecret = MockDescriptorSecretKey();
  final mockSDescriptorPublic = MockDescriptorPublicKey();
  final mockBlockchain = MockBlockchain();
  final mockBdkFlutter = MockBdkFlutter();
  final mockDerivationPath = MockDerivationPath();
  final mockTxBuilder = MockTxBuilder();
  final mockAddress = MockAddress();
  final mockBumpFeeTxBuilder = MockBumpFeeTxBuilder();
  final mockScript = MockScript();
  String DEFAULT_DERIVATION_PATH = "m/84'/1'/0'";
  group('Generate Mnemonic', () {
    test('verify  word count', () async {
      when(mockBdkFlutter.generateMnemonic(wordCount: WordCount.WORDS12))
          .thenAnswer((_) async =>
              'puppy interest whip tonight dad never sudden response push zone pig patch');
      final res =
          await mockBdkFlutter.generateMnemonic(wordCount: WordCount.WORDS12);
      final wordCount = res.split(' ');
      expect(wordCount.length, 12);
    });
    test('verify generated mnemonic', () async {
      const mnemonic =
          "uncover melt orient double buyer birth run glad unhappy sport dizzy squeeze top offer axis rare bulk item";
      when(mockBdkFlutter.generateMnemonic(wordCount: WordCount.WORDS12))
          .thenAnswer((_) async => mnemonic);
      final res =
          await mockBdkFlutter.generateMnemonic(wordCount: WordCount.WORDS12);
      expect(mnemonic, res);
    });
  });
  group('Blockchain', () {
    test('verify create', () async {
      final defaultConfig = BlockchainConfig.electrum(
          config: ElectrumConfig(
              stopGap: 10,
              timeout: 5,
              retry: 5,
              url: "ssl://electrum.blockstream.info:60002"));
      when(mockBlockchain.create(config: defaultConfig))
          .thenAnswer((_) async => Blockchain());
      final res = await mockBlockchain.create(config: defaultConfig);
      expect(res, isA<Blockchain>());
    });
    test('verify getHeight', () async {
      when(mockBlockchain.getHeight()).thenAnswer((_) async => 2396450);
      final res = await mockBlockchain.getHeight();
      expect(res, 2396450);
    });
    test('getHeight Exception', () async {
      try {
        when(mockBlockchain.getHeight()).thenThrow(
            const BlockchainException.unexpected("Blockchain not initialized"));
        await mockBlockchain.getHeight();
      } catch (error) {
        expect(error,
            const BlockchainException.unexpected("Blockchain not initialized"));
        expect(error, isA<BlockchainException>());
      }
    });

    test('verify getHash', () async {
      when(mockBlockchain.getBlockHash(any)).thenAnswer((_) async =>
          "0000000000004c01f2723acaa5e87467ebd2768cc5eadcf1ea0d0c4f1731efce");
      final res = await mockBlockchain.getBlockHash(2396450);
      expect(res,
          "0000000000004c01f2723acaa5e87467ebd2768cc5eadcf1ea0d0c4f1731efce");
    });
    test('verify getHash  Exception', () async {
      try {
        when(mockBlockchain.getBlockHash(any)).thenThrow(
            const BlockchainException.unexpected("Blockchain not initialized"));
        await mockBlockchain.getHeight();
      } catch (error) {
        expect(error,
            const BlockchainException.unexpected("Blockchain not initialized"));
        expect(error, isA<BlockchainException>());
      }
    });
  });
  group('Wallet', () {
    test('Should return valid AddressInfo Object', () async {
      final res = await mockWallet.getAddress(addressIndex: AddressIndex.New);
      expect(res, isA<AddressInfo>());
    });
    test('verify getAddress() Exception', () async {
      try {
        when(mockWallet.getAddress(addressIndex: AddressIndex.New)).thenThrow(
            const WalletException.unexpected("Wallet not initialized"));
        await mockWallet.getAddress(addressIndex: AddressIndex.New);
      } catch (error) {
        expect(
            error, const WalletException.unexpected("Wallet not initialized"));
        expect(error, isA<WalletException>());
      }
    });
    test('Should return a new AddressInfo', () async {
      when(mockWallet.getAddress(addressIndex: AddressIndex.New)).thenAnswer(
          (e) async => AddressInfo(
              index: 82,
              address: "tb1qzn0qsh9wdp0m7sx877p9u8kptnvmykm9ld5lyd"));
      final res = await mockWallet.getAddress(addressIndex: AddressIndex.New);
      expect(res.index, 82);
      expect(res.address, "tb1qzn0qsh9wdp0m7sx877p9u8kptnvmykm9ld5lyd");
    });
    test('Should return a last unused AddressInfo', () async {
      when(mockWallet.getAddress(addressIndex: AddressIndex.LastUnused))
          .thenAnswer((e) async => AddressInfo(
              index: 82,
              address: "tb1qzn0qsh9wdp0m7sx877p9u8kptnvmykm9ld5lyd"));
      final res =
          await mockWallet.getAddress(addressIndex: AddressIndex.LastUnused);
      expect(res.index, 82);
      expect(res.address, "tb1qzn0qsh9wdp0m7sx877p9u8kptnvmykm9ld5lyd");
    });
    test('Should return valid Balance object', () async {
      final res = await mockWallet.getBalance();
      expect(res, isA<Balance>());
    });
    test('verify getBalance() Exception', () async {
      try {
        when(mockWallet.getBalance()).thenThrow(
            const WalletException.unexpected("Wallet not initialized"));
        await mockWallet.getBalance();
      } catch (error) {
        expect(
            error, const WalletException.unexpected("Wallet not initialized"));
        expect(error, isA<WalletException>());
      }
    });
    test('Should return Network enum', () async {
      final res = await mockWallet.network();
      expect(res, isA<Network>());
    });
    test('verify network() Exception', () async {
      try {
        when(mockWallet.network()).thenThrow(
            const WalletException.unexpected("Wallet not initialized"));
        await mockWallet.network();
      } catch (error) {
        expect(
            error, const WalletException.unexpected("Wallet not initialized"));
        expect(error, isA<WalletException>());
      }
    });
    test('Should return list of LocalUtxo object', () async {
      final res = await mockWallet.listUnspent();
      expect(res, isA<List<LocalUtxo>>());
    });
    test('verify listUnspent() Exception', () async {
      try {
        when(mockWallet.listUnspent()).thenThrow(
            const WalletException.unexpected("Wallet not initialized"));
        await mockWallet.listUnspent();
      } catch (error) {
        expect(
            error, const WalletException.unexpected("Wallet not initialized"));
        expect(error, isA<WalletException>());
      }
    });
    test('Should return an empty list of TransactionDetails', () async {
      when(mockWallet.listTransactions()).thenAnswer((e) async => List.empty());
      final res = await mockWallet.listTransactions();
      expect(res, isA<List<TransactionDetails>>());
      expect(res, List.empty());
    });
    test('verify listTransactions() Exception', () async {
      try {
        when(mockWallet.listUnspent()).thenThrow(
            const WalletException.unexpected("Wallet not initialized"));
        await mockWallet.listUnspent();
      } catch (error) {
        expect(
            error, const WalletException.unexpected("Wallet not initialized"));
        expect(error, isA<WalletException>());
      }
    });
    test('verify function call order', () async {
      await mockWallet.sync(mockBlockchain);
      await mockWallet.listTransactions();
      verifyInOrder([
        await mockWallet.sync(mockBlockchain),
        await mockWallet.listTransactions()
      ]);
    });
  });
  group('DescriptorSecret', () {
    test('verify derive()', () async {
      final path =
          await mockDerivationPath.create(path: DEFAULT_DERIVATION_PATH);
      final res = await mockSDescriptorSecret.derive(path);
      expect(res, isA<DescriptorSecretKey>());
    });
    test('verify extend()', () async {
      final path =
          await mockDerivationPath.create(path: DEFAULT_DERIVATION_PATH);
      final res = await mockSDescriptorSecret.extend(path);
      expect(res, isA<DescriptorSecretKey>());
    });
    test('verify asPublic()', () async {
      final res = await mockSDescriptorSecret.asPublic();
      expect(res, isA<DescriptorPublicKey>());
    });
    test('verify asString', () async {
      final res = await mockSDescriptorSecret.asString();
      expect(res, isA<String>());
    });
  });
  group('DescriptorPublic', () {
    test('verify derive()', () async {
      final path =
          await mockDerivationPath.create(path: DEFAULT_DERIVATION_PATH);
      final res = await mockSDescriptorPublic.derive(path);
      expect(res, isA<DescriptorPublicKey>());
    });
    test('verify extend()', () async {
      final path =
          await mockDerivationPath.create(path: DEFAULT_DERIVATION_PATH);
      final res = await mockSDescriptorPublic.extend(path);
      expect(res, isA<DescriptorPublicKey>());
    });
    test('verify asString', () async {
      final res = mockSDescriptorPublic.asString();
      expect(res, isA<String>());
    });
  });
  group('Tx Builder', () {
    test('Should return a TxBuilderException when funds are insufficient',
        () async {
      try {
        when(mockTxBuilder.finish(mockWallet)).thenThrow(
            const TxBuilderException.insufficientBroadcastAmount(
                "InsufficientFunds { needed: 1252, available: 0 }"));
        await mockTxBuilder.finish(mockWallet);
      } catch (error) {
        expect(
            error,
            const TxBuilderException.insufficientBroadcastAmount(
                "InsufficientFunds { needed: 1252, available: 0 }"));
        expect(error, isA<TxBuilderException>());
      }
    });
    test('Should return aTxBuilderException when no recipients are added',
        () async {
      try {
        when(mockTxBuilder.finish(mockWallet)).thenThrow(
            const TxBuilderException.unexpected("No Recipients Added"));
        await mockTxBuilder.finish(mockWallet);
      } catch (error) {
        expect(
            error, const TxBuilderException.unexpected("No Recipients Added"));
        expect(error, isA<TxBuilderException>());
      }
    });
    test('Verify addData() Exception', () async {
      try {
        when(mockTxBuilder.addData(data: List.empty())).thenThrow(
            const TxBuilderException.unexpected("List must not be empty"));
        await mockTxBuilder.addData(data: []);
      } catch (error) {
        expect(error,
            const TxBuilderException.unexpected("List must not be empty"));
        expect(error, isA<TxBuilderException>());
      }
    });
    test('Verify addRecipient() Exception', () async {
      try {
        when(mockTxBuilder.addRecipient(any, any)).thenThrow(
            const KeyException.unexpected("Script key not initialized yet"));
        mockTxBuilder.addRecipient(mockScript, 1200);
      } catch (error) {
        expect(error,
            const KeyException.unexpected("Script key not initialized yet"));
        expect(error, isA<KeyException>());
      }
    });
    test('Verify unSpendable()', () async {
      final res = mockTxBuilder.addUnSpendable(OutPoint(
          txid:
              "efc5d0e6ad6611f22b05d3c1fc8888c3552e8929a4231f2944447e4426f52056",
          vout: 1));
      expect(res, isNot(mockTxBuilder));
    });
    test('Verify necessary function are called for a  psbt transaction ',
        () async {
      await mockAddress.create(address: "2N4eQYCbKUHCCTUjBJeHcJp9ok6J2GZsTDt");
      final script = await mockAddress.scriptPubKey();
      mockTxBuilder.addRecipient(script, 1200);
      mockTxBuilder.feeRate(1.2);
      await mockTxBuilder.finish(mockWallet);

      verify(mockAddress.create(address: "2N4eQYCbKUHCCTUjBJeHcJp9ok6J2GZsTDt"))
          .called(1);
      verify(mockAddress.scriptPubKey()).called(1);
      verify(mockTxBuilder.addRecipient(mockScript, 1200)).called(1);
      verify(mockTxBuilder.feeRate(any)).called(1);
    });
    test('Create a proper psbt transaction ', () async {
      const psbt = "cHNidP8BAHEBAAAAAfU6uDG8hNUox2Qw1nodiir"
          "QhnLkDCYpTYfnY4+lUgjFAAAAAAD+////Ag5EAAAAAAAAFgAUxYD3fd+pId3hWxeuvuWmiUlS+1PoAwAAAAAAABYAFP+dpWfmLzDqhlT6HV+9R774474TxqQkAAABAN4"
          "BAAAAAAEBViD1JkR+REQpHyOkKYkuVcOIiPzB0wUr8hFmrebQxe8AAAAAAP7///8ClEgAAAAAAAAWABTwV07KrKa1zWpwKzW+ve93pbQ4R+gDAAAAAAAAFgAU/52lZ+YvMOqGVPodX71Hv"
          "vjjvhMCRzBEAiAa6a72jEfDuiyaNtlBYAxsc2oSruDWF2vuNQ3rJSshggIgLtJ/YuB8FmhjrPvTC9r2w9gpdfUNLuxw/C7oqo95cEIBIQM9XzutA2SgZFHjPDAATuWwHg19TTkb/NKZD/"
          "hfN7fWP8akJAABAR+USAAAAAAAABYAFPBXTsqsprXNanArNb6973eltDhHIgYCHrxaLpnD4ed01bFHcixnAicv15oKiiVHrcVmxUWBW54Y2R5q3VQAAIABAACAAAAAgAEAAABbAAAAACICAqS"
          "F0mhBBlgMe9OyICKlkhGHZfPjA0Q03I559ccj9x6oGNkeat1UAACAAQAAgAAAAIABAAAAXAAAAAAA";
      when(mockAddress.create(address: "2N4eQYCbKUHCCTUjBJeHcJp9ok6J2GZsTDt"))
          .thenAnswer((_) async => mockAddress);
      when(mockAddress.scriptPubKey()).thenAnswer((_) async => mockScript);
      when(mockTxBuilder.addRecipient(mockScript, any))
          .thenReturn(mockTxBuilder);
      when(mockTxBuilder.finish(mockWallet)).thenAnswer(
          (_) async => PartiallySignedBitcoinTransaction(psbtBase64: psbt));
      final address = await mockAddress.create(
          address: "2N4eQYCbKUHCCTUjBJeHcJp9ok6J2GZsTDt");
      final script = await address.scriptPubKey();
      final txBuilder = mockTxBuilder.addRecipient(script, 1200);
      final res = await txBuilder.finish(mockWallet);
      expect(res.psbtBase64, psbt);
    });
  });
  group('Bump Fee Tx Builder', () {
    test('Should return a TxBuilderException when txid is invalid', () async {
      try {
        when(mockBumpFeeTxBuilder.finish(mockWallet))
            .thenThrow(const TxBuilderException.invalidTxid("Invalid Txid"));
        await mockBumpFeeTxBuilder.finish(mockWallet);
      } catch (error) {
        expect(error, const TxBuilderException.invalidTxid("Invalid Txid"));
        expect(error, isA<TxBuilderException>());
      }
    });
  });
  group('Address', () {
    test('verify create()', () async {
      when(mockAddress.create(
              address: "tb1ql7w62elx9ucw4pj5lgw4l028hmuw80sndtntxt"))
          .thenAnswer((_) async => mockAddress);
      final res = await mockAddress.create(
          address: "tb1ql7w62elx9ucw4pj5lgw4l028hmuw80sndtntxt");
      expect(res, isA<Address>());
    });
    test('verify create() exception', () async {
      try {
        when(mockAddress.create(
                address: "tb1ql7w62elx9ucw4pj5lgw4l028hmuw80sndtntxt"))
            .thenThrow(const WalletException.invalidAddress("Invalid address"));
        await mockAddress.create(
            address: "tb1ql7w62elx9ucw4pj5lgw4l028hmuw80sndtntxt");
      } catch (error) {
        expect(error, const WalletException.invalidAddress("Invalid address"));
        expect(error, isA<WalletException>());
      }
    });
    test('verify scriptPubKey()', () async {
      when(mockAddress.scriptPubKey()).thenAnswer((_) async => mockScript);
      final res = await mockAddress.scriptPubKey();
      expect(res, isA<Script>());
    });
  });
  group('Derivation Path', () {
    test('verify create()', () async {
      when(mockDerivationPath.create(path: DEFAULT_DERIVATION_PATH))
          .thenAnswer((_) async => mockDerivationPath);
      final res =
          await mockDerivationPath.create(path: DEFAULT_DERIVATION_PATH);
      expect(res, isA<DerivationPath>());
    });
    test('verify create() exception', () async {
      try {
        when(mockDerivationPath.create(path: DEFAULT_DERIVATION_PATH))
            .thenThrow(
                const PathException.invalidPath("Invalid Derivation Path"));
        await mockDerivationPath.create(path: DEFAULT_DERIVATION_PATH);
      } catch (error) {
        expect(
            error, const PathException.invalidPath("Invalid Derivation Path"));
        expect(error, isA<PathException>());
      }
    });
  });
  group('Script', () {
    test('verify create', () async {
      final res = mockScript;
      expect(res, isA<MockScript>());
    });
  });
}
