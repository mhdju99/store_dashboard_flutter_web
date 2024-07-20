import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store_dashbord/controllers/brandController..dart';
import 'package:store_dashbord/controllers/categoryController.dart';
import 'package:store_dashbord/model/brand_model.dart';
import 'package:store_dashbord/model/suplayer_model.dart';
import 'package:store_dashbord/service/suplayerService.dart';
import 'package:store_dashbord/widgets/customText.dart';

class ProductController extends GetxController {
  BrandController bb = Get.put(BrandController());
  categoryController ss = Get.put(categoryController());
  List<String?> catrgoryName = [];
  List<String?> brandName = [];
  String? name, brand, category, descraption;
  var image1 = Rx<XFile?>(null);
  var image3 = Rx<XFile?>(null);
  var image2 = Rx<XFile?>(null);

  final _suplayerLIst = <SuplayerData>[].obs;
  List<SuplayerData> get suplayers => _suplayerLIst;
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

  void brandId(val) {
    int index =
        bb.Barnds.indexWhere((element) => element.BrandName!.contains(val));
    brand = bb.Barnds[index].BrandId;
  }

  void catId(val) {
    int id =
        ss.category.indexWhere((element) => element.categoryName!.contains(val));
    category = ss.category[id].categoryName;
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
      var data = await suplayerService().getSuplayer();
      if (data != null) {
        _suplayerLIst.value = data;
      }
    } finally {
      loading(F);
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
      var state = await suplayerService().delSuplayer(id);

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
