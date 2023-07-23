import 'package:pointycastle/pointycastle.dart';
import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/asymmetric/api.dart';

String rsaEncrypt(String plaintext, RSAPublicKey publicKey) {
  final encrypter = Encrypter(RSA(publicKey: publicKey));

  final encrypted = encrypter.encrypt(plaintext);
  return encrypted.base64;
}

String renderCipherText(String plaintext) {
  const publicKeyString = '''-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAt9zhF7qwSGUGj291Oskb
AGL8fWl8UFOxiVXN8XuKK/WAH+hxwrO90KJfS435Hv6HX/RHY4ShdkrR+fjtZTrw
CLQNpOYBpatXLInz+K744rH0m0/nN8ID24Xwf+55fP8Rf5/Hm9Gg4GWcNOwirtUD
n538nMcbpV8xjdaHhK8RKGkKovmWP8Ov9Tor5l5iobbs0i+AqaVLOVcdVc0o46vL
ftiglvhpD7jOW+Nf18N4NRI6Qf8fW3aLfITL3N+/qseUyOqR0+Fmy9n7d/v0/jIf
T+O+AWrKDCzZvo1KWcxwtZQQT5ddd7yfvfylb3XXKwEbtUJ6OXpoXH3/FMB6KObW
BQIDAQAB
-----END PUBLIC KEY-----''';

  final dataToEncrypt = plaintext;

  final publicKey = RSAKeyParser().parse(publicKeyString) as RSAPublicKey;

  final encryptedData = rsaEncrypt(dataToEncrypt, publicKey);

  // print('Original data: $dataToEncrypt');
  // print('Encrypted data (Base64): $encryptedData');
  return encryptedData;
}
