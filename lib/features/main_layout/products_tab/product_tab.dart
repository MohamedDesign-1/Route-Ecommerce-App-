import 'package:ecommerce_app/features/main_layout/products_tab/cubit/product_view_model.dart';
import 'package:ecommerce_app/features/main_layout/products_tab/widgets/custom_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/resources/color_mananger.dart';
import '../../../core/routes_manager/routes.dart';

class ProductTab extends StatelessWidget {
  const ProductTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductViewModel, ProductState>(
      bloc: ProductViewModel.get(context)..getAllProducts(),
      builder: (context, state) {
        return Scaffold(
          body: ProductViewModel.get(context).productList.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 250,
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
                            itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, Routes.productDetailsRoute,
                                      arguments: ProductViewModel.get(context).productList[index]);
                                },
                                child: CustomProductItem(
                                  product: ProductViewModel.get(context).productList[index],
                                )),
                            itemCount: ProductViewModel.get(context)
                                .productList
                                .length),
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(
                  color: ColorManager.primary,
                )),
        );
      },
    );
  }
}
