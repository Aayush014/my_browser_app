import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleScreen extends StatelessWidget {
  const GoogleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.home_outlined,
          size: 32,
          color: Colors.white,
        ),
        toolbarHeight: 50,
        centerTitle: true,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 2,),
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
                width: 40,
              ),
              const Icon(
                CupertinoIcons.ellipsis_vertical,
                color: Colors.white,
              ),
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
            "https://www.google.com/webhp?hl=en&ictx=2&sa=X&ved=0ahUKEwjii6O6vKmGAxWsZfUHHbPsJksQPQgK"
          ),
        ),
        onWebViewCreated: (controller) {
          inAppWebView = controller;
        },
        onProgressChanged: (controller, progress) {},
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: const Color(0xff353739),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                inAppWebView.goBack();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                inAppWebView.goForward();
              },
              icon: const Icon(
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
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                inAppWebView.reload();
              },
              icon: const Icon(
                Icons.refresh_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

late InAppWebViewController inAppWebView;
