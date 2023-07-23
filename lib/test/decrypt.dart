// import 'package:encrypt/encrypt.dart';
// import 'package:encrypt/encrypt_io.dart';
// import 'package:pointycastle/asymmetric/api.dart';

// void main() async {
//   final publicKey = await parseKeyFromFile<RSAPublicKey>('lib/public.pem');
//   final privKey = await parseKeyFromFile<RSAPrivateKey>('lib/private.pem');
//   final plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
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
