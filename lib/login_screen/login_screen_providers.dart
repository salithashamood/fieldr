import 'package:fieldr/login_screen/login_screen_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = ChangeNotifierProvider<LoginScreenProvider>((ref) {
  return LoginScreenProvider();
});

class LoginScreenProvider extends ChangeNotifier {
  bool isSignInSelected = true;
  int screenValue = 0;

  changedBoolValue() {
    if (screenValue == 0) {
      changeScreenValue(1);
    } else {
      changeScreenValue(0);
    }
    isSignInSelected = !isSignInSelected;
    notifyListeners();
  }

  changeScreenValue(int number) {
    screenValue = number;
    notifyListeners();
  }

  bool getBool() => isSignInSelected;

  int getScreenValue() => screenValue;

  Widget setScreen(LoginScreenProvider loginState) {
    switch (getScreenValue()) {
      case 0:
        return signInContainer(loginState);
      case 1:
        return signUpContainer(loginState);
      case 2:
        return otherOptionsContainer();
      case 3:
        return forgotPasswordContainer();
      default:
        return signUpContainer(loginState);
    }
  }
}
