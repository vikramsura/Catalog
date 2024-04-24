import 'package:digicat/all.dart';

class CancelOrder extends StatefulWidget {
  const CancelOrder({super.key});

  @override
  State<CancelOrder> createState() => _CancelOrderState();
}

class _CancelOrderState extends State<CancelOrder> {
  void initData() {
    Future.delayed(
      const Duration(seconds: 2),
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
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(
                  height: 150.h,
                  width: 150.w,
                  image: const AssetImage("assets/image/verified.png")),
            ),
            SizedBox(
              height: 40.h,
            ),
            Center(
              child: buildTextCen(
                  text: " Order successfully cancelled ",
                  fontSize: 25.w,
                  color: AppTextColor.deepY2,
                  fontWeight: FontWeight.w500),
            ),
          ],
        )),
      ),
    );
  }
}
