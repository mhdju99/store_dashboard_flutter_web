// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:store_dashbord/constants/end_points.dart';
import 'package:store_dashbord/helper/api.dart';
import 'package:store_dashbord/model/brand_model.dart';
import 'package:store_dashbord/model/suplayer_model.dart';

class BrandService {
  final String _endpoint = EndPoints.Brand_endpoint;

  Future<List<BarndData>?> getBrand() async {
    Response? response = await Api().get(endpoint: _endpoint);
    // print("ssssssssssssssss $response");

    List<BarndData> dataList = [];

    if (response != null) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> data = response.data;
        List<dynamic> item = data["data"];
        for (var data in item) {
          dataList.add(BarndData.fromJson(data));
        }
        return dataList;
      } else {
        return dataList;
      }
    } else {
      return dataList;
    }
  }

  Future<bool> AddBrand(var Branditem) async {
    Response? response = await Api().post(endpoint: _endpoint, body: Branditem);
    print(response);
    if (response != null) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<bool> delBrand(String id) async {
    Response? response = await Api().del(
      endpoint: '$_endpoint/$id',
    );
    if (response != null) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
