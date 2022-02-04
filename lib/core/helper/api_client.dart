import 'package:http/http.dart' as http;

class ApiClient {
  Future<http.Response> getImageList(
      {required int page, required int limit}) async {
    try {
      Uri url =
          Uri.parse('https://picsum.photos/v2/list?page=$page&limit=$limit');
      http.Response response = await http.get(url, headers: {
        "Accept": "application/json",
        'Content-Type': 'application/json; charset=UTF-8',
      });

      return response;
    } catch (e) {
      return http.Response('', 100);
    }
  }
}
