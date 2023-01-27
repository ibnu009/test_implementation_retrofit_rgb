import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../common/themes/colors_palette.dart';

class RatingBarGeneric extends StatelessWidget {
  final double rating;
  final Color? color;
  final double? itemSize;
  const RatingBarGeneric({Key? key, required this.rating, this.color, this.itemSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      unratedColor: Colors.grey,
      itemCount: 5,
      ignoreGestures: true,
      itemSize: itemSize ?? 20,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: color ?? ColorsPalette.yellowColor,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
