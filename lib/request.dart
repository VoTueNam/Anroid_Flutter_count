import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:call_api/encrypt.dart';

const local = "http://localhost:3000/decrypt";
const domain = "https://dot-big-jellyfish.glitch.me/decrypt";

// Future<Map<String, dynamic>> getData() async {
//   try {
//     // Replace 'https://api.example.com/data' with the actual API endpoint URL
//     final response =
//         await http.get(Uri.parse('https://dot-big-jellyfish.glitch.me/api'));
//     if (response.statusCode == 200) {
//       // Request successful, parse the response data (assuming it's in JSON format)
//       var data = json.decode(response.body);
//       data["statusCode"] = response.statusCode;

//       print('Response: $data');
//       return data;
//     } else {
//       // Request failed with an error status code
//       print('Error: ${response.statusCode}');
//     }
//   } catch (e) {
//     // An error occurred during the request
//     print('Error: $e');
//   }
//   return {};
// }

// Future<void> encryptAPI() async {
//   try {
//     final Map<String, dynamic> dataToSend = {
//       "plaintext": "Hello, RSA encryption!"
//     };

//     final response = await http.post(
//       Uri.parse('https://dot-big-jellyfish.glitch.me/encrypt'),
//       body: json.encode(dataToSend),
//       headers: {'Content-Type': 'application/json'},
//     );

//     if (response.statusCode == 200) {
//       final responseData = json.decode(response.body);
//       print('Response: $responseData');
//     } else {
//       print('Error: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error: $e');
//   }
// }

Future<Map<String, dynamic>> decryptAPI() async {
  //get timestampe
  DateTime now = DateTime.now();
  int timestampMilliseconds = now.millisecondsSinceEpoch;
  // print('Timestamp in milliseconds: $timestampMilliseconds');

  //gen ciphertext
  var ciphertext =
      renderCipherText('Pentest Mobile App - $timestampMilliseconds');
  // print('ciphertext tự gen = $ciphertext');
  // return {'ciphertext': ciphertext};
  try {
    final Map<String, dynamic> dataToSend = {"ciphertext": ciphertext};

    final response = await http.post(
      Uri.parse('$domain'),
      body: json.encode(dataToSend),
      headers: {'Content-Type': 'application/json'},
    );
    print('calling... API');
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      responseData['statusCode'] = response.statusCode;
      // print('Response: $responseData');
      return responseData;
    } else {
      // ignore: prefer_typing_uninitialized_variables
      print('Error code: ${response.statusCode}');

      return {'statusCode': response.statusCode};
    }
  } catch (e) {
    print('Error: $e');
  }
  return {};
}

void main() {
  // getData();
  // encryptAPI();
  decryptAPI();
}
