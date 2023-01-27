import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:recycler/recycler.dart';

import '../../../../data/network/models/product_model.dart';
import '../controllers/product_list_controller.dart';
import '../delegate/product_delegate.dart';
import '../widgets/product_item.dart';
import '../widgets/product_loading.dart';

class ProductListView extends GetView<ProductListController>
    with ProductDelegate {
  final RecyclerController<Product> recyclerController =
      RecyclerController<Product>();

  ScrollController scrollController = ScrollController();

  void scrollListener() {
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      if (controller.currentPage == 1) {
        controller.initList();
      } else {
        if (controller.currentPage >= controller.maxPage) return;
        controller.incrementPage();
        controller.loadMore();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(scrollListener);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gift Catalog'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                controller.toCart();
              },
              icon: const Icon(Icons.shopping_basket_rounded))
        ],
      ),
      body: FutureBuilder(
        future: controller.initList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return buildContent();
          }

          return const ProductLoading();
        },
      ),
    );
  }

  // Widget buildContent() {
  //   return Obx(
  //     () => Recycler<Product>(
  //         recyclerController: recyclerController,
  //         itemBuilder: (context, item, index) => ProductItem(
  //                       productAttributes: item,
  //                       productId: item.id.toString(),
  //                       delegate: this,
  //                     ),
  //         pageFetch: pageFetch,
  //         onEmpty: const Center(child: Text('Empty')),
  //         onError: (error) => Center(child: Text(error.toString()))),
  //   );
  // }

  Widget buildContent() {
    return Obx(
      () => GridView.builder(
          itemCount: controller.data.length,
          controller: scrollController,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 300,
          ),
          itemBuilder: (ctx, index) {
            return ProductItem(
              productAttributes: controller.data[index].attributes,
              productId: controller.data[index].id.toString(),
              delegate: this,
            );
          }),
    );
  }

  @override
  void onAddToWishlist(String productId) {
    controller.onWishlist(productId);
  }

  @override
  void onItemPressed(String productId) {
    controller.toProductDetail(productId);
  }
}
