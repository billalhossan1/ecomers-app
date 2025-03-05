import 'package:ecomers_app/app/app_color.dart';
import 'package:ecomers_app/app/assets_path.dart';
import 'package:ecomers_app/features/product/model/product_list_model.dart';
import 'package:ecomers_app/features/product/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key,required this.productModel,
  });
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailsScreen.name,
          arguments: {
            'productId': productModel.sId,
            'inWishList': productModel.inWishlist ?? false,
          },
        );
      },

      child: SizedBox(
        width: 140,
        child: Card(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.themeColor.withValues(alpha: 0.2),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8))),
                  padding: const EdgeInsets.all(8.0),
                  // child: Image.asset(
                  //   AssetsPath.shoe,
                  //   fit: BoxFit.cover,
                  //   height: 100,
                  // ),
                  child:ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: (productModel.photos != null &&
                        productModel.photos!.isNotEmpty)
                        ? Image.network(
                      productModel.photos![0],
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    )
                        : Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey[300],
                      alignment: Alignment.center,
                      child: const Text(
                        "No Image Available",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    ),


                  ),
                ),
                 Column(

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        productModel.title??"No title available",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('\$${productModel.currentPrice??"0"}',style: const TextStyle(fontWeight: FontWeight.w600,color: AppColor.themeColor),),
                          const SizedBox(width: 6,),
                          const Wrap(
                            children: [
                              Icon(Icons.star,color: Colors.amber,size: 18,),
                              Text('0',style: TextStyle(fontWeight: FontWeight.w400),),
                            ],
                          ),
                          const SizedBox(width: 8,),

                          Icon(
                            productModel.inWishlist ?? false ? Icons.favorite : Icons.favorite_border,
                            size: 18,
                            color: productModel.inWishlist ?? false ? Colors.red : Colors.black,
                          )

                        ],
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );


  }

}
