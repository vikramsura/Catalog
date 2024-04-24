import 'package:digicat/all.dart';
import 'package:digicat/screenUi/loginPage/controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final dataController = Get.put(LoginController());
  final emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: buildAppBar(
          onTap: () {
            Get.back();
            dataController.dataClean();
          },
          title: ""),
      body: PopScope(
        onPopInvoked: (didPop) {
          dataController.dataClean();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Form(
              key: dataController.formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  buildText(
                      text: "Welcome",
                      fontSize: 24.w,
                      color: AppTextColor.deepY2,
                      fontWeight: FontWeight.w500),
                  buildText(
                    text: "Login to your Account",
                    fontSize: 24.w,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  buildTextField(context,
                      focusNode: dataController.emailFocus,
                      controllerData: dataController.emailController,
                      hintText: "Enter Email", validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Email is required";
                    }

                    if (!emailRegex.hasMatch(value.trim())) {
                      return "Invalid email format";
                    }

                    return null;
                  }),
                  Obx(() => buildTextField(
                        context,
                        focusNode: dataController.passwordFocus,
                        controllerData: dataController.passwordController,
                        obscureText: dataController.isShow.value,
                        hintText: "Password",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            dataController.isShow.value
                                ? dataController.isShow.value = false
                                : dataController.isShow.value = true;
                          },
                          child: Icon(
                            dataController.isShow.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Password is required';
                          }
                          if (value.trim().length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      )),
                  SizedBox(
                    height: 8.h,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed("ForgotPassword");
                      },
                      child: buildText(
                          text: "Forgot Password?",
                          fontSize: 14.w,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (dataController.formKey.currentState!.validate()) {}
                      if (dataController.emailController.text.trim().isEmpty ||
                          !emailRegex.hasMatch(
                              dataController.emailController.text.trim())) {
                        dataController.emailFocus.requestFocus();
                      } else if (dataController.passwordController.text
                              .trim()
                              .isEmpty ||
                          dataController.passwordController.text.trim().length <
                              6) {
                        dataController.passwordFocus.requestFocus();
                      } else {
                        dataController.loginApi();
                      }
                    },
                    child: buildConGradient(
                        borderRadius: 28.r,
                        widget: Center(
                            child: buildText(text: "Login", fontSize: 18.w))),
                  ),
                  SizedBox(
                    height: 20.h,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
