import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static Future<String> fetchMessage() async {
    // ⚠️ غير العنوان حسب البيئة
    final url = Uri.parse('http://10.0.2.2:5000/api/hello'); // Android Emulator
    // final url = Uri.parse('http://192.168.1.8:5000/api/hello'); // هاتف حقيقي
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['message'];
    } else {
      throw Exception('Failed to fetch data from Flask');
    }
  }
}
