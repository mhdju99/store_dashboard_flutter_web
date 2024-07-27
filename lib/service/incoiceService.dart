// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:store_dashbord/constants/end_points.dart';
import 'package:store_dashbord/helper/api.dart';
import 'package:store_dashbord/model/invoice_data.dart';

class InvoiceService {
  final String _endpoint = EndPoints.invoice_endpoint;

  Future<List<InvoiceData>?> getInvoice() async {
    Response? response = await Api().get(endpoint: _endpoint);
    List<InvoiceData> dataList = [];

    if (response != null) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> responses = response.data;
        List<dynamic> item = responses["data"];
        for (var data in item) {
          dataList.add(InvoiceData.fromJson(data));
        }
        return dataList;
      } else {
        return dataList;
      }
    } else {
      return dataList;
    }
  }
}
