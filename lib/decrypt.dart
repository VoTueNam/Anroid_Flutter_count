// import 'package:encrypt/encrypt.dart';
// import 'package:encrypt/encrypt_io.dart';
// import 'package:pointycastle/asymmetric/api.dart';

// void decrypt() async {
//   DateTime now = DateTime.now();
//   int timestampMilliseconds = now.millisecondsSinceEpoch;
//   final publicKey = await parseKeyFromFile<RSAPublicKey>('Assets/public.pem');
//   final privKey = await parseKeyFromFile<RSAPrivateKey>('Assets/private.pem');
//   final plainText = 'Cooker VSEC - $timestampMilliseconds';
//   print(publicKey);
//   Encrypter encrypter;
//   Encrypted encrypted;
//   String decrypted;

//   // PKCS1 (Default)
//   encrypter = Encrypter(RSA(publicKey: publicKey, privateKey: privKey));
//   encrypted = encrypter.encrypt(plainText);
//   decrypted = encrypter.decrypt(encrypted);

//   print('PKCS1 (Default)');
//   print(decrypted);
//   print(encrypted.base64);
// }

// void main() {
//   decrypt();
// }
