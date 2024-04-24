import 'package:digicat/all.dart';

class VerifiedPage extends StatefulWidget {
  const VerifiedPage({super.key});

  @override
  State<VerifiedPage> createState() => _VerifiedPageState();
}

class _VerifiedPageState extends State<VerifiedPage> {
  void initData() {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        Get.offAllNamed("HomePage");
      },
    );
  }

  @override
  void initState() {
    initData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 0.2.sh),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(image: AssetImage("assets/image/verified.png")),
              SizedBox(
                height: 40.h,
              ),
              buildTextCen(
                  fontSize: 24.w,
                  text: "Verified",
                  fontWeight: FontWeight.w500,
                  color: AppTextColor.deepY2),
              SizedBox(
                height: 30.h,
              ),
              buildTextCen(
                fontSize: 18.w,
                text: "Your account has been verified successfully!",
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
