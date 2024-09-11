import 'package:dartz/dartz.dart';

import '../../../domain/entities/CategoryOrBrandResponseEnitity.dart';
import '../../../domain/failuers.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failure , CategoryOrBrandResponseEnitity>> getAllCategories();
  Future<Either<Failure , CategoryOrBrandResponseEnitity>> getAllBrands();
}