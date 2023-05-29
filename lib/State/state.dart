import 'package:http/http.dart' as http;

class StateService {
  final String _baseUrl = 'http://172.30.1.80'; // 아두이노의 IP 주소

  Future<String> changeLEDStatus(int status) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/status/$status'));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to change LED status');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }

  Future<String> setBrightness(int brightness) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/brightness=$brightness'));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to set brightness');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }
}