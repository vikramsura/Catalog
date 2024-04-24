import 'package:digicat/all.dart';

Widget buildRichText({fontSize, fontWeight, color, widget}) {
  return Text.rich(TextSpan(
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          fontFamily: "Roboto"),
      children: widget));
}
