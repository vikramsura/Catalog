import 'package:carousel_slider/carousel_slider.dart';
import 'package:digicat/all.dart';
import 'package:digicat/screenUi/details/controller.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageView extends StatefulWidget {
  var data;
  ImageView({super.key, required this.data});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  final dataController = Get.put(DetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppBodyColor.yellow,
      body: SafeArea(
        child: Stack(
          children: [
            // PhotoViewGallery(pageOptions: pageOptions);
            CarouselSlider.builder(
              options: CarouselOptions(
                aspectRatio: 16 / 9,
                viewportFraction: 2.w,
                height: 1.sh,
                initialPage: widget.data,
              ),
              itemCount: dataController.productDerailsList.productImage?.length,
              itemBuilder: (context, index, realIndex) {
                return PhotoViewGallery(
                    backgroundDecoration:
                        BoxDecoration(color: AppBodyColor.yellow),
                    pageOptions: [
                      PhotoViewGalleryPageOptions(
                        minScale: 1.0,
                        maxScale: 4.0,
                        imageProvider: NetworkImage(dataController
                            .productDerailsList.productImage![index].image
                            .toString()),
                        initialScale: PhotoViewComputedScale.contained * 0.4,
                      ),
                    ]);
                // return InteractiveViewer(
                //     minScale: 1.0,
                //     maxScale: 3.0,
                //     child: Image.network(
                //       dataController
                //           .productDerailsList.productImage![index].image
                //           .toString(),
                //     ));
              },
            ),
            Positioned(
                right: 25.w,
                top: 15.h,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    size: 40.h,
                  ),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                      color: AppBodyColor.white,
                      borderRadius: BorderRadius.circular(6.r)),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount:
                        dataController.productDerailsList.productImage?.length,
                    itemBuilder: (context, index) {
                      var item = dataController
                          .productDerailsList.productImage?[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          showDialog(
                            context: context,
                            builder: (context) {
                              return ImageView(data: index);
                            },
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 6.h),
                          child: Container(
                            height: 60.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                              color: AppBodyColor.deepYellow,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0.w),
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl: item!.image.toString(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
