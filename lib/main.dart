import 'package:flutter/material.dart';
import 'package:my_browser_app/Screens/Provider/bookmark_provider.dart';
import 'package:my_browser_app/Screens/Provider/engine_provider.dart';
import 'package:my_browser_app/Screens/Views/home_screen.dart';
import 'package:provider/provider.dart';

import 'Screens/Provider/navigation_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HistoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookmarkProvider(),
        ),
        ChangeNotifierProvider(create: (context) => NavigationProvider(),)
      ],
      builder: (context, child) => MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
