import 'package:digicat/all.dart';
import 'package:digicat/screenUi/home/homePage.dart';
import 'package:digicat/screenUi/solitaireRing/controller.dart';
import 'package:digicat/screenUi/sortFilter/controller.dart';

class SolitairePage extends StatelessWidget {
  SolitairePage({super.key});

  final dataController = Get.put(SolitaireController());
  final prodDataController = Get.put(SortFilterController());

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
                  text: "${UserData.userSubCategoriesName} Categories",
                  fontSize: 18.w,
                  fontWeight: FontWeight.w500,
                  color: AppTextColor.deepY2),
              SizedBox(
                height: 32.h,
              ),
              Obx(() => dataController.solitaireList.isEmpty
                  ? const NoDataWidget()
                  : GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h,
                          mainAxisExtent: 140.h),
                      itemCount: dataController.solitaireList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var item = dataController.solitaireList[index];
                        return GestureDetector(
                          onTap: () async {
                            UserData.userSolitaireId = item.uniqueId.toString();
                            prodDataController.products();
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
