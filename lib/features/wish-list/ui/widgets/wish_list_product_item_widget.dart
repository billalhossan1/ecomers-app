import 'package:ecomers_app/app/app_color.dart';
import 'package:ecomers_app/app/assets_path.dart';
import 'package:ecomers_app/app/urls.dart';
import 'package:ecomers_app/features/common/model/product_list_model.dart';
import 'package:ecomers_app/features/common/ui/controller/auth_controller.dart';
import 'package:ecomers_app/features/common/ui/widgets/show_snackbar_message.dart';
import 'package:ecomers_app/features/product/ui/screens/product_details_screen.dart';
import 'package:ecomers_app/features/wish-list/controller/delete_wish_controller.dart';
import 'package:ecomers_app/features/wish-list/controller/wish_list_controller.dart';
import 'package:ecomers_app/services/network_caller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListProductItemWidget extends StatefulWidget {
  const WishListProductItemWidget({
    super.key, required this.wishListModel,
  });
  final ProductModel wishListModel;
  @override
  State<WishListProductItemWidget> createState() => _WishListProductItemWidgetState();
}

class _WishListProductItemWidgetState extends State<WishListProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.name, arguments: 1);
      },
      child: SizedBox(
        width: 150,


        child: Card(
            color: Colors.white,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: (widget.wishListModel.product!.photos != null &&
                      widget.wishListModel.product!.photos!.isNotEmpty)
                      ? Image.network(
                    widget.wishListModel.product!.photos![0],
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
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.wishListModel.product!.title!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '\$${widget.wishListModel.product!.currentPrice}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColor.themeColor),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Wrap(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              ),
                              Text(
                                '${widget.wishListModel.iV}',
                                style: const TextStyle(fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: (){
                              onTapDelete(context);
                            },
                            child: Container(
                                decoration: const BoxDecoration(
                                  color: AppColor.themeColor
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.delete_outline,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                )),
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
  void onTapDelete(BuildContext context)async{
    final bool result = await Get.find<DeleteWishController>().deleteWish(widget.wishListModel.sId!);
    if(result){
      Get.find<WishListController>().getWishList();
      showSnackBarMessage(context, 'Cart Deleted Successfully');

    }else{
      showSnackBarMessage(context, Get.find<DeleteWishController>().errorMessage!);
    }
  }

}
