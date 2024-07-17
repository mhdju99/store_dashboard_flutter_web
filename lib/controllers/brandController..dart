import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/_http/_html/_http_request_html.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store_dashbord/model/brand_model.dart';
import 'package:store_dashbord/model/suplayer_model.dart';
import 'package:store_dashbord/service/brandService..dart';
import 'package:http/http.dart';
import 'package:dio/dio.dart' as ss;

import 'package:store_dashbord/service/suplayerService.dart';

class BrandController extends GetxController {
  String? name;

  final _BarndDataLIst = <BarndData>[].obs;
  var image = Rx<XFile?>(null);

  List<BarndData> get Barnds => _BarndDataLIst;
  var loading = F.obs;
  @override
  void onInit() {
    fetchBrand();
    super.onInit();
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = pickedFile;
    }
  }

  void fetchBrand() async {
    try {
      loading(T);
      var data = await BrandService().getBrand();
      if (data != null) {
        _BarndDataLIst.value = data;
      }
    } finally {
      loading(F);
    }
  }

  void del(String id) async {
    try {
      loading(T);
      var state = await BrandService().delBrand(id);

      if (!state) {
        Get.snackbar("title", "Erorr");
        // return false;
      }
      if (state) {
        Get.snackbar("title", "succsess");
        // return true;
      }
    } finally {
      refresh();
    }
    // return null;
  }

  void add() async {
    try {
      // loading(T);
      // File file = File(image.value!.path);
      Uint8List bytes = await image.value!.readAsBytes();
      print("Ddddddddddddddd");
      print(image.value!.path);
      print(image.value!.name);
      var formDatass = ss.FormData.fromMap({
        'image': ss.MultipartFile.fromBytes(
          bytes,
          filename: image.value!.name,
        ),
        'name': name,
      });
      var data = await BrandService().AddBrand(formDatass);

      if (data) {
        Get.snackbar("title", "add succsee",
            backgroundColor: Colors.greenAccent);
        // return false;
      }
      if (!data) {
        Get.snackbar("title", "errorr");
        // return true;
      }
    } finally {
       refresh();
    }
  }

  @override
  void refresh() async {
    loading(T);
    fetchBrand();
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
