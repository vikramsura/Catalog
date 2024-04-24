import 'package:digicat/all.dart';
import 'package:digicat/screenUi/profilePage/controller.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:intl_phone_field/phone_number.dart';

class UserProfilePage extends StatelessWidget {
  bool isValue = false;

  UserProfilePage({super.key, required this.isValue});
  final emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
  );
  final gstRegex =
      RegExp(r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[0-9]{1}Z[0-9]{1}$');
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilePageController>(builder: (dataController) {
      return Scaffold(
        appBar: buildAppBar(
          title: isValue ? "Profile" : "Edit Profile",
          onTap: () {
            Get.back();
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 22.w, top: 40.h, right: 22.w),
            child: Form(
              key: dataController.formKey,
              child: Column(
                children: [
                  Stack(children: [
                    dataController.sendNewFile.value == null
                        ? GestureDetector(
                            onTap: () {
                              showImageViewer(
                                  useSafeArea: true,
                                  closeButtonColor: AppBodyColor.black,
                                  backgroundColor: AppBodyColor.white,
                                  context,
                                  NetworkImage(dataController.imageFiles.value
                                      .toString()),
                                  swipeDismissible: true,
                                  doubleTapZoomable: true);
                            },
                            child: CircleAvatar(
                              radius: 60.w,
                              backgroundImage: NetworkImage(
                                  dataController.imageFiles.value.toString()),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              showImageViewer(
                                  useSafeArea: true,
                                  closeButtonColor: AppBodyColor.black,
                                  backgroundColor: AppBodyColor.white,
                                  context,
                                  FileImage(dataController.sendNewFile.value!),
                                  swipeDismissible: true,
                                  doubleTapZoomable: true);
                            },
                            child: CircleAvatar(
                                radius: 60.w,
                                backgroundImage: FileImage(
                                    dataController.sendNewFile.value!,
                                    scale: 0.2)),
                          ),
                    isValue
                        ? const SizedBox()
                        : Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                dataController.uploadImage();
                              },
                              child: CircleAvatar(
                                backgroundColor: AppBodyColor.deepYellow,
                                radius: 0.04.sw,
                                child: Icon(Icons.camera_alt, size: 0.05.sw),
                              ),
                            ),
                          )
                  ]),
                  isValue ? const SizedBox() : SizedBox(height: 24.w),
                  buildTextField(
                    context,
                    readOnly: isValue,
                    borderRadius: 8.w,
                    colorBorder: AppBodyColor.grey,
                    color: AppBodyColor.white,
                    focusNode: dataController.nameFocus,
                    controllerData: dataController.nameController,
                    labelText: "Enter Name",
                    validator: (p0) {
                      if (p0!.trim().isEmpty) {
                        return "Name is required";
                      }
                      return null;
                    },
                  ),
                  buildIntlPhoneField(context,
                      enabled: isValue ? false : true,
                      readOnly: isValue,
                      borderRadius: 8.w,
                      colorBorder: AppBodyColor.grey,
                      color: AppBodyColor.white,
                      focusNode: dataController.phoneFocus,
                      controllerData: dataController.numberController,
                      keyboardType: TextInputType.phone,
                      labelText: "Enter Phone Number",
                      initialCountryCode: dataController.codeISOController.text
                          .trim(), onCoChanged: (p0) {
                    dataController.numberController.clear();
                  }, validator: (p0) {
                    if (p0!.number.trim().isEmpty) {
                      return "Phone number is required";
                    }
                    return null;
                  }, onChanged: (value) {
                    try {
                      dataController.codeController.text = value.countryCode;
                      dataController.codeISOController.text =
                          value.countryISOCode;
                      dataController.isPhone.value = value.isValidNumber();
                    } on NumberTooShortException {
                      dataController.isPhone.value = false;
                    } on NumberTooLongException {
                      dataController.isPhone.value = false;
                    } catch (e) {
                      dataController.isPhone.value = false;
                    }
                  }),
                  buildIntlPhoneField(context,
                      enabled: isValue ? false : true,
                      readOnly: isValue,
                      borderRadius: 8.w,
                      colorBorder: AppBodyColor.grey,
                      color: AppBodyColor.white,
                      focusNode: dataController.alternatePhoneFocus,
                      controllerData: dataController.alternatePhoneController,
                      keyboardType: TextInputType.phone,
                      labelText: "Enter Alternate number",
                      initialCountryCode:
                          dataController.codeAlterISOController.text.trim(),
                      onCoChanged: (p0) {
                    dataController.alternatePhoneController.clear();
                  }, onChanged: (value) {
                    try {
                      dataController.codeAlterController.text =
                          value.countryCode;
                      dataController.codeAlterISOController.text =
                          value.countryISOCode;

                      dataController.isAlterValue.value = value.isValidNumber();
                    } on NumberTooShortException {
                      dataController.isAlterValue.value = false;
                    } on NumberTooLongException {
                      dataController.isAlterValue.value = false;
                    } catch (e) {
                      dataController.isAlterValue.value = false;
                    }
                  }),
                  buildTextField(
                    context,
                    readOnly: isValue,
                    borderRadius: 8.w,
                    colorBorder: AppBodyColor.grey,
                    color: AppBodyColor.white,
                    focusNode: dataController.emailFocus,
                    controllerData: dataController.emailController,
                    labelText: "Enter Email",
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
                    readOnly: isValue,
                    borderRadius: 8.w,
                    colorBorder: AppBodyColor.grey,
                    color: AppBodyColor.white,
                    focusNode: dataController.shopNameFocus,
                    controllerData: dataController.shopNameController,
                    labelText: "Enter Shop Name",
                    validator: (p0) {
                      if (p0!.trim().isEmpty) {
                        return "Shop name is required";
                      }

                      return null;
                    },
                  ),
                  buildTextField(
                    context,
                    readOnly: isValue,
                    borderRadius: 8.w,
                    colorBorder: AppBodyColor.grey,
                    color: AppBodyColor.white,
                    focusNode: dataController.gstNoFocus,
                    controllerData: dataController.GSTNoController,
                    labelText: "Enter GST No",
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
                    readOnly: isValue,
                    borderRadius: 8.w,
                    colorBorder: AppBodyColor.grey,
                    color: AppBodyColor.white,
                    focusNode: dataController.shopAddressFocus,
                    maxLines: 3,
                    controllerData: dataController.shopAddressController,
                    labelText: "Enter Shop Address",
                    validator: (p0) {
                      if (p0!.trim().isEmpty) {
                        return "Shop address is required";
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  isValue
                      ? const SizedBox()
                      : GestureDetector(
                          onTap: () {
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
                            } else if (dataController.isAlterValue.value ==
                                false) {
                              dataController.alternatePhoneFocus.requestFocus();
                            } else if (dataController.emailController.text
                                    .trim()
                                    .isEmpty ||
                                !emailRegex.hasMatch(dataController
                                    .emailController.text
                                    .trim())) {
                              dataController.emailFocus.requestFocus();
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
                                .isEmpty) {
                              dataController.shopAddressFocus.requestFocus();
                            } else {
                              dataController.updateProfile();
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
                  SizedBox(height: 30.h)
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
