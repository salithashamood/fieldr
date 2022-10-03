import 'package:fieldr/login_screen/login_screen_providers.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/colors.dart';
import '../utils/images.dart';

Widget forgotPasswordContainer() {
  return Column(
    children: [
      const Text(
        'Reset Password',
        style: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      emptySized(25, 0),
      signWithEmail('Minimun 8 Charactors'),
      emptySized(25, 0),
      resetPasswordFormField(),
      emptySized(25, 0),
      loginButton('Reset & Login'),
    ],
  );
}

Widget otherOptionsContainer() {
  List<String> options = [
    'Fingerprint',
    'Face Recognition',
    '2 Factor Authentication',
    'Pattern',
    'Passcode'
  ];
  return Column(
    children: [
      const Text(
        'Other Options',
        style: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      emptySized(15, 0),
      ListView.builder(
        shrinkWrap: true,
        itemCount: options.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 100.w,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Text(
                  options[index],
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: signInWithGoogleTextColor),
                ),
              ),
            ),
          );
        },
      ),
    ],
  );
}

Widget emptySized(double height, double width) {
  return SizedBox(
    height: height,
    width: width,
  );
}

Widget signUpContainer(LoginScreenProvider loginState) {
  return Column(
    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        height: 50,
        width: 100.w,
        decoration: BoxDecoration(
            color: loginSignAndLoginBackgroundColor,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              signInOrSignUpHeading('Sign In', loginState.getBool(), loginState.changedBoolValue),
              signInOrSignUpHeading('Sign Up', !loginState.getBool(), loginState.changedBoolValue),
            ],
          ),
        ),
      ),
      emptySized(15, 0),
      signWithGoogle('Sign up with Google'),
      emptySized(15, 0),
      signWithEmail('or Sign up with Email'),
      emptySized(15, 0),
      loginFormField(loginState.getBool()),
      termsConditionsSection(),
      loginButton('Sign Up to FieldR')
    ],
  );
}

Widget signInContainer(LoginScreenProvider loginState) {
  return Column(
    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        height: 50,
        width: 100.w,
        decoration: BoxDecoration(
            color: loginSignAndLoginBackgroundColor,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              signInOrSignUpHeading('Sign In', loginState.getBool(), loginState.changedBoolValue),
              signInOrSignUpHeading('Sign Up', !loginState.getBool(), loginState.changedBoolValue),
            ],
          ),
        ),
      ),
      emptySized(15, 0),
      signWithGoogle('Sign in with Google'),
      emptySized(15, 0),
      signWithEmail('or Sign in with Email'),
      emptySized(15, 0),
      loginFormField(loginState.getBool()),
      rememberMeAndForgotPasswordSection(loginState),
      loginButton('Login'),
      otherOptions(loginState),
    ],
  );
}

Widget otherOptions(LoginScreenProvider loginState) {
  return TextButton(
    onPressed: () {
      loginState.changeScreenValue(2);
    },
    child: Text(
      'Other Options',
      style: TextStyle(
          color: loginForgotPasswordColor,
          fontSize: 15,
          fontWeight: FontWeight.w900),
    ),
  );
}

Widget loginButton(String title) {
  return SizedBox(
    width: 100.w,
    height: 42,
    child: ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget termsConditionsSection() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 1),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              activeColor: loginCheckBoxColor,
              splashRadius: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              value: true,
              onChanged: (state) {},
            ),
            const Text(
              'I agree to the FieldR',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ],
        ),
        emptySized(0, 10),
        Text(
          'Terms & Conditions',
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
              color: loginForgotPasswordColor),
        ),
      ],
    ),
  );
}

Widget rememberMeAndForgotPasswordSection(LoginScreenProvider loginState) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 1),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              activeColor: loginCheckBoxColor,
              splashRadius: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              value: true,
              onChanged: (state) {},
            ),
            const Text(
              'Remember Me',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: InkWell(
            onTap: () {
              loginState.changeScreenValue(3);
            },
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  color: loginForgotPasswordColor),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget signWithEmail(String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        color: Colors.white,
        height: 1.5,
        width: 25.w,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      Container(
        color: Colors.white,
        height: 1.5,
        width: 25.w,
      ),
    ],
  );
}

Widget signWithGoogle(String title) {
  return Container(
    width: 100.w,
    height: 38,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(15)),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              googleLogo,
              width: 7.h,
              height: 3.h,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  color: signInWithGoogleTextColor,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget signInOrSignUpHeading(
    String title, bool isSignInSelected, VoidCallback tap) {
  return InkWell(
    onTap: isSignInSelected ? null : tap,
    child: Container(
      height: 41,
      width: 45.w,
      decoration: BoxDecoration(
          color: isSignInSelected
              ? Colors.white
              : loginSignAndLoginBackgroundColor,
          borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: isSignInSelected
                  ? loginSignAndLoginBackgroundColor
                  : Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 20),
        ),
      ),
    ),
  );
}

Widget loginFormField(bool isSignInSelected) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Form(
      child: Column(
        children: [
          textField(isSignInSelected ? 'Your Email' : 'Enter Email', peopleIcon,
              false),
          emptySized(10, 0),
          textField(isSignInSelected ? 'Your Password' : 'Enter Password',
              loackIcon, true),
          emptySized(10, 0),
          isSignInSelected
              ? Container()
              : textField('Confirm Password', loackIcon, true),
        ],
      ),
    ),
  );
}

Widget textField(String hintText, String prefixIcon, bool isPassword) {
  return TextFormField(
    style: const TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
    obscureText: isPassword,
    decoration: InputDecoration(
      prefixIcon: Image.asset(prefixIcon),
      isDense: true,
      contentPadding: const EdgeInsets.all(0),
      filled: true,
      fillColor: loginTextFormBackgroundColor,
      border: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(15)),
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.white.withOpacity(0.43),
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

Widget resetPasswordFormField() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Form(
      child: Column(
        children: [
          textField('Enter Email Address', peopleIcon, false),
          emptySized(10, 0),
          textField('Enter new Password', loackIcon, true),
          emptySized(10, 0),
          textField('Confirm new Password', loackIcon, true),
        ],
      ),
    ),
  );
}
