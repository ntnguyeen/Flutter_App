import 'package:flutter_cake_app/pages/home/food_page_body.dart';
import 'package:flutter_cake_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cake_app/utils/dimensions.dart';

import 'package:flutter_cake_app/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: Column(
          children: [
            //Header
            Container(
              child: Container(
                margin: EdgeInsets.only(
                  top: Dimensions.height55,
                  bottom: Dimensions.height15,
                ),
                padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                          text: 'TTCake',
                          color: AppColors.mainColor,
                          size: 30,
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        width: Dimensions.width45,
                        height: Dimensions.height45,
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: Dimensions.iconSize24,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Body
            Expanded(
              child: SingleChildScrollView(
                child: FoodPageBody(),
              ),
            ),
          ],
        ),
        onRefresh: _loadResource);
  }
}
