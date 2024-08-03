import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learngin/view/components/drawer/menu_drawer.dart';
import 'package:provider/provider.dart';
import '../../providers/privacy_policy.dart';
import '../components/drawer/drawer_header.dart';
import 'package:share/share.dart';

import '../../providers/rating_providers.dart';

class CustomDrawerComponent extends StatelessWidget {
  const CustomDrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const CustomDrawerHeader(),
          MenuDrawer(
            icon: Icons.home,
            title: 'Home',
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          MenuDrawer(
            icon: Icons.share_rounded,
            title: 'Share',
            onTap: () {
              Share.share(
                  'https://www.amazon.com/CodeWave-Quotes/dp/B0CTHXBLD4/ref=sr_1_27?s=mobile-apps&sr=1-27');
            },
          ),
          MenuDrawer(
            icon: Icons.star_outlined,
            title: 'Rating',
            onTap: () {
              Provider.of<RatingProvider>(context, listen: false)
                  .showRatingDialog(context);
            },
          ),
          MenuDrawer(
            icon: Icons.lock_outline_rounded,
            title: 'Privacy Policies',
            onTap: () {
                Provider.of<PrivacyPolicyProvider>(context, listen: false)
                  .showPrivacyDialog(context);
            },
          ),
          MenuDrawer(
            icon: Icons.exit_to_app_rounded,
            title: 'Exit',
            onTap: () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              }
            },
          ),
        ],
      ),
    );
  }
}
