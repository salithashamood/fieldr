import 'package:fieldr/login_screen/login_screen_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = ChangeNotifierProvider<HomeScreenProvider>((ref) {
  return HomeScreenProvider();
});

class HomeScreenProvider extends ChangeNotifier {
  
}
