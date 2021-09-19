import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:tabersa_mobile/event/event_pref.dart';
import 'package:tabersa_mobile/page/home/homepage.dart';
import 'package:tabersa_mobile/page/welcome/welcome.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: EventPref.getUser(),
          builder: (context, snapshot) {
            if (snapshot.data == null) return Welcome();
            return const Home();
          },
        ));
  }
}
