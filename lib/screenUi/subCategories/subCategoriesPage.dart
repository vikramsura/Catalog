import 'package:digicat/all.dart';
import 'package:digicat/screenUi/home/homePage.dart';
import 'package:digicat/screenUi/solitaireRing/controller.dart';

class SubCategoriesPage extends StatelessWidget {
  SubCategoriesPage({super.key});

  final dataController = Get.put(SubCategoriesController());
  final SolitaireDataController = Get.put(SolitaireController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(right: 20.w, left: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildText(
                  text: "${UserData.userMainCategoriesName} Categories".tr,
                  fontSize: 18.w,
                  fontWeight: FontWeight.w500,
                  color: AppTextColor.deepY2),
              SizedBox(
                height: 32.h,
              ),
              Obx(() => dataController.subCategoryList.isEmpty
                  ? const NoDataWidget()
                  : GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h,
                          mainAxisExtent: 140.h),
                      itemCount: dataController.subCategoryList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var item = dataController.subCategoryList[index];
                        return GestureDetector(
                          onTap: () async {
                            UserData.userSubCategoriesId =
                                item.uniqueId.toString();
                            UserData.userSubCategoriesName =
                                item.name.toString();
                            SolitaireDataController.solitaire();
                          },
                          child: buildSizedBox(item),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
