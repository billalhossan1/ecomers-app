import 'package:ecomers_app/app/app_color.dart';
import 'package:ecomers_app/app/assets_path.dart';
import 'package:ecomers_app/features/product/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key, required this.tittle, required this.rating, required this.price,
  });
  final String tittle;
  final int price;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailsScreen.name,arguments: 1);
      },
      child: SizedBox(
        width: 140,
        child: Card(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.themeColor.withOpacity(0.44),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8))),
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    AssetsPath.shoe,
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                ),
                 Column(

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        tittle,
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
                          Text('\$$price',style: const TextStyle(fontWeight: FontWeight.w600,color: AppColor.themeColor),),
                          const SizedBox(width: 6,),
                          Wrap(
                            children: [
                              const Icon(Icons.star,color: Colors.amber,size: 18,),
                              Text('$rating',style: const TextStyle(fontWeight: FontWeight.w400),),
                            ],
                          ),
                          const SizedBox(width: 8,),
                          const Icon(Icons.favorite,size: 18,)
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
