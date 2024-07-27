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
import 'package:store_dashbord/widgets/customText.dart';

class categoryController extends GetxController {
  String? name;

  final _categoryDataLIst = <categoryData>[].obs;
  var image = Rx<XFile?>(null);

  List<categoryData> get category => _categoryDataLIst;
  var loading = F.obs;
  @override
  void onInit() {
    fetchcategory();
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

  Future<bool?> add() async {
    try {
      loading(T);
      categoryData x = categoryData(categoryName: name);
      var data = await CategoryService().Addcategory(x);

      if (!data) {
        Get.snackbar("title", "no data");
        return false;
      }
      if (data) {
        Get.snackbar(
          ".",
          "succsess",
          maxWidth: 600,
          messageText: CustomText(
            text: "succsess",
            fontSize: 20,
          ),
        );
        return true;
      }
    } finally {
      refresh();
    }
    return null;
  }

  void del(String id) async {
    try {
      loading(T);
      var data = await CategoryService().delcategory(id);

      if (!data) {
        Get.snackbar("title", "message");
      }
      if (data) {
        Get.snackbar("title", "succsess");
      }
    } finally {
      refresh();
    }
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
