import 'package:digicat/all.dart';

class SingUpController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var context = ApiData.navigatorKey.currentContext!;

  FocusNode phoneFocus = FocusNode();
  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode sellerNoFocus = FocusNode();
  FocusNode gstNoFocus = FocusNode();
  FocusNode shopAddressFocus = FocusNode();
  FocusNode shopNameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode conifirmPasswordFocus = FocusNode();
  TextEditingController codeController = TextEditingController();
  TextEditingController codeISOController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController sellerNoController = TextEditingController();
  TextEditingController GSTNoController = TextEditingController();
  TextEditingController shopAddressController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool loader = false.obs;
  RxBool isPhone = false.obs;
  RxBool isPassword = true.obs;
  RxBool isConPassword = true.obs;
  RxBool isMessage = true.obs;

  void dataClean() {
    shopNameController.clear();
    codeISOController.clear();
    codeController.clear();
    shopAddressController.clear();
    GSTNoController.clear();
    sellerNoController.clear();
    numberController.clear();
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    isPassword = true.obs;
    isPhone = false.obs;
    isConPassword = true.obs;
  }

  Future<void> signUp() async {
    late Map<String, dynamic> response;
    response = await ApiData().postApi(
      url: ApiConstant.create,
      body: {
        "name": nameController.text.trim(),
        "mobile": numberController.text.trim(),
        "confirm_password": confirmPasswordController.text.trim(),
        "seller_id": sellerNoController.text.trim(),
        "busness_name": shopNameController.text.trim(),
        "gst_number": GSTNoController.text.trim(),
        "address": shopAddressController.text.trim(),
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
        "country_code": codeController.text.trim(),
        "country_iso": codeISOController.text.trim(),
      },
    );
    if (response["success"] == true) {
      UserData.setData(UserData.emailKey, emailController.text.trim());
      await UserData.getUserDetails();
      dataClean();
      Get.toNamed("OtpVerificationS");
      showSnackMessage(context, response["message"], no: 2);
    }
  }
}
