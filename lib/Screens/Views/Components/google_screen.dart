import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_browser_app/Screens/Views/Components/custom_bottom_navbar.dart';
import 'package:provider/provider.dart';

import '../../Provider/engine_provider.dart';
import '../../Provider/navigation_provider.dart';
import 'custom_popup_menu.dart';

class GoogleScreen extends StatelessWidget {
  const GoogleScreen({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
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
            const Spacer(
              flex: 2,
            ),
            Text(
              "G",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 35),
            ),
            Text(
              "o",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, color: Colors.red, fontSize: 35),
            ),
            Text(
              "o",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                  fontSize: 35),
            ),
            Text(
              "g",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 35),
            ),
            Text(
              "l",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  fontSize: 35),
            ),
            Text(
              "e",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, color: Colors.red, fontSize: 35),
            ),
            const Spacer()
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                width: 35,
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
          url: WebUri(
              "https://www.google.com/webhp?hl=en&ictx=2&sa=X&ved=0ahUKEwjii6O6vKmGAxWsZfUHHbPsJksQPQgK"),
        ),
        onWebViewCreated: (controller) {
          inAppWebView = controller;
        },
        onProgressChanged: (controller, progress) {},
        onLoadStop: (controller, url) async {
          if (url != null) {
            String? title = await controller.getTitle();
            if (title != null) {
              Provider.of<HistoryProvider>(context, listen: false)
                  .addHistoryEntry(title, url.toString());
            }
          }
          bool canNavigateBack = await inAppWebView.canGoBack();
          navigationProvider.setCanGoBack(canNavigateBack);
        },
        onLoadStart: (controller, url) async {
          // Check if can go back
          bool canNavigateBack = await inAppWebView.canGoBack();
          bool canNavigateForward = await inAppWebView.canGoForward();
          Provider.of<NavigationProvider>(context, listen: false)
              .setCanGoBack(canNavigateBack);
          Provider.of<NavigationProvider>(context, listen: false)
              .setCanGoForward(canNavigateForward);
        },
      ),
      bottomNavigationBar: CustomBottomNavbar(),
    );
  }
}

Widget myListTile(String t1, IconData i1) {
  return SizedBox(
    height: 40,
    child: Row(
      children: [
        Icon(
          i1,
          color: Colors.white,
        ),
        const Text("    "),
        Text(
          t1,
          style: TextStyle(color: Colors.white),
        )
      ],
    ),
  );
}

late InAppWebViewController inAppWebView;
