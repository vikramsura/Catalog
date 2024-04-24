import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static String? userID;
  static String? userName;
  static String? userEmail;
  static String? userPhone;
  static String? userAuth;
  static String? userUniId;
  static String? gstNo;
  static String? registrationCode;
  static String? parentId;
  static String? sellerNo;
  static String? address;
  static String? roleId;
  static String? userFcmToken;
  static String? userAuthToken;
  static String? shopName;
  static String? userLang;
  static String? userPasswordToken;
  static String? userCategoriesId;
  static String? userMainCategoriesName;
  static String? userSubCategoriesId;
  static String? userSubCategoriesName;
  static String? userSolitaireId;

  static const idKey = " ID Key";
  static const nameKey = " Name Key";
  static const emailKey = " Email Key";
  static const phoneKey = " Phone Key";
  static const authKey = " Auth Key";
  static const uniIdKey = " Uni Id Key";
  static const gstNoKey = "Gst No Key";
  static const registrationCodeKey = "Registration Code Key";
  static const parentIdKey = "Parent Id Key";
  static const sellerNoKey = "seller No Key";
  static const addressKey = "Address Key";
  static const roleKey = "Role Id Key";
  static const fcmTokenKey = "Fcm Token Key";
  static const authTokenKey = "Auth Token Key";
  static const loginKey = "Login Key";
  static const shopNameKey = "Shop Name Key";
  static const langKey = " Lang Key";

  static Future getUserDetails() async {
    userID = await getData(idKey);
    userName = await getData(nameKey);
    userEmail = await getData(emailKey);
    userPhone = await getData(phoneKey);
    userAuth = await getData(authKey);
    userUniId = await getData(uniIdKey);
    gstNo = await getData(gstNoKey);
    registrationCode = await getData(registrationCodeKey);
    parentId = await getData(parentIdKey);
    sellerNo = await getData(sellerNoKey);
    address = await getData(addressKey);
    roleId = await getData(roleKey);
    userAuthToken = await getData(authTokenKey);
    userFcmToken = await getData(fcmTokenKey);
    shopName = await getData(shopNameKey);
    userLang = await getData(langKey);
  }

  static Future setData(String key, dynamic value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (value is bool) {
      return sharedPreferences.setBool(key, value);
    } else if (value is int) {
      return sharedPreferences.setInt(key, value);
    } else if (value is String) {
      return sharedPreferences.setString(key, value);
    } else if (value is double) {
      return sharedPreferences.setDouble(key, value);
    }
    return null;
  }

  static Future<T?> getData<T>(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var value = sharedPreferences.get(key);
    if (value == null) {
      return null;
    }
    if (T == bool && value is bool ||
        T == int && value is int ||
        T == String && value is String ||
        T == double && value is double) {
      return value as T;
    }
    return null;
  }

  static Future clearUserDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    await sharedPreferences.remove(uniIdKey);
    setData(loginKey, false);
    await getUserDetails();
  }

  static Future<void> setApiData(Map<String, dynamic> response) async {
    UserData.setData(UserData.loginKey, true);
    UserData.setData(
        UserData.parentIdKey, response["data"]["parent_uni_id"].toString());
    UserData.setData(UserData.idKey, response["data"]["id"].toString());
    UserData.setData(UserData.roleKey, response["data"]["role"].toString());
    UserData.setData(
        UserData.uniIdKey, response["data"]["user_uni_id"].toString());
    // UserData.setData(UserData.registrationCodeKey,
    //     response["data"]["registration_code"].toString());
    // UserData.setData(
    //     UserData.authKey, response["data"]["user_auth_key"].toString());
    UserData.setData(UserData.phoneKey, response["data"]["mobile"].toString());
    UserData.setData(UserData.nameKey, response["data"]["name"].toString());
    UserData.setData(UserData.emailKey, response["data"]["email"].toString());
    UserData.setData(
        UserData.authTokenKey, response["data"]["access_token"].toString());
    await UserData.getUserDetails();
  }
}
