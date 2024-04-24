import 'package:cached_network_image/cached_network_image.dart';
import 'package:digicat/screenUi/home/controller.dart';
import 'package:digicat/screenUi/menuPage.dart';
import 'package:digicat/screenUi/subCategories/controller.dart';
import 'package:digicat/unitData/SharedPreferences.dart';
import 'package:digicat/unitData/color.dart';
import 'package:digicat/unitData/no_data_widget.dart';
import 'package:digicat/unitData/text.dart';
import 'package:digicat/unitData/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final adataController = Get.put(HomeController());

  final SubCdataController = Get.put(SubCategoriesController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (dataController) {
      return Scaffold(
        body: RefreshIndicator(
          color: AppBodyColor.black,
          onRefresh: () async {
            await dataController.category();
          },
          child: SafeArea(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 34.h),
                child: Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: Image(
                                height: 50.h,
                                width: 50.w,
                                fit: BoxFit.fill,
                                image:
                                    const AssetImage("assets/image/splash.png"),
                              ),
                            ),
                            Expanded(
                              child: buildTextField(
                                context,
                                top: 0.0,
                                onChanged: (value) {
                                  if (value.trim().isEmpty) {
                                    dataController.searchCategoryList.clear();
                                  } else {
                                    dataController.searchNames(value.trim());
                                  }
                                },
                                controllerData: dataController.searchController,
                                hintText: "Search",
                                prefixIcon: Icon(Icons.search,
                                    color: AppBodyColor.deepGrey),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(menuPage());
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.w),
                                child: SizedBox(
                                    width: 40.w,
                                    height: 60.h,
                                    child: ImageIcon(
                                      const AssetImage(
                                          "assets/image/profileIcon.png"),
                                      size: 30.w,
                                    )),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 30.h),
                        buildText(
                            text: "Main Categories".tr,
                            fontSize: 18.w,
                            fontWeight: FontWeight.w500,
                            color: AppTextColor.deepY2),
                        SizedBox(height: 30.h),
                        dataController.searchController.text.trim().isEmpty &&
                                dataController.categoryList.isNotEmpty
                            ? buildGridView(
                                currentItemList: dataController.categoryList)
                            : dataController.searchController.text
                                        .trim()
                                        .isEmpty &&
                                    dataController.categoryList.isEmpty
                                ? const NoDataWidget()
                                : dataController.searchCategoryList.isEmpty &&
                                        dataController.searchController.text
                                            .trim()
                                            .isNotEmpty
                                    ? const NoDataWidget(
                                        message: "Search Data Not Found")
                                    : buildGridView(
                                        currentItemList:
                                            dataController.searchCategoryList),
                      ],
                    )),
              ),
            ),
          ),
        ),
      );
    });
  }

  GridView buildGridView({List<dynamic>? currentItemList}) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.h,
            mainAxisExtent: 120.h),
        itemCount: currentItemList?.length,
        itemBuilder: (BuildContext context, int index) {
          var currentItemIndex = index;
          var item = currentItemList?[currentItemIndex];
          return GestureDetector(
            onTap: () async {
              UserData.userCategoriesId = item.uniqueId.toString();
              UserData.userMainCategoriesName = item.name.toString();
              SubCdataController.subCategory();
              Future.delayed(
                const Duration(seconds: 1),
                () {
                  adataController.searchCategoryList.clear();
                  adataController.searchController.clear();
                },
              );
            },
            child: buildSizedBox(item),
          );
        });
  }
}

Widget buildSizedBox(item) {
  return Column(
    children: [
      Container(
        height: 80.h,
        width: 90.w,
        decoration: BoxDecoration(
          color: AppBodyColor.yellow,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0.w),
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: item.image.toString(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
      SizedBox(height: 10.h),
      Text(
        item.name.toString(),
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: 14.w,
            color: AppTextColor.black,
            fontWeight: FontWeight.w400),
      )
    ],
  );
}
