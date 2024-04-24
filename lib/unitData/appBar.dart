import 'package:digicat/all.dart';

AppBar buildAppBar(
    {String? title,
    backgroundColor,
    void Function()? onTap,
    List<Widget>? actions}) {
  return AppBar(
    leading: GestureDetector(
        onTap: onTap, child: const Icon(Icons.arrow_back_outlined)),
    backgroundColor: backgroundColor ?? AppBodyColor.white,
    title: buildText(
        text: title,
        fontWeight: FontWeight.w500,
        fontSize: 25.w,
        color: AppTextColor.deepY2),
    centerTitle: true,
    actions: actions,
  );
}
