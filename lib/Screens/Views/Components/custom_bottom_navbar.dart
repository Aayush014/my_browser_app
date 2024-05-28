import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/navigation_provider.dart';
import 'google_screen.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return Container(
      height: 60,
      color: const Color(0xff353739),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: navigationProvider.canGoBack
                ? () async {
              if (await inAppWebView.canGoBack()) {
                inAppWebView.goBack();
              }
            }
                : null,
            child: Icon(
              Icons.arrow_back,
              color:
              navigationProvider.canGoBack ? Colors.white : Colors.grey,
              size: 30,
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: navigationProvider.canGoForward
                ? () async {
              if (await inAppWebView.canGoForward()) {
                inAppWebView.goForward();
              }
            }
                : null,
            child: Icon(
              Icons.arrow_forward,
              color:
              navigationProvider.canGoBack ? Colors.white : Colors.grey,
              size: 30,
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: const Color(0xff5F6367),
                borderRadius: BorderRadius.circular(30)),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              inAppWebView.reload();
            },
            child: const Icon(
              Icons.refresh_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: const Icon(
              Icons.more_horiz,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
