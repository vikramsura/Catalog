import 'package:digicat/all.dart';

Widget buildConButton(
    {height,
    width,
    color,
    borderRadius,
    text,
    colorText,
    bool loading = false,
    fontWeight,
    borderColor,
    fontSize}) {
  return Container(
    height: height ?? 55.h,
    width: width ?? 1.sw,
    decoration: BoxDecoration(
        color: color ?? AppBodyColor.deepYellow,
        borderRadius: BorderRadius.circular(borderRadius ?? 28.r),
        border: Border.all(color: borderColor ?? Colors.transparent)),
    child: Center(
        child: loading
            ? CircularProgressIndicator(color: AppBodyColor.white)
            : Text(
                text,
                style: TextStyle(
                    color: colorText ?? AppTextColor.white,
                    fontWeight: fontWeight ?? FontWeight.w500,
                    fontSize: fontSize ?? 18.w),
              )),
  );
}

Widget buildConGradient({height, width, borderRadius, widget}) {
  return Container(
    height: height ?? 60.h,
    width: width ?? 1.sw,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.topRight,
        stops: [
          0.05,
          0.16,
          0.25,
          0.4,
          0.6,
          0.9,
          1,
        ],
        colors: [
          Color(0xFFDFC772),
          Color(0xFFEFE7B6),
          Color(0xFFEEE379),
          Color(0xFFF0E6B3),
          Color(0xFFD8BF65),
          Color(0xFFEDDB99),
          Color(0xFFDCC366),
        ],
      ),
    ),
    child: widget,
  );
}
