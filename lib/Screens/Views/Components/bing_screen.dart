import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:my_browser_app/Screens/Views/Components/custom_bottom_navbar.dart';
import 'package:my_browser_app/Screens/Views/Components/custom_popup_menu.dart';

import 'google_screen.dart';

class BingScreen extends StatelessWidget {
  const BingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.home_outlined,
            size: 32,
            color: Colors.white,
          ),
        ),
        toolbarHeight: 50,
        centerTitle: true,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            SizedBox(height: 25, child: Image.asset("Assets/Img/micro.jpg")),
            const Text(" "),
            const Text(
              "Microsoft BING",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const Spacer()
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 1,
              ),
              Container(
                alignment: Alignment.center,
                height: 22,
                width: 22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: const Text(
                  "1",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              customPopUpMenu(),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
        backgroundColor: const Color(0xff353739),
        automaticallyImplyLeading: false,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri("https://www.bing.com/?FORM=Z9FD1"),
        ),
        onWebViewCreated: (controller) {
          inAppWebView = controller;
        },
        onProgressChanged: (controller, progress) {},
      ),
      bottomNavigationBar: customBottomNavBar(),
    );
  }
}
