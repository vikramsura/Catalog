import 'package:digicat/all.dart';
import 'package:digicat/screenUi/home/homePage.dart';
import 'package:digicat/screenUi/myList/controller.dart';
import 'package:digicat/screenUi/myOrders/pdf.dart';

class OrderConfirmation extends StatelessWidget {
  OrderConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyListController>(builder: (dataController) {
      return PopScope(
        onPopInvoked: (didPop) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
              (route) => false);
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 50.h, left: 22.w, right: 22.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: buildText(
                          text: "Order Placed Successfully!",
                          fontSize: 25.w,
                          color: AppTextColor.deepY2,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Image(
                        height: 150.h,
                        width: 150.w,
                        image: const AssetImage("assets/image/verified.png")),
                    SizedBox(
                      height: 30.h,
                    ),
                    buildText(
                        text: "Successful",
                        fontSize: 25.w,
                        color: AppTextColor.deepY2,
                        fontWeight: FontWeight.w500),
                    SizedBox(
                      height: 36.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: buildTextCen(
                          text:
                              "Your order has been successfully completed. Your product will be delivered to your door."),
                    ),
                    SizedBox(
                      height: 36.h,
                    ),
                    Container(
                      height: 140.h,
                      width: 1.sw,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppBodyColor.black),
                          borderRadius: BorderRadius.circular(12.r)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Image(
                                    height: 40.h,
                                    width: 40.w,
                                    image: const AssetImage(
                                        "assets/image/shop.png")),
                                SizedBox(
                                  width: 10.w,
                                ),
                                buildTextCen(
                                    text:
                                        "${dataController.dataCreate.item} items in order",
                                    fontSize: 18.w),
                              ],
                            ),
                            Divider(
                              thickness: 2.w,
                            ),
                            Row(
                              children: [
                                Image(
                                    height: 40.h,
                                    width: 40.w,
                                    image: const AssetImage(
                                        "assets/image/time.png")),
                                SizedBox(
                                  width: 10.w,
                                ),
                                buildTextCen(
                                    text: dataController.dataCreate.message
                                        .toString(),
                                    fontSize: 18.w),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    GestureDetector(
                      onTap: () {
                        Get.to(PdfPage(
                            value: 1,
                            id: dataController.dataCreate.orderId.toString(),
                            userId:
                                dataController.dataCreate.buyerId.toString()));
                      },
                      child: buildConGradient(
                        borderRadius: 28.r,
                        widget: Center(
                          child: buildText(
                              text: "Print invoice".tr,
                              fontSize: 18.w,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: () {
                        Get.offAllNamed("HomePage");
                      },
                      child: buildConGradient(
                        borderRadius: 28.r,
                        widget: Center(
                          child: buildText(
                              text: "Continue Ordering".tr,
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
        ),
      );
    });
  }
}
