import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taek_it_easy/view/screens/main_page.dart';
import 'package:taek_it_easy/viewModel/practice_view_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PracticeViewModel())],
      child: MaterialApp(
        home: Scaffold(
          body: Center(
            child: MaterialApp(home: MainPage()),
          ),
        ),
      ),
    );
  }
}
