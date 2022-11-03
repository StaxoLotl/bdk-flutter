// Mocks generated by Mockito 5.3.2 from annotations
// in bdk_flutter/example/ios/.symlinks/plugins/bdk_flutter/test/bdk_flutter_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;
import 'dart:typed_data' as _i4;

import 'package:bdk_flutter/bdk_flutter.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

import 'bdk_flutter_test.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeWallet_0 extends _i1.SmartFake implements _i2.Wallet {
  _FakeWallet_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAddressInfo_1 extends _i1.SmartFake implements _i2.AddressInfo {
  _FakeAddressInfo_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBalance_2 extends _i1.SmartFake implements _i2.Balance {
  _FakeBalance_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBlockchain_3 extends _i1.SmartFake implements _i2.Blockchain {
  _FakeBlockchain_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDescriptorSecretKey_4 extends _i1.SmartFake
    implements _i2.DescriptorSecretKey {
  _FakeDescriptorSecretKey_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDescriptorPublicKey_5 extends _i1.SmartFake
    implements _i2.DescriptorPublicKey {
  _FakeDescriptorPublicKey_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePartiallySignedBitcoinTransaction_6 extends _i1.SmartFake
    implements _i2.PartiallySignedBitcoinTransaction {
  _FakePartiallySignedBitcoinTransaction_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTxBuilder_7 extends _i1.SmartFake implements _i2.TxBuilder {
  _FakeTxBuilder_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBumpFeeTxBuilder_8 extends _i1.SmartFake
    implements _i2.BumpFeeTxBuilder {
  _FakeBumpFeeTxBuilder_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeScript_9 extends _i1.SmartFake implements _i2.Script {
  _FakeScript_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAddress_10 extends _i1.SmartFake implements _i2.Address {
  _FakeAddress_10(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDerivationPath_11 extends _i1.SmartFake
    implements _i2.DerivationPath {
  _FakeDerivationPath_11(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [Wallet].
///
/// See the documentation for Mockito's code generation for more information.
class MockWallet extends _i1.Mock implements _i2.Wallet {
  @override
  _i3.Future<_i2.Wallet> create({
    required String? descriptor,
    String? changeDescriptor,
    required _i2.Network? network,
    required _i2.DatabaseConfig? databaseConfig,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #create,
          [],
          {
            #descriptor: descriptor,
            #changeDescriptor: changeDescriptor,
            #network: network,
            #databaseConfig: databaseConfig,
          },
        ),
        returnValue: _i3.Future<_i2.Wallet>.value(_FakeWallet_0(
          this,
          Invocation.method(
            #create,
            [],
            {
              #descriptor: descriptor,
              #changeDescriptor: changeDescriptor,
              #network: network,
              #databaseConfig: databaseConfig,
            },
          ),
        )),
        returnValueForMissingStub: _i3.Future<_i2.Wallet>.value(_FakeWallet_0(
          this,
          Invocation.method(
            #create,
            [],
            {
              #descriptor: descriptor,
              #changeDescriptor: changeDescriptor,
              #network: network,
              #databaseConfig: databaseConfig,
            },
          ),
        )),
      ) as _i3.Future<_i2.Wallet>);

  @override
  _i3.Future<_i2.AddressInfo> getAddress(
          {required _i2.AddressIndex? addressIndex}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAddress,
          [],
          {#addressIndex: addressIndex},
        ),
        returnValue: _i3.Future<_i2.AddressInfo>.value(_FakeAddressInfo_1(
          this,
          Invocation.method(
            #getAddress,
            [],
            {#addressIndex: addressIndex},
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<_i2.AddressInfo>.value(_FakeAddressInfo_1(
          this,
          Invocation.method(
            #getAddress,
            [],
            {#addressIndex: addressIndex},
          ),
        )),
      ) as _i3.Future<_i2.AddressInfo>);

  @override
  _i3.Future<_i2.Balance> getBalance() => (super.noSuchMethod(
        Invocation.method(
          #getBalance,
          [],
        ),
        returnValue: _i3.Future<_i2.Balance>.value(_FakeBalance_2(
          this,
          Invocation.method(
            #getBalance,
            [],
          ),
        )),
        returnValueForMissingStub: _i3.Future<_i2.Balance>.value(_FakeBalance_2(
          this,
          Invocation.method(
            #getBalance,
            [],
          ),
        )),
      ) as _i3.Future<_i2.Balance>);

  @override
  _i3.Future<_i2.Network> network() => (super.noSuchMethod(
        Invocation.method(
          #network,
          [],
        ),
        returnValue: _i3.Future<_i2.Network>.value(_i2.Network.TESTNET),
        returnValueForMissingStub:
            _i3.Future<_i2.Network>.value(_i2.Network.TESTNET),
      ) as _i3.Future<_i2.Network>);

  @override
  _i3.Future<List<_i2.LocalUtxo>> listUnspent() => (super.noSuchMethod(
        Invocation.method(
          #listUnspent,
          [],
        ),
        returnValue: _i3.Future<List<_i2.LocalUtxo>>.value(<_i2.LocalUtxo>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i2.LocalUtxo>>.value(<_i2.LocalUtxo>[]),
      ) as _i3.Future<List<_i2.LocalUtxo>>);

  @override
  _i3.Future<dynamic> sync(_i2.Blockchain? blockchain) => (super.noSuchMethod(
        Invocation.method(
          #sync,
          [blockchain],
        ),
        returnValue: _i3.Future<dynamic>.value(),
        returnValueForMissingStub: _i3.Future<dynamic>.value(),
      ) as _i3.Future<dynamic>);

  @override
  _i3.Future<List<_i2.TransactionDetails>> listTransactions() =>
      (super.noSuchMethod(
        Invocation.method(
          #listTransactions,
          [],
        ),
        returnValue: _i3.Future<List<_i2.TransactionDetails>>.value(
            <_i2.TransactionDetails>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i2.TransactionDetails>>.value(
                <_i2.TransactionDetails>[]),
      ) as _i3.Future<List<_i2.TransactionDetails>>);

  @override
  _i3.Future<String> sign(_i2.PartiallySignedBitcoinTransaction? psbt) =>
      (super.noSuchMethod(
        Invocation.method(
          #sign,
          [psbt],
        ),
        returnValue: _i3.Future<String>.value(''),
        returnValueForMissingStub: _i3.Future<String>.value(''),
      ) as _i3.Future<String>);
}

/// A class which mocks [Blockchain].
///
/// See the documentation for Mockito's code generation for more information.
class MockBlockchain extends _i1.Mock implements _i2.Blockchain {
  @override
  _i3.Future<String> getBlockHash(int? height) => (super.noSuchMethod(
        Invocation.method(
          #getBlockHash,
          [height],
        ),
        returnValue: _i3.Future<String>.value(''),
        returnValueForMissingStub: _i3.Future<String>.value(''),
      ) as _i3.Future<String>);

  @override
  _i3.Future<int> getHeight() => (super.noSuchMethod(
        Invocation.method(
          #getHeight,
          [],
        ),
        returnValue: _i3.Future<int>.value(0),
        returnValueForMissingStub: _i3.Future<int>.value(0),
      ) as _i3.Future<int>);

  @override
  _i3.Future<_i2.Blockchain> create({required _i2.BlockchainConfig? config}) =>
      (super.noSuchMethod(
        Invocation.method(
          #create,
          [],
          {#config: config},
        ),
        returnValue: _i3.Future<_i2.Blockchain>.value(_FakeBlockchain_3(
          this,
          Invocation.method(
            #create,
            [],
            {#config: config},
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<_i2.Blockchain>.value(_FakeBlockchain_3(
          this,
          Invocation.method(
            #create,
            [],
            {#config: config},
          ),
        )),
      ) as _i3.Future<_i2.Blockchain>);

  @override
  _i3.Future<void> broadcast(_i2.PartiallySignedBitcoinTransaction? psbt) =>
      (super.noSuchMethod(
        Invocation.method(
          #broadcast,
          [psbt],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [DescriptorSecretKey].
///
/// See the documentation for Mockito's code generation for more information.
class MockDescriptorSecretKey extends _i1.Mock
    implements _i2.DescriptorSecretKey {
  @override
  _i2.Network get network => (super.noSuchMethod(
        Invocation.getter(#network),
        returnValue: _i2.Network.TESTNET,
        returnValueForMissingStub: _i2.Network.TESTNET,
      ) as _i2.Network);

  @override
  String get mnemonic => (super.noSuchMethod(
        Invocation.getter(#mnemonic),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);

  @override
  set password(String? _password) => super.noSuchMethod(
        Invocation.setter(
          #password,
          _password,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.Future<_i2.DescriptorSecretKey> derive(
          _i2.DerivationPath? derivationPath) =>
      (super.noSuchMethod(
        Invocation.method(
          #derive,
          [derivationPath],
        ),
        returnValue: _i3.Future<_i2.DescriptorSecretKey>.value(
            _FakeDescriptorSecretKey_4(
          this,
          Invocation.method(
            #derive,
            [derivationPath],
          ),
        )),
        returnValueForMissingStub: _i3.Future<_i2.DescriptorSecretKey>.value(
            _FakeDescriptorSecretKey_4(
          this,
          Invocation.method(
            #derive,
            [derivationPath],
          ),
        )),
      ) as _i3.Future<_i2.DescriptorSecretKey>);

  @override
  _i3.Future<_i2.DescriptorSecretKey> extend(
          _i2.DerivationPath? derivationPath) =>
      (super.noSuchMethod(
        Invocation.method(
          #extend,
          [derivationPath],
        ),
        returnValue: _i3.Future<_i2.DescriptorSecretKey>.value(
            _FakeDescriptorSecretKey_4(
          this,
          Invocation.method(
            #extend,
            [derivationPath],
          ),
        )),
        returnValueForMissingStub: _i3.Future<_i2.DescriptorSecretKey>.value(
            _FakeDescriptorSecretKey_4(
          this,
          Invocation.method(
            #extend,
            [derivationPath],
          ),
        )),
      ) as _i3.Future<_i2.DescriptorSecretKey>);

  @override
  _i3.Future<_i2.DescriptorPublicKey> asPublic() => (super.noSuchMethod(
        Invocation.method(
          #asPublic,
          [],
        ),
        returnValue: _i3.Future<_i2.DescriptorPublicKey>.value(
            _FakeDescriptorPublicKey_5(
          this,
          Invocation.method(
            #asPublic,
            [],
          ),
        )),
        returnValueForMissingStub: _i3.Future<_i2.DescriptorPublicKey>.value(
            _FakeDescriptorPublicKey_5(
          this,
          Invocation.method(
            #asPublic,
            [],
          ),
        )),
      ) as _i3.Future<_i2.DescriptorPublicKey>);

  @override
  _i3.Future<List<int>> secretBytes() => (super.noSuchMethod(
        Invocation.method(
          #secretBytes,
          [],
        ),
        returnValue: _i3.Future<List<int>>.value(<int>[]),
        returnValueForMissingStub: _i3.Future<List<int>>.value(<int>[]),
      ) as _i3.Future<List<int>>);

  @override
  _i3.Future<String> asString() => (super.noSuchMethod(
        Invocation.method(
          #asString,
          [],
        ),
        returnValue: _i3.Future<String>.value(''),
        returnValueForMissingStub: _i3.Future<String>.value(''),
      ) as _i3.Future<String>);
}

/// A class which mocks [DescriptorPublicKey].
///
/// See the documentation for Mockito's code generation for more information.
class MockDescriptorPublicKey extends _i1.Mock
    implements _i2.DescriptorPublicKey {
  @override
  _i3.Future<_i2.DescriptorPublicKey> derive(
          _i2.DerivationPath? derivationPath) =>
      (super.noSuchMethod(
        Invocation.method(
          #derive,
          [derivationPath],
        ),
        returnValue: _i3.Future<_i2.DescriptorPublicKey>.value(
            _FakeDescriptorPublicKey_5(
          this,
          Invocation.method(
            #derive,
            [derivationPath],
          ),
        )),
        returnValueForMissingStub: _i3.Future<_i2.DescriptorPublicKey>.value(
            _FakeDescriptorPublicKey_5(
          this,
          Invocation.method(
            #derive,
            [derivationPath],
          ),
        )),
      ) as _i3.Future<_i2.DescriptorPublicKey>);

  @override
  _i3.Future<_i2.DescriptorPublicKey> extend(
          _i2.DerivationPath? derivationPath) =>
      (super.noSuchMethod(
        Invocation.method(
          #extend,
          [derivationPath],
        ),
        returnValue: _i3.Future<_i2.DescriptorPublicKey>.value(
            _FakeDescriptorPublicKey_5(
          this,
          Invocation.method(
            #extend,
            [derivationPath],
          ),
        )),
        returnValueForMissingStub: _i3.Future<_i2.DescriptorPublicKey>.value(
            _FakeDescriptorPublicKey_5(
          this,
          Invocation.method(
            #extend,
            [derivationPath],
          ),
        )),
      ) as _i3.Future<_i2.DescriptorPublicKey>);

  @override
  String asString() => (super.noSuchMethod(
        Invocation.method(
          #asString,
          [],
        ),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
}

/// A class which mocks [PartiallySignedBitcoinTransaction].
///
/// See the documentation for Mockito's code generation for more information.
class MockPartiallySignedBitcoinTransaction extends _i1.Mock
    implements _i2.PartiallySignedBitcoinTransaction {
  @override
  String get psbtBase64 => (super.noSuchMethod(
        Invocation.getter(#psbtBase64),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);

  @override
  set txDetails(_i2.TransactionDetails? _txDetails) => super.noSuchMethod(
        Invocation.setter(
          #txDetails,
          _txDetails,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.Future<String> txId() => (super.noSuchMethod(
        Invocation.method(
          #txId,
          [],
        ),
        returnValue: _i3.Future<String>.value(''),
        returnValueForMissingStub: _i3.Future<String>.value(''),
      ) as _i3.Future<String>);

  @override
  _i3.Future<List<int>> extractTx() => (super.noSuchMethod(
        Invocation.method(
          #extractTx,
          [],
        ),
        returnValue: _i3.Future<List<int>>.value(<int>[]),
        returnValueForMissingStub: _i3.Future<List<int>>.value(<int>[]),
      ) as _i3.Future<List<int>>);

  @override
  _i3.Future<_i2.PartiallySignedBitcoinTransaction> combine(
          _i2.PartiallySignedBitcoinTransaction? other) =>
      (super.noSuchMethod(
        Invocation.method(
          #combine,
          [other],
        ),
        returnValue: _i3.Future<_i2.PartiallySignedBitcoinTransaction>.value(
            _FakePartiallySignedBitcoinTransaction_6(
          this,
          Invocation.method(
            #combine,
            [other],
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<_i2.PartiallySignedBitcoinTransaction>.value(
                _FakePartiallySignedBitcoinTransaction_6(
          this,
          Invocation.method(
            #combine,
            [other],
          ),
        )),
      ) as _i3.Future<_i2.PartiallySignedBitcoinTransaction>);

  @override
  _i3.Future<String> serialize() => (super.noSuchMethod(
        Invocation.method(
          #serialize,
          [],
        ),
        returnValue: _i3.Future<String>.value(''),
        returnValueForMissingStub: _i3.Future<String>.value(''),
      ) as _i3.Future<String>);
}

/// A class which mocks [TxBuilder].
///
/// See the documentation for Mockito's code generation for more information.
class MockTxBuilder extends _i1.Mock implements _i2.TxBuilder {
  @override
  _i2.TxBuilder addData({required List<int>? data}) => (super.noSuchMethod(
        Invocation.method(
          #addData,
          [],
          {#data: data},
        ),
        returnValue: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #addData,
            [],
            {#data: data},
          ),
        ),
        returnValueForMissingStub: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #addData,
            [],
            {#data: data},
          ),
        ),
      ) as _i2.TxBuilder);

  @override
  _i2.TxBuilder addRecipient(
    _i2.Script? script,
    int? amount,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addRecipient,
          [
            script,
            amount,
          ],
        ),
        returnValue: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #addRecipient,
            [
              script,
              amount,
            ],
          ),
        ),
        returnValueForMissingStub: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #addRecipient,
            [
              script,
              amount,
            ],
          ),
        ),
      ) as _i2.TxBuilder);

  @override
  _i2.TxBuilder unSpendable(List<_i2.OutPoint>? outpoints) =>
      (super.noSuchMethod(
        Invocation.method(
          #unSpendable,
          [outpoints],
        ),
        returnValue: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #unSpendable,
            [outpoints],
          ),
        ),
        returnValueForMissingStub: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #unSpendable,
            [outpoints],
          ),
        ),
      ) as _i2.TxBuilder);

  @override
  _i2.TxBuilder addUtxo(_i2.OutPoint? outpoint) => (super.noSuchMethod(
        Invocation.method(
          #addUtxo,
          [outpoint],
        ),
        returnValue: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #addUtxo,
            [outpoint],
          ),
        ),
        returnValueForMissingStub: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #addUtxo,
            [outpoint],
          ),
        ),
      ) as _i2.TxBuilder);

  @override
  _i2.TxBuilder addUtxos(List<_i2.OutPoint>? outpoints) => (super.noSuchMethod(
        Invocation.method(
          #addUtxos,
          [outpoints],
        ),
        returnValue: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #addUtxos,
            [outpoints],
          ),
        ),
        returnValueForMissingStub: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #addUtxos,
            [outpoints],
          ),
        ),
      ) as _i2.TxBuilder);

  @override
  _i2.TxBuilder doNotSpendChange() => (super.noSuchMethod(
        Invocation.method(
          #doNotSpendChange,
          [],
        ),
        returnValue: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #doNotSpendChange,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #doNotSpendChange,
            [],
          ),
        ),
      ) as _i2.TxBuilder);

  @override
  _i2.TxBuilder drainTo(String? address) => (super.noSuchMethod(
        Invocation.method(
          #drainTo,
          [address],
        ),
        returnValue: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #drainTo,
            [address],
          ),
        ),
        returnValueForMissingStub: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #drainTo,
            [address],
          ),
        ),
      ) as _i2.TxBuilder);

  @override
  _i2.TxBuilder drainWallet() => (super.noSuchMethod(
        Invocation.method(
          #drainWallet,
          [],
        ),
        returnValue: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #drainWallet,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #drainWallet,
            [],
          ),
        ),
      ) as _i2.TxBuilder);

  @override
  _i2.TxBuilder enableRbfWithSequence(int? nSequence) => (super.noSuchMethod(
        Invocation.method(
          #enableRbfWithSequence,
          [nSequence],
        ),
        returnValue: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #enableRbfWithSequence,
            [nSequence],
          ),
        ),
        returnValueForMissingStub: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #enableRbfWithSequence,
            [nSequence],
          ),
        ),
      ) as _i2.TxBuilder);

  @override
  _i2.TxBuilder enableRbf() => (super.noSuchMethod(
        Invocation.method(
          #enableRbf,
          [],
        ),
        returnValue: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #enableRbf,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #enableRbf,
            [],
          ),
        ),
      ) as _i2.TxBuilder);

  @override
  _i2.TxBuilder feeAbsolute(int? feeAmount) => (super.noSuchMethod(
        Invocation.method(
          #feeAbsolute,
          [feeAmount],
        ),
        returnValue: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #feeAbsolute,
            [feeAmount],
          ),
        ),
        returnValueForMissingStub: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #feeAbsolute,
            [feeAmount],
          ),
        ),
      ) as _i2.TxBuilder);

  @override
  _i2.TxBuilder feeRate(double? satPerVbyte) => (super.noSuchMethod(
        Invocation.method(
          #feeRate,
          [satPerVbyte],
        ),
        returnValue: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #feeRate,
            [satPerVbyte],
          ),
        ),
        returnValueForMissingStub: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #feeRate,
            [satPerVbyte],
          ),
        ),
      ) as _i2.TxBuilder);

  @override
  _i2.TxBuilder setRecipients(List<_i2.ScriptAmount>? recipients) =>
      (super.noSuchMethod(
        Invocation.method(
          #setRecipients,
          [recipients],
        ),
        returnValue: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #setRecipients,
            [recipients],
          ),
        ),
        returnValueForMissingStub: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #setRecipients,
            [recipients],
          ),
        ),
      ) as _i2.TxBuilder);

  @override
  _i2.TxBuilder manuallySelectedOnly() => (super.noSuchMethod(
        Invocation.method(
          #manuallySelectedOnly,
          [],
        ),
        returnValue: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #manuallySelectedOnly,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #manuallySelectedOnly,
            [],
          ),
        ),
      ) as _i2.TxBuilder);

  @override
  _i2.TxBuilder addUnSpendable(_i2.OutPoint? unSpendable) =>
      (super.noSuchMethod(
        Invocation.method(
          #addUnSpendable,
          [unSpendable],
        ),
        returnValue: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #addUnSpendable,
            [unSpendable],
          ),
        ),
        returnValueForMissingStub: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #addUnSpendable,
            [unSpendable],
          ),
        ),
      ) as _i2.TxBuilder);

  @override
  _i2.TxBuilder onlySpendChange() => (super.noSuchMethod(
        Invocation.method(
          #onlySpendChange,
          [],
        ),
        returnValue: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #onlySpendChange,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeTxBuilder_7(
          this,
          Invocation.method(
            #onlySpendChange,
            [],
          ),
        ),
      ) as _i2.TxBuilder);

  @override
  _i3.Future<_i2.PartiallySignedBitcoinTransaction> finish(
          _i2.Wallet? wallet) =>
      (super.noSuchMethod(
        Invocation.method(
          #finish,
          [wallet],
        ),
        returnValue: _i3.Future<_i2.PartiallySignedBitcoinTransaction>.value(
            _FakePartiallySignedBitcoinTransaction_6(
          this,
          Invocation.method(
            #finish,
            [wallet],
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<_i2.PartiallySignedBitcoinTransaction>.value(
                _FakePartiallySignedBitcoinTransaction_6(
          this,
          Invocation.method(
            #finish,
            [wallet],
          ),
        )),
      ) as _i3.Future<_i2.PartiallySignedBitcoinTransaction>);
}

/// A class which mocks [BumpFeeTxBuilder].
///
/// See the documentation for Mockito's code generation for more information.
class MockBumpFeeTxBuilder extends _i1.Mock implements _i2.BumpFeeTxBuilder {
  @override
  String get txid => (super.noSuchMethod(
        Invocation.getter(#txid),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);

  @override
  double get feeRate => (super.noSuchMethod(
        Invocation.getter(#feeRate),
        returnValue: 0.0,
        returnValueForMissingStub: 0.0,
      ) as double);

  @override
  _i2.BumpFeeTxBuilder allowShrinking(String? address) => (super.noSuchMethod(
        Invocation.method(
          #allowShrinking,
          [address],
        ),
        returnValue: _FakeBumpFeeTxBuilder_8(
          this,
          Invocation.method(
            #allowShrinking,
            [address],
          ),
        ),
        returnValueForMissingStub: _FakeBumpFeeTxBuilder_8(
          this,
          Invocation.method(
            #allowShrinking,
            [address],
          ),
        ),
      ) as _i2.BumpFeeTxBuilder);

  @override
  _i2.BumpFeeTxBuilder enableRbfWithSequence(int? nSequence) =>
      (super.noSuchMethod(
        Invocation.method(
          #enableRbfWithSequence,
          [nSequence],
        ),
        returnValue: _FakeBumpFeeTxBuilder_8(
          this,
          Invocation.method(
            #enableRbfWithSequence,
            [nSequence],
          ),
        ),
        returnValueForMissingStub: _FakeBumpFeeTxBuilder_8(
          this,
          Invocation.method(
            #enableRbfWithSequence,
            [nSequence],
          ),
        ),
      ) as _i2.BumpFeeTxBuilder);

  @override
  _i2.BumpFeeTxBuilder enableRbf() => (super.noSuchMethod(
        Invocation.method(
          #enableRbf,
          [],
        ),
        returnValue: _FakeBumpFeeTxBuilder_8(
          this,
          Invocation.method(
            #enableRbf,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeBumpFeeTxBuilder_8(
          this,
          Invocation.method(
            #enableRbf,
            [],
          ),
        ),
      ) as _i2.BumpFeeTxBuilder);

  @override
  _i3.Future<_i2.PartiallySignedBitcoinTransaction> finish(
          _i2.Wallet? wallet) =>
      (super.noSuchMethod(
        Invocation.method(
          #finish,
          [wallet],
        ),
        returnValue: _i3.Future<_i2.PartiallySignedBitcoinTransaction>.value(
            _FakePartiallySignedBitcoinTransaction_6(
          this,
          Invocation.method(
            #finish,
            [wallet],
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<_i2.PartiallySignedBitcoinTransaction>.value(
                _FakePartiallySignedBitcoinTransaction_6(
          this,
          Invocation.method(
            #finish,
            [wallet],
          ),
        )),
      ) as _i3.Future<_i2.PartiallySignedBitcoinTransaction>);
}

/// A class which mocks [Script].
///
/// See the documentation for Mockito's code generation for more information.
class MockScript extends _i1.Mock implements _i2.Script {
  @override
  _i3.Future<_i2.Script> create(_i4.Uint8List? rawOutputScript) =>
      (super.noSuchMethod(
        Invocation.method(
          #create,
          [rawOutputScript],
        ),
        returnValue: _i3.Future<_i2.Script>.value(_FakeScript_9(
          this,
          Invocation.method(
            #create,
            [rawOutputScript],
          ),
        )),
        returnValueForMissingStub: _i3.Future<_i2.Script>.value(_FakeScript_9(
          this,
          Invocation.method(
            #create,
            [rawOutputScript],
          ),
        )),
      ) as _i3.Future<_i2.Script>);
}

/// A class which mocks [Address].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddress extends _i1.Mock implements _i2.Address {
  @override
  _i3.Future<_i2.Address> create({required String? address}) =>
      (super.noSuchMethod(
        Invocation.method(
          #create,
          [],
          {#address: address},
        ),
        returnValue: _i3.Future<_i2.Address>.value(_FakeAddress_10(
          this,
          Invocation.method(
            #create,
            [],
            {#address: address},
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<_i2.Address>.value(_FakeAddress_10(
          this,
          Invocation.method(
            #create,
            [],
            {#address: address},
          ),
        )),
      ) as _i3.Future<_i2.Address>);

  @override
  _i3.Future<_i2.Script> scriptPubKey() => (super.noSuchMethod(
        Invocation.method(
          #scriptPubKey,
          [],
        ),
        returnValue: _i3.Future<_i2.Script>.value(_FakeScript_9(
          this,
          Invocation.method(
            #scriptPubKey,
            [],
          ),
        )),
        returnValueForMissingStub: _i3.Future<_i2.Script>.value(_FakeScript_9(
          this,
          Invocation.method(
            #scriptPubKey,
            [],
          ),
        )),
      ) as _i3.Future<_i2.Script>);
}

/// A class which mocks [BdkFlutter].
///
/// See the documentation for Mockito's code generation for more information.
class MockBdkFlutter extends _i1.Mock implements _i5.BdkFlutter {
  @override
  _i3.Future<String> generateMnemonic({required _i2.WordCount? wordCount}) =>
      (super.noSuchMethod(
        Invocation.method(
          #generateMnemonic,
          [],
          {#wordCount: wordCount},
        ),
        returnValue: _i3.Future<String>.value(''),
        returnValueForMissingStub: _i3.Future<String>.value(''),
      ) as _i3.Future<String>);
}

/// A class which mocks [DerivationPath].
///
/// See the documentation for Mockito's code generation for more information.
class MockDerivationPath extends _i1.Mock implements _i2.DerivationPath {
  @override
  _i3.Future<_i2.DerivationPath> create({required String? path}) =>
      (super.noSuchMethod(
        Invocation.method(
          #create,
          [],
          {#path: path},
        ),
        returnValue:
            _i3.Future<_i2.DerivationPath>.value(_FakeDerivationPath_11(
          this,
          Invocation.method(
            #create,
            [],
            {#path: path},
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<_i2.DerivationPath>.value(_FakeDerivationPath_11(
          this,
          Invocation.method(
            #create,
            [],
            {#path: path},
          ),
        )),
      ) as _i3.Future<_i2.DerivationPath>);
}
