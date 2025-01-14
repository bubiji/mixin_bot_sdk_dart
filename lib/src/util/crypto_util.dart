import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
// ignore: implementation_imports
import 'package:ed25519_edwards/src/edwards25519.dart';

Uint8List decodeBase64(String str) {
  try {
    return base64.decode(str);
  } catch (e) {
    var output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return base64Url.decode(output);
  }
}

List<int> privateKeyToCurve25519(Uint8List privateKey) {
  final output = AccumulatorSink<Digest>();
  sha512.startChunkedConversion(output)
    ..add(privateKey.sublist(0, 32))
    ..close();
  final digest = output.events.single.bytes.sublist(0, 32);
  digest[0] &= 248;
  digest[31] &= 127;
  digest[31] |= 64;
  return digest;
}

Uint8List publicKeyToCurve25519(Uint8List publicKey) {
  final A = ExtendedGroupElement()..FromBytes(publicKey);

  final x = _edwardsToMontgomeryX(A.Y);
  final curve25519Public = Uint8List(32);
  FeToBytes(curve25519Public, x);
  return curve25519Public;
}

FieldElement _edwardsToMontgomeryX(FieldElement y) {
  final oneMinusY = FieldElement();
  FeOne(oneMinusY);
  FeSub(oneMinusY, oneMinusY, y);
  FeInvert(oneMinusY, oneMinusY);

  final outX = FieldElement();
  FeOne(outX);
  FeAdd(outX, outX, y);

  FeMul(outX, outX, oneMinusY);
  return outX;
}

Uint8List randBytes(int n) {
  final generator = Random.secure();
  final random = Uint8List(n);
  for (var i = 0; i < random.length; i++) {
    random[i] = generator.nextInt(255);
  }
  return random;
}
