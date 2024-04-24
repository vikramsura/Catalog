import 'package:digicat/all.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void getLoginData() async {
    await UserData.getData<bool>(UserData.loginKey).then((value) async {
      await UserData.getUserDetails();
      Future.delayed(const Duration(seconds: 3), () {
        value == true
            ? Get.offAllNamed("HomePage")
            : Get.offAllNamed("RegisterPage");
      });
    });
  }

  @override
  void initState() {
    getLoginData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppBodyColor.black,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(image: AssetImage("assets/image/splash.png")),
                Text("Catalog Ease",
                    style: TextStyle(
                        color: AppTextColor.white,
                        fontSize: 0.112.sw,
                        fontWeight: FontWeight.w300,
                        fontFamily: "Inria Serif"))
              ],
            ),
          )),
    );
  }
}
