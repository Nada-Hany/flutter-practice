import 'package:http/http.dart' as http;

import 'translation.dart';

class Service {
  static Future<Translation?> getTranslation(
    String text,
  ) async {
    final uri = Uri.parse(
        'http://api.mymemory.translated.net/get?q=$text&langpair=en|it');

    print('begin  ');
    final client = http.Client();
  print("AFTER CLIENT");
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      print("in if");
      return TranslationFromJson(response.body);
    } else {
      return null;
    }
  }
}
