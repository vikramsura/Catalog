import 'package:digicat/all.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppBodyColor.deepY2,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(right: 15.w, left: 15.w, bottom: 50.h),
                  child: const Image(
                    image: AssetImage("assets/image/splash.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed("LoginPage");
                  },
                  child: buildConGradient(
                    width: 0.88.sw,
                    height: 50.h,
                    borderRadius: 28.r,
                    widget: Center(
                      child: buildText(
                          text: "Login".tr,
                          fontSize: 16.w,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed("CreateAnAccount");
                  },
                  child: buildConGradient(
                    width: 0.88.sw,
                    height: 50.h,
                    borderRadius: 28.r,
                    widget: Center(
                      child: buildText(
                          text: "Sign Up".tr,
                          fontSize: 16.w,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.15.sh,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
