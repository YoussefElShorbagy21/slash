import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:slash/shared/components/components.dart';


import 'cubit/product_cubit.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getProduct(),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ProductCubit.get(context).product;
          return Scaffold(
            backgroundColor: const Color(0XFF0c0c0c),
            appBar: AppBar(
              backgroundColor: const Color(0xff0c0c0c),
              title: const Text('Slash.',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),),
              centerTitle: true,
            ),
            body: Conditional.single(
                context: context,
                conditionBuilder: (BuildContext context) => state is !ProductLoading,
                widgetBuilder: (BuildContext context) => buildListProduct(product: cubit),
                fallbackBuilder: (BuildContext context) => buildListProductSkeleton()),
          );
        },
      ),
    );
  }
}
