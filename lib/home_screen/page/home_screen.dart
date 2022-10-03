import 'package:fieldr/common_components/fieldr_appbar.dart';
import 'package:fieldr/home_screen/home_screen_components.dart';
import 'package:fieldr/utils/colors.dart';
import 'package:fieldr/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const FieldRAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: signInWithGoogleTextColor,
        fixedColor: bottomNavigationBarTextColor,
        unselectedItemColor: bottomNavigationBarTextColor,
        selectedLabelStyle: TextStyle(
            color: bottomNavigationBarTextColor,
            fontSize: 12,
            fontWeight: FontWeight.w700),
        unselectedLabelStyle: TextStyle(
            color: bottomNavigationBarTextColor,
            fontSize: 12,
            fontWeight: FontWeight.w700),
        currentIndex: 0,
        items: [
          bottomNavigationBarItem('HOME', homeIcon, signInWithGoogleTextColor),
          bottomNavigationBarItem(
              'STATS', statsIcon, signInWithGoogleTextColor),
          bottomNavigationBarItem('NEW', newIcon, signInWithGoogleTextColor),
          bottomNavigationBarItem(
              'MATCHES', matchesIcon, signInWithGoogleTextColor),
          bottomNavigationBarItem('NEWS', newsIcon, signInWithGoogleTextColor),
        ],
      ),
    );
  }
}
