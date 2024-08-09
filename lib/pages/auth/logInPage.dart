import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:store_dashbord/constants/style.dart';
import 'package:store_dashbord/controllers/auth_viewnodel.dart';
import 'package:store_dashbord/pages/auth/signUpPage.dart';
import 'package:store_dashbord/pages/overview/widget/buttonText.dart';
import 'package:store_dashbord/widgets/CustomButton.dart';
import 'package:store_dashbord/widgets/CustomTextField.dart';

class LogIn extends StatelessWidget {
  LogIn({super.key});
  final formkey = GlobalKey<FormState>();
  AuthController authControlar = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(9),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            alignment: Alignment.center,
            width: 400,
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.control_camera_sharp,
                          size: 100,
                          color: CN3,
                        ),
                        Text(
                          "admin Dashboard",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 33,
                            fontFamily: "Metropolis",
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Form(
                            key: formkey,
                            child: Column(
                              children: [
                                CustomTextField(
                                  text: "Email",
                                  onSave: (val) {
                                    authControlar.email = val;
                                  },
                                  type: TextInputType.emailAddress,
                                  validate: (e) {
                                    return authControlar.validateEmail(e);
                                  },
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                CustomTextField(
                                  minline: 1,
                                  maxLines: 1,
                                  onSave: (val) {
                                    authControlar.password = val;
                                  },
                                  validate: (e) {
                                    return authControlar.validatePassword(e);
                                  },
                                  text: "Password",
                                  type: TextInputType.visiblePassword,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        GetX<AuthController>(builder: (controlar) {
                          return CustomButton(
                              chaild: controlar.isLoading.value
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const buttonText(label: "LogIn"),
                              onPressed: () {
                                formkey.currentState!.save();
                                if (formkey.currentState!.validate()) {
                                  controlar.isLoading.value = true;
                                  authControlar.login();
                                } else {
                                  Get.snackbar("error",
                                      " error in username or password");
                                }
                              });
                        }),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
