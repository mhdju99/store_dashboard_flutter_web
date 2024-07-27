// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:store_dashbord/constants/end_points.dart';
import 'package:store_dashbord/helper/api.dart';
import 'package:store_dashbord/model/inv_result/inv_result.dart';
import 'package:store_dashbord/model/poduct_model.dart';
import 'package:store_dashbord/model/product_details/product_details.dart';

class visionService {
  final String _endpoint = EndPoints.vison_endpoint;

  Future<InvResult> getProductDEtails() async {
    Response? response = await Api().post(endpoint: _endpoint, body: {});
    print("response is $response");

    InvResult? dataList;

    if (response != null) {
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 304) {
        Map<String, dynamic> data = response.data;

        Map<String, dynamic> item = data["data"];
        dataList = InvResult.fromJson(item);

        return dataList;
      } else {
        return dataList!;
      }
    } else {
      return dataList!;
    }
  }
}
