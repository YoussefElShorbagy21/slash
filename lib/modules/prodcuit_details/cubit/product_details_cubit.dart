import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/productDetailsModel/ProductDetailsModel.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../../shared/resources/string_manager.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());


  static ProductDetailsCubit get(context) => BlocProvider.of(context);

  ProductDetailsModel productDetails = ProductDetailsModel();
  List<String> image = [] ;

  String price = '' ;
  Future<void> getProductDetails({
    required String id
}) async {
    emit(ProductDetailsLoading());
    await DioHelper.getDate(
      url: '${AppStrings.endPointGetProduct}/$id',
    ).then((value) {
      productDetails = ProductDetailsModel.fromJson(value.data);
      price = productDetails.data!.variations![0].price.toString();
      for(var i = 0 ; i <= productDetails.data!.variations![0].productVarientImages!.length ; i++ )
        {
          image.add(productDetails.data!.variations![0].productVarientImages![i].imagePath.toString());
        }
      emit(ProductDetailsSuccess());
    }).catchError((onError) {
      print(onError.toString());
      emit(ProductDetailsError());
    });

  }


  int change = 0 ;
  void changeButton({
    required ProductDetailsModel productDetailsModel,
    var index,
}){
    change = index ;
    image = [];
    for(var i = 0 ; i < productDetails.data!.variations![index].productVarientImages!.length ; i++ )
    {

      image.add(
          productDetails.
          data!.variations![index].
          productVarientImages![i].imagePath.toString());
    }
    emit(ProductDetailsChangeButton());
  }


  bool isShow = true ;

  void showDescription(){
    isShow  = !isShow ;
    emit(ProductDetailsDescription());
  }
}
