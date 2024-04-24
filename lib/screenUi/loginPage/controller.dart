import 'package:digicat/all.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isShow = true.obs;

  void dataClean() {
    emailController.clear();
    passwordController.clear();
    isShow = true.obs;
  }

  void loginApi() async {
    var context = ApiData.navigatorKey.currentContext!;
    late Map<String, dynamic> response;
    response = await ApiData().postApi(
      url: ApiConstant.login,
      body: {
        "email": emailController.text.trim().toString(),
        "password": passwordController.text.trim().toString(),
      },
    );
    if (response["success"] == true && response["data"]["is_verified"] != 0) {
      await UserData.setApiData(response);
      dataClean();
      Get.offNamedUntil("HomePage", (route) => false);
      showSnackMessage(context, response["message"], no: 2);
    } else if (response["success"] == true &&
        response["data"]["is_verified"] == 0) {
      UserData.userEmail = emailController.text;
      dataClean();
      Get.toNamed("OtpVerificationL");
      showSnackMessage(context, response["message"], no: 2);
    }
  }
}
