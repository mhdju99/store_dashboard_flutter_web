// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:store_dashbord/constants/end_points.dart';
import 'package:store_dashbord/helper/api.dart';
import 'package:store_dashbord/model/suplayer_model.dart';

class suplayerService {
  final String _endpoint = EndPoints.suplayer_endpoint;

  Future<List<SuplayerData>?> getSuplayer() async {
    Response? response = await Api().get(endpoint: _endpoint);

    List<SuplayerData> allProductList = [];

    if (response != null) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> data = response.data;
        List<dynamic> item = data["data"];
        for (var data in item) {
          allProductList.add(SuplayerData.fromJson(data));
        }

        return allProductList;
      } else {
        return allProductList;
      }
    } else {
      return allProductList;
    }
  }

  Future<bool> AddSuplayer(SuplayerData suplayeritem) async {
    Response? response =
        await Api().post(endpoint: _endpoint, body: suplayeritem.tojson());

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

  Future<bool> delSuplayer(String id) async {
    Response? response = await Api().del(
      endpoint: _endpoint + '/' + id,
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
