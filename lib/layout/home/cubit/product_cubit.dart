import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/productModel/Product.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../../shared/resources/string_manager.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  static ProductCubit get(context) => BlocProvider.of(context);


  Product product = Product(
    statusCode: 0,
    message: '',
    data: []
  );
  Future<void> getProduct() async {
    emit(ProductLoading());
    await DioHelper.getDate(
        url: AppStrings.endPointGetProduct,
        ).then((value) {
          product = Product.fromJson(value.data);
      emit(ProductSuccess());
    }).catchError((onError) {
      print(onError.toString());
      emit(ProductError());
    });

  }
}
