import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:5000/api'; // عدل الـ URL حسب سيرفرك

  static Future<String?> login(String email, String password) async {
    // في الكود Node.js اللي شاركته، لا يتم التحقق من الإيميل أو الباسورد فعلياً،
    // لذا نحن نرسل فقط طلب POST ونتلقى التوكن مباشرة.
    // في سيناريو حقيقي، سترسل الإيميل والباسورد للتحقق.

    final url = Uri.parse('$baseUrl/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['token'];

        // حفظ التوكن في SharedPreferences لاستخدامه لاحقاً
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('jwt_token', token);

        return token;
      } else {
        // فشل تسجيل الدخول
        return null;
      }
    } catch (e) {
      print('Error during login: $e');
      return null;
    }
  }

  // دالة لاسترجاع التوكن من SharedPreferences
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwt_token');
  }

  // مثال على طلب محمي باستخدام التوكن
  static Future<Map<String, dynamic>?> createPost(String message) async {
    final token = await getToken();
    if (token == null) return null;

    final url = Uri.parse('$baseUrl/posts');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({'message': message}),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Error in createPost: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error in createPost: $e');
      return null;
    }
  }
}
