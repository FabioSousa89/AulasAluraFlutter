
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

void findAll()  async {
    
    Client client =    InterceptedClient.build(
      interceptors: [LoggingInterceptor()]
    );

    final Response response = await client.get(Uri.parse("http://192.168.86.22:8080/transactions"));
    
}

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    
    print('url ${data.url}');
    print('headers ${data.headers}');
    print('body ${data.body}');   
    
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {

    print('Response');
    print('status code ${data.statusCode}');
    print('headers ${data.headers}');
    print('body ${data.body}');   

    return data;
  }

}