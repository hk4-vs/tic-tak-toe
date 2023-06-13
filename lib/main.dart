import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tok_toi_game/my_themes.dart';
import 'package:tic_tok_toi_game/theme_provider.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            home: const HomePage(),
            debugShowCheckedModeBanner: false,
            theme: MyThemes.lightTheme(),
            darkTheme: MyThemes.darkTheme(),
            themeMode:
                (provider.isDarkTheme) ? ThemeMode.dark : ThemeMode.light,
          );
        },
      ),
    );
  }
}
