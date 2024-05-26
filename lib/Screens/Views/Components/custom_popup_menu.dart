import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'google_screen.dart';

PopupMenuButton<dynamic> customPopUpMenu() {
  return PopupMenuButton(
    iconColor: Colors.white,
    position: PopupMenuPosition.over,
    constraints:
    const BoxConstraints.expand(width: 250, height: 600),
    color: const Color(0xff353739),
    itemBuilder: (BuildContext context) {
      return [
        PopupMenuItem(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: const Icon(
                      CupertinoIcons.arrow_right,
                      color: Colors.white,
                    )),
                CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: const Icon(
                      CupertinoIcons.star,
                      color: Colors.white,
                    )),
                CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: const Icon(
                      Icons.download_outlined,
                      color: Colors.white,
                    )),
                CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: const Icon(
                      CupertinoIcons.info,
                      color: Colors.white,
                    )),
                CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: const Icon(
                      CupertinoIcons.refresh,
                      color: Colors.white,
                    ))
              ],
            )),
        PopupMenuItem(
            child: DefaultTextStyle(
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold),
              child: Column(
                children: [
                  myListTile("New Tab", Icons.add_box_outlined),
                  myListTile(
                      "New incognito Tab", Icons.privacy_tip_outlined),
                  const Divider(),
                  myListTile("History", Icons.history),
                  myListTile("New Tab", Icons.add_box_outlined),
                  myListTile("Downloads", Icons.download_outlined),
                  myListTile("Bookmark", Icons.star_border_rounded),
                  myListTile("Recent Tabs", Icons.phonelink_outlined),
                  const Divider(),
                  myListTile("Share", Icons.share),
                  myListTile(
                      "Find in Page", Icons.find_in_page_outlined),
                  myListTile("Translate", Icons.g_translate_rounded),
                  myListTile("Add to Home Screen",
                      Icons.add_to_home_screen_rounded),
                  myListTile(
                      "Desktop Site", Icons.desktop_windows_rounded),
                  const Divider(),
                  myListTile("Settings", Icons.settings),
                  myListTile(
                      "Help and feedback", Icons.help_outline_rounded),
                ],
              ),
            ))
      ];
    },
    child: const Icon(
      CupertinoIcons.ellipsis_vertical,
      color: Colors.white,
    ),
  );
}