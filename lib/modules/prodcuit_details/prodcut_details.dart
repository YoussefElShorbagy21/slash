import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:slash/modules/prodcuit_details/cubit/product_details_cubit.dart';

import '../../models/productDetailsModel/AvaiableProperties.dart';
import '../../models/productDetailsModel/Data.dart';
import '../../models/productDetailsModel/Values.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key,required this.id});
  String id ;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsCubit()..getProductDetails(id: id),
      child: BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ProductDetailsCubit.get(context).productDetails.data ;
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.white,
                ),
              ),
              backgroundColor: const Color(0XFF0c0c0c),
              title: const Text('Product Details',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
            ),
            backgroundColor: const Color(0XFF0c0c0c),
            body: Conditional.single(
                context: context,
                conditionBuilder: (BuildContext context) => state is !ProductDetailsLoading,
                widgetBuilder: (BuildContext context) => CustomScrollView(
                 slivers: [
                   SliverToBoxAdapter(
                     child:    Padding(
                       padding: const EdgeInsets.all(30.0),
                       child: Column(
                         children: [
                           FanCarouselImageSlider(
                             autoPlay: false,
                             imagesLink: ProductDetailsCubit.get(context).image,
                             isAssets: false,
                             initalPageIndex: 0,
                             showIndicator: false,
                           ),

                           SizedBox(
                               height: 50,
                               child: buildListImage(context)),
                           Row(
                             children: [
                               Text(cubit!.name!,
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
                                   cubit.brandImage!,
                                 ),
                               ),
                             ],
                           ),
                           Row(
                             children: [
                               Text('EGP ${ProductDetailsCubit.get(context).price}',
                                 style: const TextStyle(
                                     fontWeight: FontWeight.bold,
                                     color: Colors.white,
                                     fontSize: 15
                                 ),
                               ),
                               const Spacer(),
                               Text(cubit.brandName!,
                                 style: const TextStyle(
                                     fontWeight: FontWeight.bold,
                                     color: Colors.white,
                                     fontSize: 15
                                 ),
                               ),
                             ],
                           ),
                           const SizedBox(
                             height: 10,
                           ),

                           SizedBox(
                               height: cubit.avaiableProperties!.isEmpty ? 1 :
                                   cubit.avaiableProperties!.length == 1 ? 150:
                                   cubit.avaiableProperties!.length == 2 ?  250:
                               MediaQuery.sizeOf(context).height / 2.5,
                               child: buildListAvaiableProperties(cubit)),

                           AnimatedContainer(
                             duration: const Duration(milliseconds: 800),
                             decoration: BoxDecoration(
                               color: const Color(0xff303030),
                               borderRadius: BorderRadius.circular(15),
                             ),
                             child: Column(
                               children: [
                                 Row(
                                   children: [
                                     const Padding(
                                       padding: EdgeInsets.only(left: 8.0),
                                       child: Text('Description',
                                         style: TextStyle(
                                           color: Colors.white,
                                         ),),
                                     ),
                                     const Spacer(),
                                     IconButton(
                                       icon: const Icon(
                                         Icons.arrow_drop_down_sharp,
                                         color: Colors.white,
                                       ), onPressed: () {
                                       ProductDetailsCubit.get(context).showDescription();
                                     },)
                                   ],
                                 ),
                                 ProductDetailsCubit.get(context).isShow ? Container() : AnimatedContainer(
                                   duration: const Duration(milliseconds: 800),
                                   child: Column(
                                     children: [
                                       Text(cubit.description.toString(),
                                         style: const TextStyle(
                                             fontSize: 15,
                                             color: Colors.grey,
                                             fontWeight: FontWeight.bold
                                         ),),
                                       const SizedBox(
                                         height: 10,
                                       ),
                                     ],
                                   ),
                                 )


                               ],
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),


                 ],
                ),
                fallbackBuilder: (BuildContext context) => const Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}

Widget buildListImage(BuildContext context) => ListView.separated(
  scrollDirection: Axis.horizontal,
    itemBuilder: (BuildContext context , index) => Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              ProductDetailsCubit.get(context).image[index]
          ),
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.circular(10),
        border: const Border(
          top: BorderSide(
              color: Color(0xff7ea222)
          ),
          left: BorderSide(
              color: Color(0xff7ea222)
          ),
            right: BorderSide(
                color: Color(0xff7ea222)
            ),
          bottom: BorderSide(
            color: Color(0xff7ea222)
          )
        )
      ),
      width: 50,
    ),
    separatorBuilder: (BuildContext context , index) => const SizedBox(
      width: 10,
    ),
    itemCount: ProductDetailsCubit.get(context).image.length,
);
Widget buildListAvaiableProperties(Data data) => ListView.separated(
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (BuildContext context , index) {
      return Column(
      children: [
        const SizedBox(
          height: 10,
        ),

        data.avaiableProperties!.isEmpty ? Container() :
        data.avaiableProperties![index].property != 'Color' ? Container(): SizedBox(
          height: 25,
          child: buildListColor(avaiableProperties: data.avaiableProperties![index]),
        ),

        const SizedBox(
          height: 10,
        ),

        data.avaiableProperties!.isEmpty ? Container() :
        data.avaiableProperties![index].property != 'Materials' ? Container(): Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text('Select Materials',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white
                  ),),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 50,
                child: buildListMaterials(avaiableProperties: data.avaiableProperties![index])),
          ],
        ),

        const SizedBox(
          height: 10,
        ),

        data.avaiableProperties!.isEmpty ? Container() :
        data.avaiableProperties![index].property != 'Size' ? Container(): Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text('Select Size',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white
                  ),),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 40,
                child: buildListSize(avaiableProperties: data.avaiableProperties![index])),
          ],
        ),
      ],
    );
    },
    separatorBuilder: (BuildContext context , index) => const SizedBox(
      height: 10,
    ),
    itemCount: data.avaiableProperties!.length,
);
Widget buildListColor({required AvaiableProperties avaiableProperties}) => ListView.separated(
  scrollDirection: Axis.horizontal,
  separatorBuilder: (BuildContext context , index) => const SizedBox(
    width: 10,
  ),
  itemBuilder: (BuildContext context , index) {
    return GestureDetector(
      onTap: (){
        ProductDetailsCubit.get(context).price = ProductDetailsCubit.get(context).productDetails.data!.variations![index].price.toString();

        ProductDetailsCubit.get(context).changeButton(
          productDetailsModel: ProductDetailsCubit.get(context).productDetails,
          index: index,
        );
      },
      child: CircleAvatar(
      radius:  10,
      backgroundColor:  ProductDetailsCubit.get(context).change == index ?  Colors.white : Colors.transparent,
      child: CircleAvatar(
        radius: 8,
        backgroundColor: Color(int.parse('0xFF${avaiableProperties.values![index].value!.replaceAll('#', '')}')),
      ),
        ),
    );
  },
  itemCount: avaiableProperties.values!.length,
);


Widget buildListMaterials({required AvaiableProperties avaiableProperties}) => ListView.separated(
  scrollDirection: Axis.horizontal,
  separatorBuilder: (BuildContext context , index) => const SizedBox(
    width: 10,
  ),
  itemBuilder: (BuildContext context , index) {
    return  TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
        backgroundColor:
        ProductDetailsCubit.get(context).change == index ?  MaterialStateProperty.all(const Color(0xffb8ee2e)) : MaterialStateProperty.all(const Color(0xff1d1d1f)),
      ),
        onPressed: (){
          ProductDetailsCubit.get(context).price = ProductDetailsCubit.get(context).productDetails.data!.variations![index].price.toString();

        ProductDetailsCubit.get(context).changeButton(
          productDetailsModel: ProductDetailsCubit.get(context).productDetails,
          index: index,
        );
        },
        child: Text(
          avaiableProperties.values![index].value.toString(),
          style: TextStyle(
            color: ProductDetailsCubit.get(context).change != index ?  Colors.white : Colors.black,
            fontSize: 15
          ),
        )
    );
  },
  itemCount: avaiableProperties.values!.length,
);


Widget buildListSize({required AvaiableProperties avaiableProperties}) => ListView.separated(
  scrollDirection: Axis.horizontal,
  separatorBuilder: (BuildContext context , index) => const SizedBox(
    width: 10,
  ),
  itemBuilder: (BuildContext context , index) {
    return  TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          backgroundColor:  ProductDetailsCubit.get(context).change == index ?  MaterialStateProperty.all(const Color(0xffb8ee2e)) : MaterialStateProperty.all(const Color(0xff1d1d1f)),
        ),
        onPressed: (){
          ProductDetailsCubit.get(context).price = ProductDetailsCubit.get(context).productDetails.data!.variations![index].price.toString();

          ProductDetailsCubit.get(context).changeButton(
            productDetailsModel: ProductDetailsCubit.get(context).productDetails,
            index: index,
          );
        },
        child: Text(
          avaiableProperties.values![index].value.toString(),
          style:  TextStyle(
              color: ProductDetailsCubit.get(context).change != index ?  Colors.white : Colors.black,
              fontSize: 15
          ),
        )
    );
  },
  itemCount: avaiableProperties.values!.length,
);