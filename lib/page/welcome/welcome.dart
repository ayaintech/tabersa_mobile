import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tabersa_mobile/config/asset.dart';
import 'package:get/get.dart';
import 'package:tabersa_mobile/page/auth/login.dart';

// ignore: use_key_in_widget_constructors
class Welcome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: LayoutBuilder(
        builder:(context , constraints){
        return ConstrainedBox(
        constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                    colors: [Asset.kPrimaryColor, Asset.kSecondaryColor],
                    ),
              ),
                  child:  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Center(
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget> [
                           Image.asset("assets/images/Logo_TST_main_color.png",
                                 width: 180, height: 348.86, fit: BoxFit.cover),
                           const SizedBox(height: 64),
                           const Text("Selamat Datang",
                              style: TextStyle(
                              fontSize: 28,
                              color: Asset.kTextSecondaryColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Quicksand')),
                           const SizedBox(height: 64),
                           ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Asset.kPrimaryColor,
                              onPrimary: Colors.black,
                              elevation: 15.0,
                              shadowColor: Asset.kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              minimumSize: Size(MediaQuery.of(context).size.width, 50),
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                            ),
                            onPressed: () {
                                Get.to(Login());
                              },
                            child: const Text(
                              "Lanjutkan",
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
                  ),

              ),
            ),
        );
      }
      ),
    );
  }
}