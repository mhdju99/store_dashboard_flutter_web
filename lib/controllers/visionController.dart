import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:store_dashbord/model/inv_result/inv_result.dart';
import 'package:store_dashbord/model/poduct_model.dart';
import 'package:store_dashbord/model/product_details/product_details.dart';
import 'package:store_dashbord/model/suplayer_model.dart';
import 'package:store_dashbord/service/invenService..dart';
import 'package:store_dashbord/service/productService.dart';
import 'package:store_dashbord/service/suplayerService.dart';
import 'package:store_dashbord/service/visionService.dart';
import 'package:store_dashbord/widgets/customText.dart';

class visionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  int? Quantity, numberOfBox, productInBox, price;
  String? suplaier;
  late TabController controller;
  final _productLIst = <ProductData>[].obs;
  List<ProductData> get product => _productLIst;

  final _not_added = <ProductData>[].obs;
  List<ProductData> get not_added => _not_added;
  var vison = InvResult().obs;

  var loading = F.obs;
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'All '),
    const Tab(text: 'not added'),
    const Tab(text: 'Low stock '),
    const Tab(text: 'top'),
  ];

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
    fetch_vesion();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  List tolists(Map m) {
    List<Map<String, dynamic>> p = m.entries.map((toElement) {
      return {"id": toElement.key, "q": toElement.value};
    }).toList();
    return p;
  }

  ProductData Findproduct(String id) {
    int index = product.indexWhere((element) => element.id.contains(id));
    return product[index];
  }

  void fetchProduct() async {
    try {
      loading(T);
      var data = await inventoryService().getProduct();
      if (data != null) {
        _productLIst.value =
            data.where((e) => e.repoInfo.currantQuantity >= 0).toList();
        _not_added.value =
            data.where((e) => e.repoInfo.currantQuantity < 100).toList();
      }
    } finally {
      loading(F);
    }
  }

  void fetch_vesion() async {
    try {
      loading(T);
      var data = await visionService().getProductDEtails();
      vison.value = data;
    } finally {
      loading(F);
    }
  }

  void add(String id) async {
    try {
      // Map<String, dynamic> x =
      var data = await inventoryService().Addquantity({
        "price": price,
        "productId": id,
        "addQuantity": Quantity,
        "supplier": suplaier,
        "productInBox": productInBox,
        "numberOfBox": numberOfBox
      }, id);

      if (!data) {
        Get.snackbar("title", "no data");
      }
      if (data) {
        Get.snackbar(
          ".",
          "succsess",
          maxWidth: 500,
          colorText: Colors.white,
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.TOP,
          messageText: CustomText(
            text: "succsess",
            fontSize: 20,
            coler: Colors.white,
          ),
        );
      }
    } finally {
      refresh();
    }
  }

  Future<ProductDetails>? fetchProductDetails(String id) async {
    ProductDetails? data = await inventoryService().getProductDEtails(id);
    if (data != null) {
      return data;
    } else {
      throw Exception("faild");
    }
  }

  @override
  void refresh() async {
    loading(T);
    fetchProduct();
  }
}
