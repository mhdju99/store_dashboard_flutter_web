// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:store_dashbord/constants/end_points.dart';
import 'package:store_dashbord/helper/api.dart';
import 'package:store_dashbord/model/category_model.dart';

class CategoryService {
  final String _endpoint = EndPoints.categories_endpoint;

  Future<List<categoryData>?> getcategory() async {
    Response? response = await Api().get(endpoint: _endpoint);
    List<categoryData> dataList = [];

    if (response != null) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> responses = response.data;
        List<dynamic> item = responses["data"];
        for (var data in item) {
          dataList.add(categoryData.fromJson(data));
        }
        return dataList;
      } else {
        return dataList;
      }
    } else {
      return dataList;
    }
  }

  Future<bool> Addcategory(categoryData suplayeritem) async {
    Response? response =
        await Api().post(endpoint: _endpoint, body: suplayeritem.tojson());
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

  Future<bool> delcategory(String id) async {
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
