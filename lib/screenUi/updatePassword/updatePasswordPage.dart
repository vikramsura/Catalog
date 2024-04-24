import 'package:digicat/all.dart';
import 'package:digicat/screenUi/updatePassword/controller.dart';

class UpdatePasswordPage extends StatelessWidget {
  UpdatePasswordPage({super.key});
  final dataController = Get.put(UpdatePasswordController());
  final lowercaseRegex = RegExp(r'[a-z]');
  final uppercaseRegex = RegExp(r'[A-Z]');
  final digitRegex = RegExp(r'\d');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(
          title: "Update Password".tr,
          onTap: () {
            Get.back();
          },
        ),
        body: PopScope(
          onPopInvoked: (didPop) {
            // dataController.dataClean();
          },
          child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.only(left: 22.w, top: 40.h, right: 22.w),
                  child: Form(
                      key: dataController.formKey,
                      child: Obx(() => Column(
                            children: [
                              buildTextField(
                                context,
                                borderRadius: 8.w,
                                colorBorder: AppBodyColor.grey,
                                color: AppBodyColor.white,
                                focusNode: dataController.oldPasswordFocus,
                                controllerData:
                                    dataController.oldPasswordController,
                                obscureText: dataController.isOldPassword.value,
                                hintText: "Old Password",
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    dataController.isOldPassword.value =
                                        !dataController.isOldPassword.value;
                                  },
                                  child: Icon(
                                    dataController.isOldPassword.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 22.w,
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return 'Password is required';
                                  }
                                  if (value.trim().length < 6) {
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
                              ),
                              buildTextField(
                                context,
                                borderRadius: 8.w,
                                colorBorder: AppBodyColor.grey,
                                color: AppBodyColor.white,
                                focusNode: dataController.passwordFocus,
                                controllerData:
                                    dataController.passwordController,
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
                                    size: 22.w,
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return 'Old Password is required';
                                  }
                                  if (value.trim().length < 6) {
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
                              ),
                              buildTextField(
                                context,
                                borderRadius: 8.w,
                                colorBorder: AppBodyColor.grey,
                                color: AppBodyColor.white,
                                focusNode: dataController.conifirmPasswordFocus,
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
                                    size: 22.w,
                                  ),
                                ),
                                validator: (p0) {
                                  if (p0!.trim().isEmpty) {
                                    return "Confirm password is required";
                                  } else if (p0.trim() !=
                                      dataController.passwordController.text
                                          .trim()) {
                                    return "Password and Confirm password doesn't same!";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (dataController.formKey.currentState!
                                      .validate()) {}
                                  if (dataController.oldPasswordController.text
                                          .trim()
                                          .isEmpty ||
                                      dataController.oldPasswordController.text.trim().length <
                                          6 ||
                                      !lowercaseRegex.hasMatch(dataController
                                          .oldPasswordController.text
                                          .trim()) ||
                                      !uppercaseRegex.hasMatch(dataController
                                          .oldPasswordController.text
                                          .trim()) ||
                                      !digitRegex.hasMatch(dataController
                                          .oldPasswordController.text
                                          .trim())) {
                                    dataController.oldPasswordFocus
                                        .requestFocus();
                                  } else if (dataController.passwordController.text
                                          .trim()
                                          .isEmpty ||
                                      dataController.passwordController.text.trim().length <
                                          6 ||
                                      !lowercaseRegex.hasMatch(dataController
                                          .passwordController.text
                                          .trim()) ||
                                      !uppercaseRegex.hasMatch(
                                          dataController.passwordController.text.trim()) ||
                                      !digitRegex.hasMatch(dataController.passwordController.text.trim())) {
                                    dataController.passwordFocus.requestFocus();
                                  } else if (dataController.confirmPasswordController.text.trim().isEmpty) {
                                    dataController.conifirmPasswordFocus
                                        .requestFocus();
                                  } else if (dataController.confirmPasswordController.text.trim() != dataController.passwordController.text.trim()) {
                                    dataController.conifirmPasswordFocus
                                        .requestFocus();
                                  } else {
                                    dataController.passwordUpdate();
                                  }
                                },
                                child: buildConGradient(
                                  borderRadius: 28.r,
                                  widget: Center(
                                    child: buildText(
                                        text: "Submit".tr,
                                        fontSize: 18.w,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ))))),
        ));
  }
}
