import 'package:digicat/all.dart';
import 'package:digicat/screenUi/details/controller.dart';
import 'package:digicat/screenUi/home/homePage.dart';
import 'package:digicat/screenUi/sortFilter/controller.dart';
import 'package:digicat/screenUi/sortFilter/radioTilePage.dart';

class SortFilter extends StatelessWidget {
  SortFilter({super.key});
  final proDataController = Get.put(DetailsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SortFilterController>(builder: (dataController) {
      return Scaffold(
        appBar: buildAppBar(
            title: "",
            onTap: () {
              Get.back();
              dataController.dataClean();
            },
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 22.w),
                child: GestureDetector(
                    onTap: () {
                      Get.offAll(HomePage());
                    },
                    child: const Icon(Icons.home)),
              )
            ]),
        body: PopScope(
          onPopInvoked: (didPop) {
            dataController.dataClean();
          },
          child: SingleChildScrollView(
            child: Obx(() => Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.w, bottom: 20.h, right: 20.w),
                      child: buildTextField(context, onChanged: (value) {
                        if (value.trim().isEmpty) {
                          dataController.searchProductsList.clear();
                        } else if (value.trim().isNotEmpty) {
                          dataController.searchNames(value.trim());
                        }
                      },
                          top: 0.0,
                          controllerData: dataController.searchController,
                          hintText: "Search".tr,
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppBodyColor.deepGrey,
                          )),
                    ),
                    buildConGradient(
                        borderRadius: 0.0,
                        height: 50.h,
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.bottomSheet(RadioTilePage());
                              },
                              child: SizedBox(
                                width: 100,
                                height: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ImageIcon(
                                      const AssetImage("assets/image/sort.png"),
                                      size: 16.h,
                                    ),
                                    SizedBox(
                                      width: 14.w,
                                    ),
                                    buildText(
                                      text: "Sort".tr,
                                      fontSize: 16.w,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                dataController.filter();
                              },
                              child: SizedBox(
                                height: double.infinity,
                                width: 100.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ImageIcon(
                                      const AssetImage(
                                          "assets/image/filter.png"),
                                      size: 16.h,
                                    ),
                                    SizedBox(
                                      width: 14.w,
                                    ),
                                    buildText(
                                      text: "Filter".tr,
                                      fontSize: 16.w,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                    Padding(
                      padding:
                          EdgeInsets.only(right: 20.w, left: 20.w, top: 33.h),
                      child: Column(
                        children: [
                          dataController.searchController.text.trim().isEmpty &&
                                  dataController.productsList.isNotEmpty
                              ? buildGridView(
                                  currentItemList: dataController.productsList)
                              : dataController.searchController.text
                                          .trim()
                                          .isEmpty &&
                                      dataController.productsList.isEmpty
                                  ? const NoDataWidget()
                                  : dataController.searchController.text
                                              .trim()
                                              .isNotEmpty &&
                                          dataController
                                              .searchProductsList.isEmpty
                                      ? const NoDataWidget(
                                          message: "Search Data Not Found")
                                      : buildGridView(
                                          currentItemList: dataController
                                              .searchProductsList),
                        ],
                      ),
                    )
                  ],
                )),
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
            crossAxisCount: 2,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 20.h,
            mainAxisExtent: 200.h),
        itemCount: currentItemList?.length,
        itemBuilder: (BuildContext context, int index) {
          var currentItemIndex = index;
          var item = currentItemList?[currentItemIndex];
          return GestureDetector(
            onTap: () {
              proDataController.productsDerails(item.productsUniId, no: 0);
            },
            child: Column(
              children: [
                Container(
                  height: 200.h,
                  width: 155.w,
                  decoration: BoxDecoration(
                    color: AppBodyColor.yellow,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.r),
                        topRight: Radius.circular(8.r)),
                  ),
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        fit: BoxFit.fill,
                        height: 106.h,
                        width: 103.w,
                        imageUrl: item.image.toString(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      const Spacer(),
                      buildConGradient(
                          height: 70.h,
                          width: 155.w,
                          widget: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buildText(
                                    text: item.name.toString(), fontSize: 14.w),
                                buildText(
                                    text:
                                        "${SymbolRupee.rupee} ${item.productPrice}",
                                    fontWeight: FontWeight.w500),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
