import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:test_implementation_codebase_flutter_rgb/app/component/image/image_network.dart';
import 'package:test_implementation_codebase_flutter_rgb/utils/extention/int_extention.dart';

import '../../../../common/themes/colors_palette.dart';
import '../../../../common/themes/typography_theme.dart';
import '../../../../data/network/models/product_model.dart';
import '../../../component/button/border_button.dart';
import '../../../component/button/primary_button.dart';
import '../../../component/custom_ui/custom_triangle_shape_new.dart';
import '../../../component/custom_ui/quantity_controller_widget.dart';
import '../../../component/rating_bar/rating_bar_generic.dart';
import '../controllers/product_detail_controller.dart';
import '../widgets/product_detail_loading.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gift Detail'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black54,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: controller.initProductDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return buildContent(context, controller.product.value!,);
          }
          return const Center(
            child: ProductDetailLoading(),
          );
        },
      ),
    );
  }

  Widget buildContent(
      BuildContext context, Product attributes) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                  height: Get.height * 0.3,
                  width: double.infinity,
                  child: GenericImageNetwork(
                    imageUrl: attributes.images.first,
                  )),
              Visibility(
                visible: attributes.isNew == 1,
                child: Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: SizedBox(
                    height: 75,
                    width: 75,
                    child: CustomPaint(
                      size: Size(100, (100 * 1.0224215246636772).toDouble()),
                      painter: CustomShapeTriangleNew(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 24, right: 24),
            child: Text(
              attributes.name,
              style: TypographyTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Html(
              data: attributes.info,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: _buildRatingSection(
                        attributes.rating, attributes.numOfReviews)),
                const SizedBox(
                  height: 55,
                  child: VerticalDivider(
                    thickness: 1,
                    width: 8,
                    color: Colors.black26,
                  ),
                ),
                Expanded(flex: 1, child: _buildPointSection(attributes.points)),
                const SizedBox(
                  height: 55,
                  child: VerticalDivider(
                    thickness: 1,
                    width: 8,
                    color: Colors.black26,
                  ),
                ),
                Expanded(flex: 1, child: _buildAddToWishlistSection())
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 24, right: 24),
            child: Text(
              "Info Produk",
              style: TypographyTheme.titleMedium,
            ),
          ),
          GetBuilder<ProductDetailController>(
            builder: (ctrl) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Html(
                    data: attributes.description,
                    shrinkWrap: true,
                    style: {
                      '#': Style(
                        maxLines: ctrl.isExpanded.value ? 1000 : 3,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: InkWell(
                        onTap: () {
                          ctrl.onSeeMoreDescription();
                        },
                        child: Text(
                          ctrl.isExpanded.value
                              ? 'Lihat lebih sedikit'
                              : 'Lihat semua',
                          style: TypographyTheme.titleRegular
                              .copyWith(color: ColorsPalette.greenColor),
                        )),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: GetBuilder<ProductDetailController>(
                      builder: (ctrl) => QuantityControllerWidget(
                        onIncrement: () {
                          controller.addQuantity();
                        },
                        onDecrement: () {
                          controller.detractQuantity();
                        },
                        quantity: ctrl.quantity.value,
                      ),
                    )),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  flex: 1,
                  child: GetBuilder<ProductDetailController>(
                    builder: (ctrl) => BorderButton(
                      context: context,
                      isEnabled: true,
                      onPressed: () {
                        ctrl.addToCart(context);
                      },
                      text: ctrl.isProductAddedToCart.value ?  'Remove from Cart' : 'Add to Cart',
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: PrimaryButton(
              context: context,
              isEnabled: true,
              onPressed: () {
                controller.redeemProduct(context);
              },
              text: 'Redeem',
              margin: 32,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingSection(double rating, int ratingCount) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RatingBarGeneric(rating: rating),
        Text('$ratingCount'),
        const Text('Reviews'),
      ],
    );
  }

  Widget _buildPointSection(int points) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/ic_point.png',
          width: 24,
          height: 24,
        ),
        FittedBox(
          child: Text(
            points.toThousandFormat(),
            style: TypographyTheme.titleLarge
                .copyWith(color: ColorsPalette.greenColor),
          ),
        ),
        const Text('Points'),
      ],
    );
  }

  Widget _buildAddToWishlistSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GetBuilder<ProductDetailController>(
          builder: (ctrl) => IconButton(
            onPressed: () {
              ctrl.onWishlist();
            },
            icon: Icon(
              ctrl.isWishList.value
                  ? CupertinoIcons.heart_fill
                  : CupertinoIcons.suit_heart,
              size: 32,
              color: ctrl.isWishList.value
                  ? ColorsPalette.redColor
                  : ColorsPalette.borderColor,
            ),
          ),
        ),
        const Text('Add to'),
        const Text('Wishlist'),
      ],
    );
  }
}
