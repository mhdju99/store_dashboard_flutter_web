import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/_http/_html/_http_request_html.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store_dashbord/controllers/brandController..dart';
import 'package:store_dashbord/controllers/categoryController.dart';
import 'package:store_dashbord/model/brand_model.dart';
import 'package:store_dashbord/model/poduct_model.dart';
import 'package:store_dashbord/model/suplayer_model.dart';
import 'package:store_dashbord/service/brandService..dart';
import 'package:http/http.dart';
import 'package:dio/dio.dart' as d;
import 'package:store_dashbord/service/productService.dart';

import 'package:store_dashbord/service/suplayerService.dart';

class ProductController extends GetxController {
  BrandController bb = Get.put(BrandController());
  categoryController ss = Get.put(categoryController());
  List<String?> catrgoryName = [];
  List<String?> brandName = [];
  String? name, brand, category, descraption;
  var image1 = Rx<XFile?>(null);
  var image3 = Rx<XFile?>(null);
  var image2 = Rx<XFile?>(null);

  final _productLIst = <ProductData>[].obs;
  List<ProductData> get product => _productLIst;
  var loading = F.obs;
  @override
  void onInit() {
    fetchProduct();
    bb.fetchBrand();
    var f = ss.category;
    var b = bb.Barnds;
    catrgoryName = f.map((val) => val.categoryName).toList();

    brandName = b.map((val) => val.BrandName).toList();

    super.onInit();
  }

  String? Findproduct(String id) {
    int index = product.indexWhere((element) => element.id.contains(id));
    String? suplayerName = product[index].title;

    return suplayerName;
  }

  void brandId(val) {
    int index =
        bb.Barnds.indexWhere((element) => element.BrandName!.contains(val));
    brand = bb.Barnds[index].BrandId;
    print("id");
    print(bb.Barnds[index].BrandId);
  }

  String? FindBrand(String id) {
    print(bb.Barnds);
    int index =
        bb.Barnds.indexWhere((element) => element.BrandId!.contains(id));
    print("object $index");
    brand = bb.Barnds[index].BrandName;

    return brand;
  }

  void catId(val) {
    int id = ss.category
        .indexWhere((element) => element.categoryName!.contains(val));
    category = ss.category[id].categoryid;
    print("id");
    print(ss.category[id].categoryid);
  }

  Future<void> pickImage1() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image1.value = pickedFile;
    }
  }

  Future<void> pickImage2() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image2.value = pickedFile;
    }
  }

  Future<void> pickImage3() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image3.value = pickedFile;
    }
  }

  void fetchProduct() async {
    try {
      loading(T);
      var data = await ProductService().getProduct();
      if (data != null) {
        _productLIst.value = data;
      }
    } finally {
      loading(F);
    }
  }

  void add() async {
    try {
      // loading(T);
      // File file = File(image.value!.path);
      Uint8List bytes1 = await image1.value!.readAsBytes();
      Uint8List bytes2 = await image2.value!.readAsBytes();
      Uint8List bytes3 = await image3.value!.readAsBytes();

      var formDatass = d.FormData.fromMap({
        'imageCovered': d.MultipartFile.fromBytes(
          bytes1,
          filename: image1.value!.name,
        ),
        'images': d.MultipartFile.fromBytes(
          bytes2,
          filename: image2.value!.name,
        ),
        'boxImages': d.MultipartFile.fromBytes(
          bytes3,
          filename: image3.value!.name,
        ),
        'title': name,
        'category': category,
        'brand': brand,
        'description': descraption,
      });
      var data = await ProductService().Addproduct(formDatass);

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
  // Future<bool?> add() async {
  //   try {
  //     loading(T);

  //     print(x.tojson());
  //     var data = await suplayerService().AddSuplayer(x);

  //     if (!data) {
  //       Get.snackbar("title", "no data");
  //       return false;
  //     }
  //     if (data) {
  //       Get.snackbar(
  //         ".",
  //         "succsess",
  //         maxWidth: 600,
  //         messageText: CustomText(
  //           text: "succsess",
  //           fontSize: 20,
  //         ),
  //       );
  //       return true;
  //     }
  //   } finally {
  //     refresh();
  //   }
  //   return null;
  // }

  void del(String id) async {
    try {
      // loading(T);
      var state = await ProductService().delProduct(id);

      if (!state) {
        Get.snackbar("title", "Erorr");
        // return false;
      }
      if (state) {
        Get.snackbar("title", "succsess");
        // return true;
      }
    } finally {
      // loading(F);
      refresh();
    }
    // return null;
  }

  @override
  void refresh() async {
    loading(T);
    fetchProduct();
  }

//   void addoffline() {
//     SuplayerData x = SuplayerData(
//         suplayerCountres: country,
//         suplayerDescription: descraption,
//         suplayerPhoneNumber: phone,
//         suplayerEmail: email,
//         suplayerName: name);
//     print(x);
//     _suplayerLIst.add(x);
//   }

//   void removeoffline(element) {
//     _suplayerLIst.remove(element);
//   }
}
