import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/entities/product_response_entity.dart';
import 'package:ecommerce_app/domain/use_cases/get_all_product_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../domain/failuers.dart';

part 'product_state.dart';
@injectable
class ProductViewModel extends Cubit<ProductState> {
  GetAllProductUseCase getAllProductUseCase;
  ProductViewModel(this.getAllProductUseCase) : super(ProductInitialState());

  List<ProductEntity> productList = [];

  static ProductViewModel get(context) => BlocProvider.of(context);

  Future<void> getAllProducts() async {
    emit(ProductLoadingState());
    var either = await getAllProductUseCase.invoke();
    either.fold((faliure) => emit(ProductErrorState(faliure)), (response) {
      productList = response.data ?? [];
      emit(ProductSuccessState(response));
    });
  }
}
