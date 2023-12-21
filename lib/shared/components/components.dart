import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../models/productModel/Data.dart';
import '../../models/productModel/Product.dart';
import '../../modules/prodcuit_details/prodcut_details.dart';


Widget buildListProduct({
  required Product product
}) {
  return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
      ),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: product.data!.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>  ProductDetails(
                      id: product.data![index].id.toString(),
                    )
                )
            );
          },
          child: itemProduct(context,data: product.data![index]),
        );
      });
}


Widget itemProduct(BuildContext context,{
  required Data data ,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0),
    child: Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(data.productVariations![0].productVarientImages![0].imagePath!),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(data.name!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 15
            ),
            ),
            const Spacer(),
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(
                data.brands!.brandLogoImagePath!
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text('EGP ${data.productVariations![0].price}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold
            ),),
            const SizedBox(
              width: 15,
            ),
            const Icon(Icons.favorite_outline,color: Colors.white,),
            const SizedBox(
              width: 8,
            ),
            const Icon(Icons.shopping_cart,color: Colors.grey,),
          ],
        ),
      ],
    ),
  );
}

//Skeleton
Widget buildListProductSkeleton() {
  return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
      ),
      shrinkWrap: true,
      // physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 8,
      itemBuilder: (context, index) {
        return Skeletonizer(
          enabled: true,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Text('data.name!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: NetworkImage(
                          'data.brands!.brandLogoImagePath!'
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text('EGP 1010',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),),
                    const SizedBox(
                      width: 15,
                    ),
                    const Icon(Icons.favorite_outline,color: Colors.white,),
                    const SizedBox(
                      width: 8,
                    ),
                    const Icon(Icons.shopping_cart,color: Colors.grey,),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}

//Skeleton
