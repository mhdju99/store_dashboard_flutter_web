import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:store_dashbord/model/suplayer_model.dart';
import 'package:store_dashbord/service/suplayerService.dart';
import 'package:store_dashbord/widgets/customText.dart';

class suplayerController extends GetxController {
  String? name, email, phone, country, descraption;
  final _suplayerLIst = <SuplayerData>[].obs;
  List<SuplayerData> get suplayers => _suplayerLIst;
  var loading = F.obs;
  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  String? suplayerId(val) {
    int index = _suplayerLIst
        .indexWhere((element) => element.suplayerName!.contains(val));
    String? id = _suplayerLIst[index].suplayerID;
    print("object $id");
    return id;
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

  String? FindSupplaerID(String suplayerName1) {
    int index = suplayers
        .indexWhere((element) => element.suplayerName!.contains(suplayerName1));
    String? suplayerid = suplayers[index].suplayerID;

    return suplayerid;
  }

  String? FindSupplaerName(String id) {
    print("object $id");
    int index =
        suplayers.indexWhere((element) => element.suplayerID!.contains(id));
    String? suplayerName = suplayers[index].suplayerName;
    print("object $suplayerName");

    return suplayerName;
  }

  Future<bool?> add() async {
    try {
      loading(T);
      SuplayerData x = SuplayerData(
          suplayerCountres: country,
          suplayerDescription: descraption,
          suplayerPhoneNumber: phone,
          suplayerEmail: email,
          suplayerName: name);
      print(x.tojson());
      var data = await suplayerService().AddSuplayer(x);

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

  void addoffline() {
    SuplayerData x = SuplayerData(
        suplayerCountres: country,
        suplayerDescription: descraption,
        suplayerPhoneNumber: phone,
        suplayerEmail: email,
        suplayerName: name);
    print(x);
    _suplayerLIst.add(x);
  }

  void removeoffline(element) {
    _suplayerLIst.remove(element);
  }
}
