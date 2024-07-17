import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store_dashbord/model/brand_model.dart';
import 'package:store_dashbord/model/category_model.dart';
import 'package:store_dashbord/model/suplayer_model.dart';
import 'package:store_dashbord/service/brandService..dart';
import 'package:store_dashbord/service/categoryService.dart';
import 'package:store_dashbord/service/suplayerService.dart';

class categoryController extends GetxController {
  String? name;

  final _categoryDataLIst = <categoryData>[
    categoryData(
        categoryName: "Tech",
        )
  ].obs;
  var image = Rx<XFile?>(null);

  List<categoryData> get Barnds => _categoryDataLIst;
  var loading = F.obs;
  @override
  void onInit() {
    // fetchProduct();
    super.onInit();
  }



  void fetchcategory() async {
    try {
      loading(T);
      var data = await CategoryService().getcategory();
      if (data != null) {
        _categoryDataLIst.value = data;
      }
    } finally {
      loading(F);
    }
  }

  Future<bool?> del(String id) async {
    try {
      loading(T);
      var data = await CategoryService().delcategory(id);

      if (!data) {
        Get.snackbar("title", "message");
        return false;
      }
      if (data) {
        Get.snackbar("title", "message");
        return true;
      }
    } finally {
      loading(F);
    }
    return null;
  }

  // Future<bool> add() async {
  //   try {
  //     loading(T);
  //     var data = await suplayerService().AddSuplayer(SuplayerData(
  //         suplayerCountres: country,
  //         suplayerDescription: descraption,
  //         suplayerEmail: email,
  //         suplayerName: name));

  //     if (!data) {
  //       Get.snackbar("title", "message");
  //       return false;
  //     }
  //     if (data) {
  //       Get.snackbar("title", "message");
  //       return true;
  //     }
  //   } finally {
  //     loading(F);
  //     return true;
  //   }
  // }

  @override
  void refresh() async {
    loading(T);
    fetchcategory();
  }

  // void addoffline() {
  //   _suplayerLIst.add(SuplayerData(
  //       suplayerCountres: country,
  //       suplayerDescription: descraption,
  //       suplayerPhoneNumber: phone,
  //       suplayerEmail: email,
  //       suplayerName: name));
  // }

  // void removeoffline(element) {
  //   _suplayerLIst.remove(element);
  // }
}
