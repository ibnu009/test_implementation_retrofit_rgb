import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_implementation_codebase_flutter_rgb/data/network/models/product_model.dart';
import 'package:test_implementation_codebase_flutter_rgb/utils/extention/int_extention.dart';

import '../../../../common/themes/colors_palette.dart';
import '../../../../common/themes/typography_theme.dart';
import '../../../component/custom_ui/custom_triangle_shape_new.dart';
import '../../../component/image/image_network.dart';
import '../../../component/rating_bar/rating_bar_generic.dart';
import '../delegate/product_delegate.dart';

class ProductItem extends StatefulWidget {
  final ProductDelegate delegate;
  final Product productAttributes;
  final String productId;

  const ProductItem(
      {Key? key,
      required this.productAttributes,
      required this.delegate,
      required this.productId})
      : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool _isFavorite = false;
  bool _isNew = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isFavorite = widget.productAttributes.isWishlist == 1;
    _isNew = widget.productAttributes.isNew == 1;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.delegate.onItemPressed(widget.productId);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black12),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 150,
                    child: GenericImageNetwork(
                      imageUrl: widget.productAttributes.images.first,
                      fit: BoxFit.cover,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                  child: Text(
                    widget.productAttributes.name,
                    style: TypographyTheme.titleMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: FittedBox(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/ic_point_circle.png',
                          width: 14,
                          height: 14,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "${widget.productAttributes.points.toThousandFormat()} poins",
                          style: TypographyTheme.titleMedium.copyWith(
                              color: ColorsPalette.greenColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildRatingWidget(),
                      IconButton(
                        onPressed: () {
                          widget.delegate.onAddToWishlist(widget.productId);
                          setState(() {
                            _isFavorite = !_isFavorite;
                          });
                        },
                        icon: Icon(
                          _isFavorite
                              ? CupertinoIcons.heart_fill
                              : CupertinoIcons.suit_heart,
                          size: 32,
                          color: _isFavorite
                              ? ColorsPalette.redColor
                              : ColorsPalette.borderColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Visibility(
              visible: _isNew,
              child: Positioned(
                top: 0.0,
                right: 0.0,
                child: SizedBox(
                  height: 75,
                  width: 75,
                  child: CustomPaint(
                    size: Size(100, (100 * 1.0224215246636772).toDouble()),
                    //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: CustomShapeTriangleNew(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RatingBarGeneric(rating: widget.productAttributes.rating),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text('${widget.productAttributes.numOfReviews} Reviews'),
        ),
      ],
    );
  }
}
