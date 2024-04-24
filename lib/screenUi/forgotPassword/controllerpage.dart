import 'package:digicat/all.dart';

class ForgotPController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode emailFocus = FocusNode();
  TextEditingController emailController = TextEditingController();
  RxBool loader = false.obs;
  var context = ApiData.navigatorKey.currentContext!;

  void dataClean() {
    emailController.clear();
  }

  Future<void> forgotPassword() async {
    late Map<String, dynamic> response;
    response = await ApiData().postApi(
      url: ApiConstant.forgotPassword,
      body: {
        "email": emailController.text.trim(),
      },
    );
    if (response["success"] == true) {
      UserData.userEmail = emailController.text.trim();
      dataClean();
      Get.toNamed("OtpVerificationF");
      showSnackMessage(context, response["message"], no: 2);
    }
  }
}
