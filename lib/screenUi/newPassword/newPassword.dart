import 'package:digicat/all.dart';
import 'package:digicat/screenUi/newPassword/controller.dart';

class NewPassword extends StatelessWidget {
  NewPassword({super.key});
  final dataController = Get.put(NewPassController());
  final lowercaseRegex = RegExp(r'[a-z]');
  final uppercaseRegex = RegExp(r'[A-Z]');
  final digitRegex = RegExp(r'\d');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                      height: 250.h,
                      width: 260.w,
                      fit: BoxFit.fill,
                      image: AssetImage("assets/image/resetPassword.png")),
                  SizedBox(
                    height: 40.h,
                  ),
                  Center(
                    child: buildText(
                        fontSize: 24.w,
                        text: "Reset Password",
                        fontWeight: FontWeight.w500,
                        color: AppTextColor.deepY2),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, top: 20.h),
                    child: buildText(text: "New Password"),
                  ),
                  Obx(() => buildTextField(
                        context,
                        focusNode: dataController.passwordFocus,
                        top: 10.w,
                        controllerData: dataController.passwordController,
                        obscureText: dataController.isPassword.value,
                        hintText: "Password",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            dataController.isPassword.value =
                                !dataController.isPassword.value;
                          },
                          child: Icon(
                            dataController.isPassword.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Password is required';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }

                          if (!lowercaseRegex.hasMatch(value.trim())) {
                            return 'Password must include at least one lowercase letter';
                          }

                          if (!uppercaseRegex.hasMatch(value.trim())) {
                            return 'Password must include at least one uppercase letter';
                          }

                          if (!digitRegex.hasMatch(value.trim())) {
                            return 'Password must include at least one digit';
                          }
                          return null;
                        },
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, top: 20.h),
                    child: buildText(text: "Confirm Password"),
                  ),
                  Obx(() => buildTextField(
                        context,
                        focusNode: dataController.conifirmPasswordFocus,
                        top: 10.w,
                        controllerData:
                            dataController.confirmPasswordController,
                        obscureText: dataController.isConPassword.value,
                        hintText: "Confirm Password",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            dataController.isConPassword.value =
                                !dataController.isConPassword.value;
                          },
                          child: Icon(
                            dataController.isConPassword.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        validator: (p0) {
                          if (p0!.trim().isEmpty) {
                            return "Confirm password is required";
                          } else if (p0.trim() !=
                              dataController.passwordController.text.trim()) {
                            return "Password doesn't same!";
                          }
                          return null;
                        },
                      )),
                  SizedBox(
                    height: 40.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (dataController.formKey.currentState!.validate()) {}
                      if (dataController.passwordController.text
                              .trim()
                              .isEmpty ||
                          dataController.passwordController.text.trim().length <
                              6 ||
                          !lowercaseRegex.hasMatch(
                              dataController.passwordController.text.trim()) ||
                          !uppercaseRegex.hasMatch(
                              dataController.passwordController.text.trim()) ||
                          !digitRegex.hasMatch(
                              dataController.passwordController.text.trim())) {
                        dataController.passwordFocus.requestFocus();
                      } else if (dataController.confirmPasswordController.text
                          .trim()
                          .isEmpty) {
                        dataController.conifirmPasswordFocus.requestFocus();
                      } else if (dataController.confirmPasswordController.text
                              .trim() !=
                          dataController.passwordController.text.trim()) {
                        dataController.conifirmPasswordFocus.requestFocus();
                      } else {
                        dataController.newPassword();
                      }
                    },
                    child: buildConGradient(
                        borderRadius: 28.r,
                        widget: Center(
                            child: buildText(text: "Submit", fontSize: 18.w))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
