import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';

class ApiInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    //  data.params['appid'] = OPEN_WEATHER_API_KEY;
    //   data.params['units'] = 'metric';
    data.headers['Content-Type'] = 'application/json';
    print('REQUEST : ${data.method} : ${data.url}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print('RESPONSE : ${data.statusCode}');
    return data;
  }
}
