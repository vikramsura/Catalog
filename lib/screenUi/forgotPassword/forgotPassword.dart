import 'package:digicat/all.dart';
import 'package:digicat/screenUi/forgotPassword/controllerpage.dart';
import 'package:digicat/screenUi/loginPage/controller.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final dataController = Get.put(ForgotPController());
  final dataLoginController = Get.put(LoginController());
  final emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          onTap: () {
            Get.back();
            dataController.dataClean();
            dataLoginController.dataClean();
          },
          title: ""),
      resizeToAvoidBottomInset: true,
      body: PopScope(
        onPopInvoked: (didPop) {
          dataController.dataClean();
          dataLoginController.dataClean();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Form(
              key: dataController.formKey,
              child: Column(
                children: [
                  Image(
                      height: 250.h,
                      width: 260.w,
                      fit: BoxFit.fill,
                      image: AssetImage("assets/image/forgotPassword.png")),
                  SizedBox(
                    height: 40.h,
                  ),
                  buildText(
                      fontSize: 24.w,
                      text: "Forgot Password?",
                      fontWeight: FontWeight.w500,
                      color: AppTextColor.deepY2),
                  SizedBox(
                    height: 30.h,
                  ),
                  buildTextField(
                    context,
                    focusNode: dataController.emailFocus,
                    controllerData: dataController.emailController,
                    hintText: "Enter your Email",
                    validator: (p0) {
                      if (p0!.trim().isEmpty) {
                        return "Email is required";
                      }
                      if (!emailRegex.hasMatch(p0.trim())) {
                        return "Invalid email format";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (dataController.formKey.currentState!.validate()) {}
                      if (dataController.emailController.text.trim().isEmpty ||
                          !emailRegex.hasMatch(
                              dataController.emailController.text.trim())) {
                        dataController.emailFocus.requestFocus();
                      } else {
                        dataController.forgotPassword();
                      }
                    },
                    child: buildConGradient(
                        borderRadius: 28.r,
                        widget: Center(
                            child: buildText(text: "Send", fontSize: 18.w))),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                      dataController.dataClean();
                      dataLoginController.dataClean();
                    },
                    child: buildConButton(
                        color: AppBodyColor.white,
                        text: "Back to Login",
                        colorText: AppBodyColor.black,
                        borderColor: AppBodyColor.black),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
