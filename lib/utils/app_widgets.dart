//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';


Widget placeHolderWidget({double? height, double? width, BoxFit? fit, AlignmentGeometry? alignment, double? radius}) {
  return Image.asset('assets/placeholder.jpg', height: height, width: width, fit: fit ?? BoxFit.cover, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
}

Widget noDataWidget() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset('assets/no_data.png', height: 80, fit: BoxFit.fitHeight),
      8.height,
      Text('No Data', style: boldTextStyle()).center(),
    ],
  ).center();
}
