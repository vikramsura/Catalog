import 'package:digicat/all.dart';
import 'package:digicat/screenUi/otpVerification/controller.dart';
import 'package:pinput/pinput.dart';

class OtpVerification extends StatelessWidget {
  int valueData;
  OtpVerification({super.key, required this.valueData});
  final dataController = Get.put(OtpVerifController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        dataController.dataClean();
      },
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
                    Image(
                        height: 250.h,
                        width: 260.w,
                        fit: BoxFit.fill,
                        image: const AssetImage("assets/image/otpVerf.png")),
                    SizedBox(
                      height: 40.h,
                    ),
                    buildText(
                        fontSize: 24.w,
                        text: "OTP Verification",
                        fontWeight: FontWeight.w500,
                        color: AppTextColor.deepY2),
                    SizedBox(
                      height: 30.h,
                    ),
                    Pinput(
                      focusNode: dataController.pinFocusNode,
                      controller: dataController.pinController,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      defaultPinTheme: PinTheme(
                        width: 70.w,
                        height: 55.h,
                        textStyle: TextStyle(
                            fontSize: 24.w, color: AppTextColor.black),
                        decoration: BoxDecoration(
                          color: AppBodyColor.yellow,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      validator: (s) {
                        if (s!.trim().isEmpty || s.length < 4) {
                          return "OTP is required";
                        }
                        return null;
                      },
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (dataController.formKey.currentState!.validate()) {}
                        if (dataController.pinController.text.trim().isEmpty ||
                            dataController.pinController.text.trim().length <
                                4) {
                          dataController.pinFocusNode.requestFocus();
                        } else {
                          dataController.otpVerify(type: valueData);
                        }
                      },
                      child: buildConGradient(
                          borderRadius: 28.r,
                          widget: Center(
                              child:
                                  buildText(text: "Verify", fontSize: 18.w))),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
