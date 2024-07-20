class EndPoints {
  static const String ip = "192.168.1.6";
  static const String baseUrl = "http://$ip:8080/api/v1/";
  static const String login_endpoint = '${baseUrl}auth/login';
  static const String suplayer_endpoint ='${baseUrl}supplier';
  static const String Brand_endpoint ='${baseUrl}brand';
  static const String categories_endpoint ='${baseUrl}categories';
}
