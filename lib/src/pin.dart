import 'dart:convert';
import 'dart:typed_data';

import 'package:fixnum/fixnum.dart';
import 'package:x25519/x25519.dart';
import 'package:fixnum/fixnum.dart';

import 'util/cbc.dart';
import 'util/crypto_util.dart';

String encryptPin(
  String pin,
  String pinTokenBase64,
  String privateKey,
  int iterator,
) {
  final iv = randBytes(16);
  final nowSec = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  return encryptPinWithIv(
      pin, pinTokenBase64, privateKey, iterator, nowSec, iv);
}

String encryptPinWithIv(
  String pin,
  String pinTokenBase64,
  String privateKey,
  int iterator,
  int nowSec,
  Uint8List iv,
) {
  final curvePrivKey = privateKeyToCurve25519(decodeBase64(privateKey));
  final public = decodeBase64(pinTokenBase64);
  final keyBytes = X25519(curvePrivKey, public);

  final pinBytes = Uint8List.fromList(utf8.encode(pin));
  final timeBytes = Int64(nowSec).toBytes();
  final iteratorBytes = Int64(iterator).toBytes();

  // pin+time+iterator
  final plaintext = Uint8List.fromList(pinBytes + timeBytes + iteratorBytes);
  final ciphertext = aesCbcEncrypt(keyBytes, iv, plaintext);
  return base64Url.encode(iv + ciphertext);
}
