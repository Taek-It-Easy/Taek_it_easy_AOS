import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taek_it_easy/prefs.dart';
import 'package:taek_it_easy/view/screens/login_page.dart';
import 'package:taek_it_easy/view/screens/main_page.dart';
import 'package:taek_it_easy/viewModel/practice_view_model.dart';
import 'package:taek_it_easy/viewModel/user_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: ((context) => UserProvider())),
          ChangeNotifierProvider(create: (_) => PracticeViewModel()),
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

  Future<bool> checkUserLoggedIn() async {
    int? userIdx = Prefs.getInt('userIdx');
    print('userIdx : $userIdx');
    return (userIdx != null);
  }
}
