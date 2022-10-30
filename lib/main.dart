import 'package:chat_app/Helpers/ThemeController.dart';
import 'package:chat_app/Helpers/helper_functions.dart';
import 'package:chat_app/Pages/HomePage.dart';
import 'package:chat_app/Shared/Constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Pages/Auth/LoginPage.dart';

ThemeController themeController = ThemeController.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(ThemeController());
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constants.apiKey,
            appId: Constants.appId,
            messagingSenderId: Constants.messegingSenderId,
            projectId: Constants.projectId));
  } else {
    await Firebase.initializeApp();
  }
  await GetStorage.init();
  runApp(MyChatApp());
}

class MyChatApp extends StatefulWidget {
  const MyChatApp({Key? key}) : super(key: key);

  @override
  State<MyChatApp> createState() => _MyChatAppState();
}

class _MyChatAppState extends State<MyChatApp> {
  bool isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
    themeController.themeColor.value = themeController.getTheme();
  }

  void getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        theme: ThemeData(
            primaryColor: themeController.themeColor.value,
            scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: isSignedIn ? HomePage() : LoginPage(),
      ),
    );
  }
}
