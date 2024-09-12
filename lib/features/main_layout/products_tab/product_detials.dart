import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widgets/custom_button.dart';
import 'package:ecommerce_app/features/main_layout/products_tab/widgets/attribute_widget.dart';
import 'package:ecommerce_app/features/main_layout/products_tab/widgets/cutsom_title_and_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:read_more_text/read_more_text.dart';

import '../../../core/resources/color_mananger.dart';
import '../../../core/resources/constants_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/resources/values_manager.dart';

class ProductDetials extends StatelessWidget {
  const ProductDetials({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Details'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: ColorManager.primary),
            onPressed: () {
              Navigator.pop(context, Routes.mainLayoutRoute);
            },
          ),
          actions: [
            IconButton(
              icon:
                  const Icon(Icons.shopping_cart, color: ColorManager.primary),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.share, color: ColorManager.primary),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: ColorManager.primary),
              ),
              child: CachedNetworkImage(
                imageUrl: AppConstants.imageUrl,
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
                placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                  color: ColorManager.primary,
                )),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: AppSize.s16.h,
            ),
            CutsomTitleAndPrice(title: 'Nike Air Jordon', price: '2000'),
            SizedBox(
              height: AppSize.s16.h,
            ),
            Row(children: [
              AttributeWidget(
                title: '3000 Sold',
                width: 120,
                color: ColorManager.primary,
              ),
              SizedBox(
                width: AppSize.s8.w,
              ),
              AttributeWidget(
                title: '4.8 (2000)',
                icon: Icons.star,
                width: 120,
                color: Colors.transparent,
              ),
            ]),
            SizedBox(
              height: AppSize.s16.h,
            ),
              Text(
              'Description',
              style: getBoldStyle(
                  color: ColorManager.black, fontSize: FontSizeManager.s18),
            ),
              SizedBox(
                height: AppSize.s8.h,
              ),
              Text('Product Description', style: getBoldStyle(color: ColorManager.black , fontSize: FontSizeManager.s18),),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('Total Price', style: getMediumStyle(color: ColorManager.primary.withOpacity(0.5) , fontSize: FontSizeManager.s18),),
                    Text(' EGP 2000', style: getBoldStyle(color: ColorManager.black, fontSize: FontSizeManager.s18),),
                    ],
                  ),
                  SpinnerButton(
                    onPressed: () {},
                    width: 310.w,
                    actionText: AppConstants.addedToCart,
                    textName: AppConstants.addToCart,
                    textColor: ColorManager.white,
                    buttonColor: ColorManager.primary,
                    isLoading: false,
                    isSuccess: false,
                  )
                ]
              ),

            ]
          ),
        )
    );
  }
}
