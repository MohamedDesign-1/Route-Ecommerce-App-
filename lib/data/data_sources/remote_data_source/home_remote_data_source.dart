import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/product_response_entity.dart';

import '../../../domain/entities/CategoryOrBrandResponseEnitity.dart';
import '../../../domain/failuers.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failure , CategoryOrBrandResponseEnitity>> getAllCategories();
  Future<Either<Failure , CategoryOrBrandResponseEnitity>> getAllBrands();
  Future<Either<Failure , ProductResponseEntity>> getAllProduct();
}