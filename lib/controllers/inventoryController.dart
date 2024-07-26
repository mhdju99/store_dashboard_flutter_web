import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:store_dashbord/model/poduct_model.dart';
import 'package:store_dashbord/model/product_details/product_details.dart';
import 'package:store_dashbord/model/suplayer_model.dart';
import 'package:store_dashbord/service/invenService..dart';
import 'package:store_dashbord/service/productService.dart';
import 'package:store_dashbord/service/suplayerService.dart';
import 'package:store_dashbord/widgets/customText.dart';

class inventoryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  int? Quantity, numberOfBox, productInBox, price;
  String? suplaier;

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];

  late TabController controller;
  final _productLIst = <ProductData>[].obs;
  List<ProductData> get product => _productLIst;
  var loading = F.obs;
  @override
  void onInit() {
    super.onInit();
    fetchProduct();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  void fetchProduct() async {
    try {
      loading(T);
      var data = await inventoryService().getProduct();
      if (data != null) {
        _productLIst.value = data;
      }
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

  void refresh() async {
    loading(T);
    fetchProduct();
  }
}
