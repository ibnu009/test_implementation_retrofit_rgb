import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../component/custom_ui/shimmering_skeleton.dart';
import '../../../component/rating_bar/rating_bar_generic.dart';

class ProductDetailLoading extends StatelessWidget {
  const ProductDetailLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildContent(context);
  }
  Widget buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: const Center(child: SkeletonIcon(icon: Icons.image, size: 180,)),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0, left: 24, right: 24),
              child: Skeleton(width: double.infinity, height: 22),
            ),
            const SizedBox(height: 16,),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Skeleton(width: double.infinity, height: 16),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Skeleton(width: double.infinity, height: 16),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Skeleton(width: double.infinity, height: 16),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Skeleton(width: double.infinity, height: 16),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: _buildRatingSection()),
                  const SizedBox(
                    height: 55,
                    child: VerticalDivider(
                      thickness: 1,
                      width: 8,
                      color: Colors.black26,
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: _buildPointSection()),
                  const SizedBox(
                    height: 55,
                    child: VerticalDivider(
                      thickness: 1,
                      width: 8,
                      color: Colors.black26,
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: _buildAddToWishlistSection())
                ],
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(top: 16.0, bottom: 8),
              child: Skeleton(width: 40, height: 20,),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Skeleton(width: double.infinity, height: 16),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Skeleton(width: double.infinity, height: 16),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Skeleton(width: 55, height: 17),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: const [
                  Expanded(
                      flex: 1,
                      child: Skeleton(width: double.infinity, height: 55, radius: 32,)),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      flex: 1,
                      child: Skeleton(width: double.infinity, height: 55, radius: 32,)),                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 32.0),
              child: Skeleton(width: double.infinity, height: 55, radius: 32,),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRatingSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        RatingBarGeneric(rating: 0, color: Colors.grey, itemSize: 16,),
        SizedBox(height: 4,),
        Padding(
          padding: EdgeInsets.only(left: 4.0),
          child: Skeleton(height: 14, width: 60,),
        ),
      ],
    );
  }

  Widget _buildPointSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        SkeletonIcon(icon: Icons.image, size: 28,),
        Skeleton(width: 55, height: 20,),
        SizedBox(height: 4,),
        Skeleton(width: 40, height: 18,),
      ],
    );
  }

  Widget _buildAddToWishlistSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        SkeletonIcon(icon: CupertinoIcons.heart_fill, size: 32,),
        SizedBox(height: 4,),
        Skeleton(width: 55, height: 20,),
        SizedBox(height: 4,),
        Skeleton(width: 40, height: 20,),
      ],
    );
  }
}
