import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotless/ui/theme/theme.dart';

import 'controllers/app_theme_controller.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<AppThemeNotifier>(
        create: (context) => AppThemeNotifier(),
      ),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(builder: (context, appstate, _) {
      return MaterialApp(
        title: 'Spotless ',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.buildLightTheme(),
        darkTheme: AppTheme.buildDarkTheme(),
        themeMode: appstate.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        home: const MyHomePage(title: 'Spotless'),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Home page',
            )
          ],
        ),
      ),
    );
  }
}
