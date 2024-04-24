import 'package:digicat/all.dart';

class UpdatePasswordController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode oldPasswordFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode conifirmPasswordFocus = FocusNode();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool isOldPassword = true.obs;
  RxBool isPassword = true.obs;
  RxBool isConPassword = true.obs;
  var context = ApiData.navigatorKey.currentContext!;

  Future<void> passwordUpdate() async {
    late Map<String, dynamic> response;
    response = await ApiData().postApi(url: ApiConstant.updatePassword, body: {
      "password": oldPasswordController.text.trim(),
      "new_password": passwordController.text.trim(),
      "confirm_new_password": confirmPasswordController.text.trim(),
    });
    if (response["success"] == true) {
      Get.back();
      showSnackMessage(context, response["message"], no: 2);
    }
  }
}
