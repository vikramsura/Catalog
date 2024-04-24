import 'package:digicat/screenUi/SingUpPage/singUpPage.dart';
import 'package:digicat/screenUi/SingUpPage/verified.dart';
import 'package:digicat/screenUi/details/details.dart';
import 'package:digicat/screenUi/forgotPassword/forgotPassword.dart';
import 'package:digicat/screenUi/home/homePage.dart';
import 'package:digicat/screenUi/loginPage/login.dart';
import 'package:digicat/screenUi/myList/myList.dart';
import 'package:digicat/screenUi/newPassword/newPassword.dart';
import 'package:digicat/screenUi/otpVerification/otpVerification.dart';
import 'package:digicat/screenUi/register/registerPage.dart';
import 'package:digicat/screenUi/solitaireRing/solitaire.dart';
import 'package:digicat/screenUi/sortFilter/filterPage.dart';
import 'package:digicat/screenUi/sortFilter/sortFilter.dart';
import 'package:digicat/screenUi/splash_screen.dart';
import 'package:digicat/screenUi/subCategories/subCategoriesPage.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routesList = {
  '/': (context) => const SplashScreen(),
  'RegisterPage': (context) => RegisterPage(),
  'LoginPage': (context) => LoginPage(),
  'CreateAnAccount': (context) => CreateAnAccount(),
  'ForgotPassword': (context) => ForgotPassword(),
  'OtpVerificationL': (context) => OtpVerification(
        valueData: 1,
      ),
  'OtpVerificationS': (context) => OtpVerification(
        valueData: 1,
      ),
  'OtpVerificationF': (context) => OtpVerification(
        valueData: 0,
      ),
  'NewPassword': (context) => NewPassword(),
  'VerifiedPage': (context) => VerifiedPage(),
  'HomePage': (context) => HomePage(),
  'SubCategoryPage': (context) => SubCategoriesPage(),
  'SolitairePage': (context) => SolitairePage(),
  'SortFilterPage': (context) => SortFilter(),
  'FilterPage': (context) => FilterPage(),
  'DetailsPage': (context) => DetailsPage(),
  'MyListPage': (context) => MyListPage(),
};
