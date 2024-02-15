import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taek_it_easy/prefs.dart';
import 'package:taek_it_easy/provider/main_provider.dart';
import 'package:taek_it_easy/view/page/login_page.dart';
import 'package:taek_it_easy/view/page/main_page.dart';

List<CameraDescription> cameras = [];
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  await Prefs.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MainProvider()),
        ],
        child: MaterialApp(
          home: FutureBuilder<bool>(
            future: checkUserLoggedIn(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                if (snapshot.hasData && snapshot.data == true) {
                  return MainPage();
                } else {
                  return const LoginPage();
                }
              }
            },
          ),
        ));
  }

  // 휴대폰에 유저 정보가 있으면 true
  Future<bool> checkUserLoggedIn() async {
    int? userIdx = Prefs.getInt('userIdx');
    print('userIdx : $userIdx');
    return (userIdx != null);
  }
}
