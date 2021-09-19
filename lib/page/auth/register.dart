import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabersa_mobile/config/api.dart';
import 'package:tabersa_mobile/config/asset.dart';
import 'package:tabersa_mobile/model/user.dart';
import 'package:tabersa_mobile/page/auth/login.dart';
import 'package:http/http.dart' as http;
import 'package:tabersa_mobile/widget/info_message.dart';

// ignore: use_key_in_widget_constructors
class Register extends StatelessWidget {
  final _controllerEmail = TextEditingController();
  final _controllerHandphone = TextEditingController();
  final _controllerNamaUser = TextEditingController();
  final _controllerKodeAkses = TextEditingController();
  final _controllerPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _obsecure = true.obs;
  final _checkBoxValue = false.obs;
  final _buttondisable = false.obs;

  void register() async {
    User user = User(
      1,
      _controllerEmail.text,
      _controllerHandphone.text,
      _controllerNamaUser.text,
      _controllerKodeAkses.text,
      _controllerPassword.text,
    );
    try {
      var response = await http.post(
        Uri.parse(Api.register),
        body: user.toJson(),
      );

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        if (responseBody['value'] == 1) {
          InfoMessage.snackbar(Get.context!, 'Register Berhasil');
          Get.off(Login());
        } else {
          InfoMessage.snackbar(Get.context!, 'Register Gagal');
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
              height: MediaQuery.of(context).size.height * 1.1,
              decoration: const BoxDecoration(
                color: Asset.kBackgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Daftar Baru",
                          style: TextStyle(
                            color: Asset.kTextPrimaryColor,
                            fontSize: 28,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // const SizedBox(height: 16),
                      const SizedBox(height: 32),
                      buildForm(),
                      const SizedBox(height: 64),
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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Email",
                style: TextStyle(
                    color: Asset.kTextSecondaryColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Asap'),
              )),
          TextFormField(
            controller: _controllerEmail,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontFamily: 'Asap',
              fontWeight: FontWeight.bold,
            ),
            validator: (value) => value == '' ? "Don't Empty" : null,
            cursorColor: Asset.kPrimaryColor,
            decoration: const InputDecoration(
              hintText: 'Masukan Email Anda',
              hintStyle: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                color: Colors.white54,
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Asset.kPrimaryColor)),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              fillColor: Colors.transparent,
              filled: true,
            ),
          ),
          const SizedBox(height: 16),
          const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Nomor Handphone",
                style: TextStyle(
                    color: Asset.kTextSecondaryColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Asap'),
              )),
          TextFormField(
            controller: _controllerHandphone,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontFamily: 'Asap',
              fontWeight: FontWeight.bold,
            ),
            validator: (value) => value == '' ? "Don't Empty" : null,
            cursorColor: Asset.kPrimaryColor,
            decoration: const InputDecoration(
              hintText: '+62',
              hintStyle: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                color: Colors.white54,
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Asset.kPrimaryColor)),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              fillColor: Colors.transparent,
              filled: true,
            ),
          ),
          const SizedBox(height: 16),
          const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Nama anda",
                style: TextStyle(
                    color: Asset.kTextSecondaryColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Asap'),
              )),
          TextFormField(
            controller: _controllerNamaUser,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontFamily: 'Asap',
              fontWeight: FontWeight.bold,
            ),
            validator: (value) => value == '' ? "Don't Empty" : null,
            cursorColor: Asset.kPrimaryColor,
            decoration: const InputDecoration(
              hintText: 'Masukan nama lengkap Anda',
              hintStyle: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                color: Colors.white54,
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Asset.kPrimaryColor)),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              fillColor: Colors.transparent,
              filled: true,
            ),
          ),
          const SizedBox(height: 16),
          const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Kode Akses",
                style: TextStyle(
                    color: Asset.kTextSecondaryColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Asap'),
              )),
          TextFormField(
            controller: _controllerKodeAkses,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontFamily: 'Asap',
              fontWeight: FontWeight.bold,
            ),
            validator: (value) => value == '' ? "Don't Empty" : null,
            cursorColor: Asset.kPrimaryColor,
            decoration: const InputDecoration(
              hintText: 'Kode Akses akan digunakan untuk Login',
              hintStyle: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                color: Colors.white54,
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Asset.kPrimaryColor)),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              fillColor: Colors.transparent,
              filled: true,
            ),
          ),
          const SizedBox(height: 16),
          const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Pasword",
                style: TextStyle(
                    color: Asset.kTextSecondaryColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Asap'),
              )),
          Obx(
            () => TextFormField(
              controller: _controllerPassword,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontFamily: 'Asap',
                fontWeight: FontWeight.bold,
              ),
              validator: (value) => value == '' ? "Don't Empty" : null,
              obscureText: _obsecure.value,
              cursorColor: Asset.kPrimaryColor,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.white54,
                ),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Asset.kPrimaryColor)),
                suffixIcon: Obx(
                  () => GestureDetector(
                    onTap: () {
                      _obsecure.value = !_obsecure.value;
                    },
                    child: Icon(
                      _obsecure.value ? Icons.visibility_off : Icons.visibility_off,
                      color: Asset.kPrimaryColor,
                    ),
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                fillColor: Colors.transparent,
                filled: true,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Container(
            alignment: Alignment.topLeft,
            child: Row(children: <Widget>[
              Obx(
                () => Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                    checkColor: Colors.white,
                    activeColor: Asset.kPrimaryColor,
                    value: _checkBoxValue.value,
                    onChanged: (value) {
                      _checkBoxValue.value = !_checkBoxValue.value;
                      _buttondisable.value = _checkBoxValue.value;
                    },
                  ),
                ),
              ),
              Flexible(
                child: RichText(
                  text: const TextSpan(
                    text: 'Saya menyetujui ',
                    style: TextStyle(
                      fontFamily: 'Asap',
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Syarat, Ketentuan dan Kebijakan Privasi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Asap',
                            fontSize: 12,
                            color: Colors.white,
                          )),
                      TextSpan(
                          text: ' yang berlaku.',
                          style: TextStyle(
                            fontFamily: 'Asap',
                            fontSize: 12,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          const SizedBox(height: 16),
          Obx(
            () => ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary:
                    _buttondisable.value ? Asset.kPrimaryColor : Colors.grey,
                onPrimary: Colors.black,
                elevation: _buttondisable.value ? 15.0 : 3.0,
                shadowColor: Asset.kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                minimumSize: Size(MediaQuery.of(Get.context!).size.width, 50),
                padding: const EdgeInsets.symmetric(horizontal: 20),
              ),
              onPressed: _buttondisable.value
                  ? () {
                      if (_formKey.currentState!.validate()) {
                        // ignore: avoid_print
                        print('register exec');
                        register();
                      }
                    }
                  : () {
                      null;
                    },
              child: _buttondisable.value
                  ? const Text(
                      "Lanjutkan",
                      style: TextStyle(
                        color: Asset.kTextSecondaryColor,
                        fontSize: 16,
                        fontFamily: 'Asap',
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : const Text(
                      "Lanjutkan",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                        fontFamily: 'Asap',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
          // const SizedBox(height: 32),
          const SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Sudah Punya Akun ?',
                  style: TextStyle(
                      color: Asset.kTextSecondaryColor, fontFamily: 'Asap')),
              TextButton(
                child: const Text(
                  "Masuk",
                  style: TextStyle(
                    color: Asset.kPrimaryColor,
                    fontFamily: 'Asap',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Get.back();
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
