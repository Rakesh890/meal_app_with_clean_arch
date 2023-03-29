import 'package:http/src/response.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:meal_app_with_clean_arch/infrastructure/dal/daos/netwok/interceptoer/api_interceptor.dart';
import 'package:meal_app_with_clean_arch/infrastructure/dal/daos/netwok/network_interface/netwok_interface.dart';
import 'package:http/http.dart' as http;

class ApiProvider extends NetwrokInterface {
  var client = http.Client();

  final headers = {
    'Content-Type': 'application/json',
  };

  @override
  Future<Response?> executeGet(String url) async {
    client = InterceptedClient.build(interceptors: [ApiInterceptor()]);
    final response = await client.get(
      Uri.parse(url),
    );
    return response;
  }

  @override
  Future<Response?> executePost(String url, Map bodyRequest) async {
    client = InterceptedClient.build(interceptors: [ApiInterceptor()]);
    final response = await client.post(Uri.parse(url), body: bodyRequest);
    return response;
  }
}
