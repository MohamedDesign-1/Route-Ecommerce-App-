import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/CategoryOrBrandResponseEnitity.dart';
import 'package:ecommerce_app/domain/failuers.dart';

import '../entities/product_response_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure , CategoryOrBrandResponseEnitity>> getAllCategories();
  Future<Either<Failure , CategoryOrBrandResponseEnitity>> getAllBrands();
  Future<Either<Failure , ProductResponseEntity>> getAllProduct();
}