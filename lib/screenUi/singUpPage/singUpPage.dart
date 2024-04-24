import 'package:digicat/all.dart';
import 'package:digicat/screenUi/singUpPage/controller.dart';
import 'package:intl_phone_field/phone_number.dart';

class CreateAnAccount extends StatelessWidget {
  CreateAnAccount({super.key});
  final dataController = Get.put(SingUpController());
  final lowercaseRegex = RegExp(r'[a-z]');
  final uppercaseRegex = RegExp(r'[A-Z]');
  final digitRegex = RegExp(r'\d');
  final emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
  );
  final gstRegex =
      RegExp(r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[0-9]{1}Z[0-9]{1}$');

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
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Form(
                key: dataController.formKey,
                child: Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            text: "Create your Account",
                            fontSize: 24.w,
                            fontWeight: FontWeight.w400),
                        SizedBox(
                          height: 30.h,
                        ),
                        buildTextField(
                          context,
                          focusNode: dataController.nameFocus,
                          controllerData: dataController.nameController,
                          hintText: "Enter Name",
                          validator: (p0) {
                            if (p0!.trim().isEmpty) {
                              return "Name is required";
                            }

                            return null;
                          },
                        ),
                        buildIntlPhoneField(context,
                            focusNode: dataController.phoneFocus,
                            controllerData: dataController.numberController,
                            keyboardType: TextInputType.phone,
                            hintText: "Enter Number", onCoChanged: (p0) {
                          dataController.numberController.clear();
                        }, validator: (p0) {
                          if (p0!.number.trim().isEmpty) {
                            return "Phone number is required";
                          }
                          return null;
                        }, onChanged: (value) {
                          try {
                            dataController.isMessage.value = true;
                            dataController.codeController.text =
                                value.countryCode;
                            dataController.codeISOController.text =
                                value.countryISOCode;
                            dataController.isPhone.value =
                                value.isValidNumber();
                          } on NumberTooShortException catch (e) {
                            dataController.isPhone.value = false;
                          } on NumberTooLongException catch (e) {
                            dataController.isPhone.value = false;
                          } catch (e) {
                            dataController.isPhone.value = false;
                          }
                        },
                            colorBorder: dataController.isMessage.value
                                ? null
                                : const Color(0xFFA9252D)),
                        dataController.isMessage.value
                            ? const SizedBox()
                            : Padding(
                                padding: EdgeInsets.only(
                                    left: 0.05.sw, top: 0.01.sh),
                                child: buildText(
                                    text: "Phone number is required",
                                    color: const Color(0xFFA9252D),
                                    fontSize: 12.w),
                              ),
                        buildTextField(
                          context,
                          focusNode: dataController.emailFocus,
                          controllerData: dataController.emailController,
                          hintText: "Enter Email",
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
                        buildTextField(
                          context,
                          focusNode: dataController.sellerNoFocus,
                          controllerData: dataController.sellerNoController,
                          hintText: "Enter Seller No",
                          validator: (p0) {
                            if (p0!.trim().isEmpty) {
                              return "Seller number is required";
                            }
                            return null;
                          },
                        ),
                        buildTextField(
                          context,
                          focusNode: dataController.shopNameFocus,
                          controllerData: dataController.shopNameController,
                          hintText: "Enter Shop Name",
                          validator: (p0) {
                            if (p0!.trim().isEmpty) {
                              return "Shop name is required";
                            }

                            return null;
                          },
                        ),
                        buildTextField(
                          context,
                          focusNode: dataController.gstNoFocus,
                          controllerData: dataController.GSTNoController,
                          hintText: "Enter GST No",
                          validator: (p0) {
                            if (p0!.trim().isNotEmpty) {
                              if (!gstRegex.hasMatch(p0.trim())) {
                                return 'Invalid GST number format';
                              }
                            }
                            return null;
                          },
                        ),
                        buildTextField(
                          context,
                          focusNode: dataController.shopAddressFocus,
                          maxLines: 3,
                          controllerData: dataController.shopAddressController,
                          hintText: "Enter Shop Address",
                          validator: (p0) {
                            if (p0!.trim().isEmpty) {
                              return "Shop address is required";
                            }
                            if (p0.trim().length < 20) {
                              return "Shop address length should be 20 digits!";
                            }

                            return null;
                          },
                        ),
                        buildTextField(
                          context,
                          focusNode: dataController.passwordFocus,
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
                            ),
                          ),
                          validator: (p0) {
                            if (p0!.trim().isEmpty) {
                              return "Confirm password is required";
                            } else if (p0.trim() !=
                                dataController.passwordController.text.trim()) {
                              return "Password and Confirm Password doesn't same!";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (dataController.numberController.text
                                .trim()
                                .isEmpty) {
                              dataController.isMessage.value = false;
                            }
                            if (dataController.formKey.currentState!
                                .validate()) {}
                            if (dataController.nameController.text
                                .trim()
                                .isEmpty) {
                              dataController.nameFocus.requestFocus();
                            } else if (dataController.numberController.text
                                    .trim()
                                    .isEmpty ||
                                dataController.isPhone.value == false) {
                              dataController.phoneFocus.requestFocus();
                            } else if (dataController.emailController.text
                                    .trim()
                                    .isEmpty ||
                                !emailRegex.hasMatch(dataController
                                    .emailController.text
                                    .trim())) {
                              dataController.emailFocus.requestFocus();
                            } else if (dataController.sellerNoController.text
                                .trim()
                                .isEmpty) {
                              dataController.sellerNoFocus.requestFocus();
                            } else if (dataController.shopNameController.text
                                .trim()
                                .isEmpty) {
                              dataController.shopNameFocus.requestFocus();
                            } else if (dataController.GSTNoController.text
                                    .trim()
                                    .isNotEmpty &&
                                !gstRegex.hasMatch(dataController
                                    .GSTNoController.text
                                    .trim())) {
                              dataController.gstNoFocus.requestFocus();
                            } else if (dataController.shopAddressController.text
                                    .trim()
                                    .isEmpty ||
                                dataController.shopAddressController.text
                                        .trim()
                                        .length <
                                    20) {
                              dataController.shopAddressFocus.requestFocus();
                            } else if (dataController.passwordController.text
                                    .trim()
                                    .isEmpty ||
                                dataController.passwordController.text.trim().length <
                                    6 ||
                                !lowercaseRegex.hasMatch(
                                    dataController.passwordController.text.trim()) ||
                                !uppercaseRegex.hasMatch(dataController.passwordController.text.trim()) ||
                                !digitRegex.hasMatch(dataController.passwordController.text.trim())) {
                              dataController.passwordFocus.requestFocus();
                            } else if (dataController.confirmPasswordController.text.trim().isEmpty) {
                              dataController.conifirmPasswordFocus
                                  .requestFocus();
                            } else if (dataController.confirmPasswordController.text.trim() != dataController.passwordController.text.trim()) {
                              dataController.conifirmPasswordFocus
                                  .requestFocus();
                            } else {
                              dataController.signUp();
                            }
                          },
                          child: buildConGradient(
                              borderRadius: 28.r,
                              widget: Center(
                                  child: buildText(
                                      text: "Sign Up", fontSize: 18.w))),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
