
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getToken(String username, String password) async {
  final response = await http.post(
    Uri.parse('localhost:8080/api/auth/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': username,
      'password': password,
    }),
  );
print("hi sabeur 2 ");
  if (response.statusCode == 200) {
    print("Return the token if the authentication was successful");
    // Return the token if the authentication was successful
    final responseBody = jsonDecode(response.body);
    return responseBody['refreshToken'];
  } else {
     print("Throw an exception if the authentication failed");
    throw Exception('Failed to get token: ${response.statusCode}');
  }
}