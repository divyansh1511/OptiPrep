import 'dart:convert';

import 'package:http/http.dart' as http;

import 'constant.dart';

Future<String> generateResponse(String prompt) async {
  const apiKey = apiSecretKey;

  var url = Uri.https("api.openai.com", "/v1/completions");
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $apiKey"
    },
    body: json.encode({
      "model": "text-davinci-003",
      "prompt": prompt,
      'temperature': 0,
      'max_tokens': 2000,
      'top_p': 1,
      'frequency_penalty': 0.0,
      'presence_penalty': 0.0,
    }),
  );

  if (response.statusCode == 200) {
    // Parse the response body
    Map<String, dynamic> newresponse = jsonDecode(response.body);

    // Check if the response contains the expected data
    if (newresponse.containsKey('choices') &&
        newresponse['choices'] is List &&
        newresponse['choices'].isNotEmpty &&
        newresponse['choices'][0] is Map &&
        newresponse['choices'][0].containsKey('text')) {
      return newresponse['choices'][0]['text'];
    } else {
      print('Unexpected API response format: $newresponse');
      return 'Error: Unexpected API response format';
    }
  } else {
    // Error handling when API call is not successful
    print('API call failed with status code: ${response.statusCode}');
    return 'Error: API call failed';
  }
}
