import 'package:dio/dio.dart';

class HttpsClient {
  static String domain = "https://xiaomi.itying.com/";
  static Dio dio = new Dio();

  HttpsClient() {
    dio.options.baseUrl = domain;
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 5000;
  }

  Future get(apiUrl) async {
    try {
      var re = await dio.get(apiUrl);
      return re;
    } catch (e) {
      print('请求超时');
      return null;
    }
  }

  static replaeUri(picUrl) {
    String tempUrl = domain + picUrl;
    return tempUrl.replaceAll('\\', '/');
  }
}
