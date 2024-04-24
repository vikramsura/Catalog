import 'package:digicat/all.dart';
import 'package:digicat/screenUi/myList/controller.dart';
import 'package:digicat/screenUi/myOrders/controller.dart';
import 'package:digicat/screenUi/profilePage/controller.dart';
import 'package:digicat/screenUi/updatePassword/updatePasswordPage.dart';

class menuPage extends StatelessWidget {
  menuPage({super.key});
  final dataController = Get.put(ProfilePageController());
  final OrderdataController = Get.put(MyOrdersController());
  final getCartDataController = Get.put(MyListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: "Menu".tr,
        onTap: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 22.w, top: 50.h, right: 22.w),
          child: Column(
            children: [
              buildListTile(
                  onTap: () {
                    dataController.profileInit(0);
                  },
                  assetImage: "assets/image/profileIcon.png",
                  text: "Profile"),
              buildListTile(
                  onTap: () {
                    dataController.profileInit(1);
                  },
                  assetImage: "assets/image/editProfil.png",
                  text: "Edit Profile"),
              buildListTile(
                  onTap: () {
                    Get.to(UpdatePasswordPage());
                  },
                  assetImage: "assets/image/updatePassword.png",
                  text: "Update Password"),
              buildListTile(
                  onTap: () {
                    getCartDataController.cartGet(0);
                  },
                  assetImage: "assets/image/overview.png",
                  text: "My List"),
              buildListTile(
                  onTap: () {
                    Get.put(MyOrdersController()).orderGet();
                  },
                  assetImage: "assets/image/orderList.png",
                  text: "Order List"),
              buildListTile(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Do You Want To Logout ?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: buildText(
                                    text: "No",
                                    color: AppTextColor.red,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.w)),
                            TextButton(
                                onPressed: () async {
                                  await UserData.clearUserDetails();
                                  showSnackMessage(
                                      context, "Logout successfully",
                                      no: 2);
                                  Get.offAllNamed("RegisterPage");
                                },
                                child: buildText(
                                    text: "Yes",
                                    color: AppTextColor.green,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.w)),
                          ],
                        );
                      },
                    );
                  },
                  assetImage: "assets/image/LogOut.png",
                  text: "Log-Out"),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListTile({Function()? onTap, assetImage, text}) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        dense: true,
        focusColor: Colors.transparent,
        contentPadding: EdgeInsets.only(bottom: 15.h),
        leading: CircleAvatar(
            radius: 30.r,
            child: Center(
              child: ImageIcon(
                AssetImage(assetImage),
                size: 25.w,
              ),
            )),
        title:
            buildText(text: text, fontSize: 14.w, fontWeight: FontWeight.w500),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 20.w,
        ),
      ),
    );
  }
}
