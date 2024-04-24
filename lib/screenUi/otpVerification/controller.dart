import 'package:digicat/all.dart';
import 'package:digicat/screenUi/SingUpPage/verified.dart';

class OtpVerifController extends GetxController {
  TextEditingController pinController = TextEditingController();
  var context = ApiData.navigatorKey.currentContext!;

  final pinFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  void dataClean() {
    pinController.clear();
  }

  void otpVerify({type}) async {
    late Map<String, dynamic> response;
    response = await ApiData().postApi(
      url: ApiConstant.verify,
      body: {
        "otp": pinController.text.trim(),
        "type": type.toString(),
        "email": UserData.userEmail,
      },
    );
    if (response["success"] == true) {
      type == 1
          ? await UserData.setApiData(response)
          : UserData.userPasswordToken =
              response["data"]["password_token"].toString();
      dataClean();
      type == 1
          ? showDialog(
              context: context,
              builder: (BuildContext context) {
                return const VerifiedPage(); // Use your custom dialog class
              },
            )
          : type == 0
              ? Get.toNamed("NewPassword")
              : null;
      showSnackMessage(context, response["message"], no: 2);
    }
  }
}
