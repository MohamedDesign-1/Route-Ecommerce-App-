import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/CategoryOrBrandResponseEnitity.dart';
import 'package:ecommerce_app/domain/failuers.dart';

abstract class HomeRepository {
  Future<Either<Failure , CategoryOrBrandResponseEnitity>> getAllCategories();
  Future<Either<Failure , CategoryOrBrandResponseEnitity>> getAllBrands();
}