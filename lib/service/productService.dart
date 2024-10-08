// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:store_dashbord/constants/end_points.dart';
import 'package:store_dashbord/helper/api.dart';
import 'package:store_dashbord/model/poduct_model.dart';
import 'package:store_dashbord/model/product_details/product_details.dart';

class ProductService {
  final String _endpoint = EndPoints.product_endpoint;

  Future<List<ProductData>?> getProduct() async {
    Response? response = await Api().get(endpoint: _endpoint);
    // print("response is ${response}");

    List<ProductData> dataList = [];

    if (response != null) {
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 304) {
        Map<String, dynamic> data = response.data;

        List<dynamic> item = data["data"];

        for (var data1 in item) {
          dataList.add(ProductData.fromJson(data1));
        }
        return dataList;
      } else {
        return dataList;
      }
    } else {
      return dataList;
    }
  }

  Future<ProductDetails?> getProductDEtails(String id) async {
    Response? response = await Api().get(endpoint: '$_endpoint/$id');
    print("response is ${response}");

    ProductDetails? dataList;

    if (response != null) {
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 304) {
        Map<String, dynamic> data = response.data;

        Map<String, dynamic> item = data["data"];
        dataList = ProductDetails.fromJson(item);

        return dataList;
      } else {
        return dataList;
      }
    } else {
      return dataList;
    }
  }

  Future<bool> Addproduct(var productitem) async {
    Response? response =
        await Api().post(endpoint: _endpoint, body: productitem);

    print("Rtretet $response");
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

  Future<bool> delProduct(String id) async {
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
