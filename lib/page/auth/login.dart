import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabersa_mobile/config/api.dart';
import 'package:tabersa_mobile/config/asset.dart';
import 'package:tabersa_mobile/model/user.dart';
import 'package:tabersa_mobile/page/auth/register.dart';
import 'package:tabersa_mobile/page/home/homepage.dart';
import 'package:http/http.dart' as http;
import 'package:tabersa_mobile/widget/info_message.dart';
import 'package:tabersa_mobile/event/event_pref.dart';

// ignore: use_key_in_widget_constructors
class Login extends StatelessWidget {
  final _controllerKodeAkses = TextEditingController();
  final _controllerPasswordUser = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _obsecure = true.obs;

  void login() async {
    try {
      var response = await http.post(
        Uri.parse(Api.login),
        body: {
          'kode_akses': _controllerKodeAkses.text,
          'password_user': _controllerPasswordUser.text,
        },
      );

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        if (responseBody['success']) {
          InfoMessage.snackbar(Get.context!, 'Login Success');

          User user = User.fromJson(responseBody['data']);
          await EventPref.saveUser(user);

          Future.delayed(const Duration(milliseconds: 1500), () {
            Get.to(const Home());
          });
        } else {
          InfoMessage.snackbar(Get.context!, 'Login Failed');
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: SingleChildScrollView(
                child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Asset.kBackgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(38),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                       Align(
                        alignment: Alignment.center,
                        child: Image.asset("assets/images/Logo_TST_main_white.png",
                                 width: 86, height: 168, fit: BoxFit.cover),
                      ),
                      const SizedBox(height: 32),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Sudah Punya Akun",
                          style: TextStyle(
                            color: Asset.kTextPrimaryColor,
                            fontSize: 28,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Silahkan Log-In disini",
                          style: TextStyle(
                            color: Asset.kTextSecondaryColor,
                            fontSize: 18,
                            fontFamily: 'Asap',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // const SizedBox(height: 16),
                      buildForm(),
                     
                    ],
                  ),
                ),
              ),
            )),
          );
        },
      ),
    );
  }

  Widget buildForm() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _controllerKodeAkses,
                  validator: (value) => value == '' ? "Don't Empty" : null,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    hintText: 'Kode Akses',
                    hintStyle: const TextStyle(
                        fontSize: 14.0, color: Color(0xFF999999)),
                    border: styleBorder(),
                    enabledBorder: styleBorder(),
                    focusedBorder: styleBorder(),
                    disabledBorder: styleBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                const SizedBox(height: 16),
                Obx(
                  () => TextFormField(
                    controller: _controllerPasswordUser,
                    validator: (value) => value == '' ? "Don't Empty" : null,
                    obscureText: _obsecure.value,
                    cursorColor: Colors.green[200],
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.vpn_key,
                        color: Colors.black,
                      ),
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                          fontSize: 14.0, color: Color(0xFF999999)),
                      suffixIcon: Obx(
                        () => GestureDetector(
                          onTap: () {
                            _obsecure.value = !_obsecure.value;
                          },
                          child: Icon(
                            _obsecure.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      border: styleBorder(),
                      enabledBorder: styleBorder(),
                      focusedBorder: styleBorder(),
                      disabledBorder: styleBorder(),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Asset.kPrimaryColor,
                    onPrimary: Colors.black,
                    elevation: 15.0,
                    shadowColor: Asset.kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    minimumSize: Size(MediaQuery.of(Get.context!).size.width, 50),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  onPressed: () {
                     if (_formKey.currentState!.validate()) {
                          // ignore: avoid_print
                          print('login');
                          login();
                        }
                    },
                  child: const Text(
                    "Masuk",
                    style: TextStyle(
                      color: Asset.kTextSecondaryColor,
                      fontSize: 16,
                      fontFamily: 'Asap',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                 const SizedBox(height: 64),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Pengguna Baru",
                          style: TextStyle(
                            color: Asset.kPrimaryColor,
                            fontSize: 28,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Asset.kPrimaryColor,
                            onPrimary: Colors.black,
                            elevation: 15.0,
                            shadowColor: Asset.kPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            minimumSize: Size(MediaQuery.of(Get.context!).size.width, 50),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                          ),
                          onPressed: () {
                              Get.to(Register());
                            },
                          child: const Text(
                            "Daftar Baru",
                            style: TextStyle(
                              color: Asset.kTextSecondaryColor,
                              fontSize: 16,
                              fontFamily: 'Asap',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }

  InputBorder styleBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(
        width: 0,
        color: Asset.kPrimaryColor,
      ),
    );
  }
}
