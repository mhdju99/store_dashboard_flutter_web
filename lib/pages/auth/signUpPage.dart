import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:icons_plus/icons_plus.dart';
import 'package:store_dashbord/controllers/auth_viewnodel.dart';
import 'package:store_dashbord/pages/overview/widget/buttonText.dart';
import 'package:store_dashbord/widgets/CustomButton.dart';
import 'package:store_dashbord/widgets/CustomTextField.dart';

class SignUP extends StatelessWidget {
  SignUP({super.key});
  final formkey = GlobalKey<FormState>();
  AuthController authControlar = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30),
          width: 400,
          height: 650,
          child: Card(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Sign up",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 33,
                      fontFamily: "Metropolis",
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
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
                                  text: "name",
                                  onSave: (val) {
                                    authControlar.name = val;
                                  },
                                  validate: (e) {
                                    if (e == null || e.length < 4) {
                                      return ".";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
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
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: const Text(
                                "Already have an account? ➡",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GetX<AuthController>(builder: (controllar) {
                          return CustomButton(
                              chaild: controllar.isLoading.value
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const buttonText(label: "SignUp"),
                              onPressed: () {
                                formkey.currentState!.save();
                                if (formkey.currentState!.validate()) {
                                  controllar.isLoading.value = true;
                                  authControlar.signUp();
                                } else {
                                  Get.snackbar("error",
                                      " error in username or password");
                                }
                              });
                        }),
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          "Or sign up with social account",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Metropolis",
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Brand(Brands.google),
                            ),
                            IconButton(
                                onPressed: () {}, icon: Brand(Brands.facebook)),
                          ],
                        )
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
