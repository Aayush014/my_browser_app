import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'google_screen.dart';

Container customBottomNavBar() {
  return Container(
    height: 60,
    color: const Color(0xff353739),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            inAppWebView.goBack();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            inAppWebView.goForward();
          },
          child: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
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