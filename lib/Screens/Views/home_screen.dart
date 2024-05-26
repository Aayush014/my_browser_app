import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_browser_app/Screens/Views/Components/bing_screen.dart';
import 'package:my_browser_app/Screens/Views/Components/ddg_screen.dart';
import 'package:my_browser_app/Screens/Views/Components/google_screen.dart';
import 'package:my_browser_app/Screens/Views/Components/yahoo_screen.dart';
import 'package:my_browser_app/Screens/Views/Components/yandex_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Select your Search Engine 🔍",style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const GoogleScreen(url: '',),
                    )),
                child: myBrowsers(Colors.blue, "Assets/Img/google.png")),
            CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const BingScreen(),
                    )),
                child: myBrowsers(Colors.red, "Assets/Img/bing.jpg")),
            CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const DdgScreen(),
                )),
                child: myBrowsers(Colors.yellow, "Assets/Img/ddg.jpg")),
            CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const YahooScreen(),
                )),
                child: myBrowsers(Colors.green, "Assets/Img/yahoo.png")),
            CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const YandexScreen(),
                )),
                child: myBrowsers(Colors.blue, "Assets/Img/yandex.png")),
          ],
        ),
      ),
    );
  }

  Padding myBrowsers(Color c1, String i1) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, right: 10, left: 10),
      child: Container(
        alignment: Alignment.center,
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          color: c1,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          alignment: Alignment.center,
          height: 150,
          width: 150,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                i1,
                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }
}
