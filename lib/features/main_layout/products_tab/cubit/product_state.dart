part of 'product_view_model.dart';

@immutable
abstract class ProductState {}

class ProductInitialState extends ProductState {}
class ProductLoadingState extends ProductState {}
class ProductErrorState extends ProductState {
  final Failure failure;
  ProductErrorState(this.failure);
}
class ProductSuccessState extends ProductState {
  final ProductResponseEntity productResponseEntity;
  ProductSuccessState(this.productResponseEntity);
}