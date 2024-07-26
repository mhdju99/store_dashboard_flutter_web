import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_dashbord/model/brand_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';
import 'package:store_dashbord/controllers/brandController..dart';
import 'package:store_dashbord/controllers/suplayerController.dart';
import 'package:store_dashbord/helper/responsiveness.dart';
import 'package:store_dashbord/model/brand_model.dart';
import 'package:store_dashbord/pages/overview/widget/card_larg.dart';
import 'package:store_dashbord/widgets/CustomTextField.dart';
import 'package:store_dashbord/widgets/alertDilog.dart';
import 'package:store_dashbord/widgets/customText.dart';
import 'dart:io';

class brands extends StatelessWidget {
  brands({super.key});
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    BrandController cc = Get.find<BrandController>();

    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(height: 50,),
        Padding(
          padding: EdgeInsets.only(top: 20, left: width / 100),
          child: CustomText(
            text: "Brand",
            fontSize: 27,
            wight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 49,
        ),
        Container(
          // color: Colors.grey.shade100,
          padding: EdgeInsets.symmetric(horizontal: width / 80),
          child: Row(
            children: [
              Expanded(
                  child: CustomText(
                text: "Brand List",
                fontSize: 22,
                wight: FontWeight.bold,
              )),
              ElevatedButton.icon(
                onPressed: () {
                  ADD_BRAND_DIALOG();
                },
                icon: const Icon(
                  // <-- Icon
                  Icons.add,
                  size: 24.0,
                ),
                label: const Text('Add Brand'), // <-- Text
              ),
              IconButton(
                  onPressed: () {
                    cc.refresh();
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
        ),
        Obx(() {
          if (!cc.loading.value) {
            return cc.Barnds.isNotEmpty
                ? Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: width / 80),
                      child: GridView.builder(
                          padding: const EdgeInsets.only(top: 20),
                          itemCount: cc.Barnds.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 5,
                                  crossAxisCount:
                                      ResponsiveWidget.isSmallScreen(context)
                                          ? 2
                                          : 6),
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 200,
                              child: InkWell(
                                onTap: () {
                                  BrandInfoDialog(cc.Barnds[index]);
                                },
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                            width: 200,
                                            height: 150,
                                            child: Image.network(
                                              cc.Barnds[index].Image!,
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 50,
                                      ),
                                      CustomText(
                                        text: cc.Barnds[index].BrandName!,
                                        fontSize: 20,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  )
                : const Center(child: Text("no data"));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ],
    );
  }

  Future<dynamic> BrandInfoDialog(BarndData data) {
    BrandController cc = Get.find<BrandController>();

    return Get.defaultDialog(
      title: "brand INFO",
      content: Expanded(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: 500,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 170,
                        child: Image.network(
                          data.Image!,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      CustomText(
                        text: data.BrandName!,
                        fontSize: 20,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton.icon(
                  onPressed: () {
                    Get.back();
                    Get.defaultDialog(
                        title: ' Alert',
                        middleText: 'Do you want to close?',
                        onConfirm: () {
                          Get.back();
                          cc.del(data.BrandId!);
                        },
                        textConfirm: 'yes',
                        confirmTextColor: Colors.amberAccent,
                        textCancel: 'no');
                  },
                  style: ButtonStyle(
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      )),
                      side: WidgetStateProperty.all(BorderSide.none),
                      textStyle: WidgetStateProperty.all(
                          const TextStyle(color: Colors.white)),
                      backgroundColor: WidgetStateProperty.all(Colors.red)),
                  icon: const Icon(
                    // <-- Icon
                    Icons.delete,
                    size: 24.0,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Remove Brand',
                    style: TextStyle(color: Colors.white),
                  ), // <-- Text
                )
              ],
            ),
          ),
        ),
      ),
      onCancel: () {
        Get.back();
      },
      textCancel: "undo",
    );
  }

  Future<dynamic> ADD_BRAND_DIALOG() {
    BrandController cc = Get.find<BrandController>();

    return Get.defaultDialog(
      barrierDismissible: false,
      title: "ADD BRAND",
      content: Expanded(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: 400,
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      cc.pickImage();
                    },
                    child: Obx(() => Stack(
                          children: [
                            Container(
                              width: 200,
                              height: 150,
                              decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Container(
                                alignment: Alignment.center,
                                child: cc.image.value == null
                                    ? const Icon(
                                        Icons.camera_alt_outlined,
                                        size: 40,
                                      )
                                    : Image.network(cc.image.value!.path),
                              ),
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextField(
                    text: "brand name",
                    onSave: (val) {
                      cc.name = val;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onCancel: () {
        Get.back();
        cc.image.value = null;
      },
      onConfirm: () {
        formkey.currentState!.save();
        if (formkey.currentState!.validate()) {
          // cc.loading = true;
          cc.add();
        } else {
          Get.snackbar("error", " empity");
        }
        Get.back();
      },
      textCancel: "cancel",
      textConfirm: "ADD",
    );
  }
}
