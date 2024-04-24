import 'package:digicat/all.dart';

class NewPassController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode passwordFocus = FocusNode();
  FocusNode conifirmPasswordFocus = FocusNode();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var context = ApiData.navigatorKey.currentContext!;

  RxBool loader = false.obs;
  RxBool isPassword = true.obs;
  RxBool isConPassword = true.obs;
  void dataClean() {
    passwordController.clear();
    confirmPasswordController.clear();
  }

  Future<void> newPassword() async {
    late Map<String, dynamic> response;
    response = await ApiData().postApi(
      url: ApiConstant.passwordUpdate,
      body: {
        "email": UserData.userEmail,
        "password": passwordController.text.trim(),
        "confirm_password": confirmPasswordController.text.trim(),
        "token": UserData.userPasswordToken.toString()
      },
    );
    if (response["success"] == true) {
      dataClean();
      Get.back();
      Get.back();
      Get.back();
      showSnackMessage(context, response["message"], no: 2);
    }
  }
}
