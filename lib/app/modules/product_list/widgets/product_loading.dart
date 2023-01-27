import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../component/custom_ui/shimmering_skeleton.dart';
import '../../../component/rating_bar/rating_bar_generic.dart';

class ProductLoading extends StatelessWidget {
  const ProductLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 6,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 300,
        ),
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildLoadingSkeleton(),
          );
        });
  }

  Widget _buildLoadingSkeleton(){
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 150,
            width: double.infinity,
            child: Skeleton(),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0, left: 8, right: 8),
            child: Skeleton(height: 20,),
          ),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Skeleton(height: 16,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildRatingWidget(),
                const SkeletonIcon(icon: CupertinoIcons.heart_fill),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        RatingBarGeneric(rating: 0, color: Colors.grey),
        SizedBox(height: 4,),
        Padding(
          padding: EdgeInsets.only(left: 4.0),
          child: Skeleton(height: 14, width: 60,),
        ),
      ],
    );
  }
}
