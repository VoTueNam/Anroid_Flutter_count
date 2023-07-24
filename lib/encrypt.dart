import 'package:pointycastle/pointycastle.dart';
import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/asymmetric/api.dart';

String rsaEncrypt(
    String plaintext, RSAPublicKey publicKey, RSAPrivateKey prvKey) {
  final encrypter = Encrypter(RSA(publicKey: publicKey, privateKey: prvKey));

  final encrypted = encrypter.encrypt(plaintext);
  final decrypted = encrypter.decrypt(encrypted);
  print('encrypted: = $encrypted.base64,decrypted = $decrypted');
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
  const privateKeyString = '''
-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC33OEXurBIZQaP
b3U6yRsAYvx9aXxQU7GJVc3xe4or9YAf6HHCs73Qol9Ljfke/odf9EdjhKF2StH5
+O1lOvAItA2k5gGlq1csifP4rvjisfSbT+c3wgPbhfB/7nl8/xF/n8eb0aDgZZw0
7CKu1QOfnfycxxulXzGN1oeErxEoaQqi+ZY/w6/1OivmXmKhtuzSL4CppUs5Vx1V
zSjjq8t+2KCW+GkPuM5b41/Xw3g1EjpB/x9bdot8hMvc37+qx5TI6pHT4WbL2ft3
+/T+Mh9P474BasoMLNm+jUpZzHC1lBBPl113vJ+9/KVvddcrARu1Qno5emhcff8U
wHoo5tYFAgMBAAECggEAB6Bva9sQHeim5YNDkx0tdA4nGBKsl+5o0mAPS2GLATjN
SEWNlnx7NrDNkCZC+7CmL+pDndKuGeiPnjVfr4/Kzimd2UW7MsKROqU8TAgCBfFI
yrp9RlhTbaM4Ly5WtsMj2C3qC0IeUMCWQrG63JK0dEYK6PvvXyQ8O3x3IZ9bcFgd
G52Q0XnNHYSkyT48qsHgLt2/u4hiN9i0KTHnyPsA81EOWBXaExX99FAD//KtSaWb
sY0MPApH4HImZOq8NopSGTBySR5ETvXsrnRrhwDKUCfXMBn9shZY1E9M0WcliTsk
Sgs7iXBHBlfTZIrohEPJoICH8Li2fsFu+CGVv8w8AQKBgQDY4KDdd/7ZnomCao6m
709I8ccULQgzPSdq/iMN4xu0llkNdHNr0MlB4pzkO9Sh0K7MOu+QJoOGeaRTuUKN
0nmcpaFK3c02VgyVjCstIWhJurNuURv2Ml38+zoNnjVM4aNTPQv77o2ZW//b3SK1
9xxHT8aS98XDc4UKJhCDzWr2AQKBgQDZB6OXxR7y76Toxriffl9DwPYv0KYoTUYP
rI1Wq1v5HtVlKrGcTdr4CKa96G3ZnEmwfw6jTcL0Lj1J2TU4INvqt72IKucu4ovX
vIhpv0iOiXM7xvxms24QWmh13+Vmjv3Tg6/pQ+RyMhG3yTJ+jjiOfsz9IJcyHswQ
VGKpDiAIBQKBgGrzg4EUDuLEsu1UnRqnw0KmsNU7S+Lw0oKJ50GO8PfCeRIQjmbp
5IYQOey3sKlH3xuqKL++rnfffvEm2DJWTFC6wWrJLM0R7EzHffdYlTRe1OOfLhng
RsdeIQfcME7EqyV+Ym2P+9ZYLzn+uIJh5VkpdzS86ZL0YfRaRySoZYoBAoGAZ9PQ
vtXuFXjyYu5W+u6hMq/I110xcIxvXSZGw9Tc/lRy8KA5MjbI7+prouTkULwFQOu4
HAYio2DPr1m7rSuDKkpW4SLtUK/PCRnIBRce5hn5x/pNW/CxUh9+ZA4GGEeGRT91
09nIG526fjtB7euqQPmGpf6GdtLm+1Tzkj8QseUCgYEAuMhKi1cqumBY/bElIt2U
uiAx5Z1xTbUvLMIrCU316bJaWKxmU8GiLNm/2dk3RRIJ4v5Fc8ojjn7YDo0iF9A7
st5+ZM8ydm41rSqKqFSfY+mM4HTtg0CyYturaBDCAU2RJjCgGDleWG7okjtTa7dx
rUZ+ymn9FqldaNMGqLzW6Ew=
-----END PRIVATE KEY-----
''';

  final dataToEncrypt = plaintext;

  final publicKey = RSAKeyParser().parse(publicKeyString) as RSAPublicKey;

  final privateKey = RSAKeyParser().parse(privateKeyString) as RSAPrivateKey;

  final encryptedData = rsaEncrypt(dataToEncrypt, publicKey, privateKey);

  // print('Original data: $dataToEncrypt');
  // print('Encrypted data (Base64): $encryptedData');
  return encryptedData;
}

void main() {
  renderCipherText('Hello');
}
