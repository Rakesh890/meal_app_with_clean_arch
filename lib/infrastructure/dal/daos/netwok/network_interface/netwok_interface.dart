import 'package:http/http.dart' as http;

abstract class NetwrokInterface {
  Future<http.Response?> executeGet(String url);
  Future<http.Response?> executePost(String url, Map bodyRequest);
}
