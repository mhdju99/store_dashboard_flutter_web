class EndPoints {
  static const String ip = "127.0.0.1";
  static const String baseUrl = "http://$ip:8080/api/v1/";
  static const String login_endpoint = '${baseUrl}auth/login';
  static const String suplayer_endpoint = '${baseUrl}supplier';
  static const String Brand_endpoint = '${baseUrl}brand';
  static const String categories_endpoint = '${baseUrl}categories';
  static const String invoice_endpoint = '${baseUrl}invoice';
  static const String product_endpoint = '${baseUrl}product';
  static const String repo_endpoint = '${baseUrl}repo';
  static const String vison_endpoint = 'http://127.0.0.1:8000/inventory/process-inventory';
  static const String vison_inventoryList_endpoint = 'http://127.0.0.1:8000/inventory/inventory-history';
}

