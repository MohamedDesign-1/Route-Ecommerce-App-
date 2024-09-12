
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/data_sources/remote_data_source/home_remote_data_source.dart';

import 'package:ecommerce_app/domain/entities/CategoryOrBrandResponseEnitity.dart';
import 'package:ecommerce_app/domain/entities/product_response_entity.dart';

import 'package:ecommerce_app/domain/failuers.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/home_repository.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  
  HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImpl({required this.homeRemoteDataSource});
  
  @override
  Future<Either<Failure, CategoryOrBrandResponseEnitity>> getAllCategories() async {
    var either = await homeRemoteDataSource.getAllCategories();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failure, CategoryOrBrandResponseEnitity>> getAllBrands() async{
    var either = await homeRemoteDataSource.getAllBrands();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failure, ProductResponseEntity>> getAllProduct() async{
    var either = await homeRemoteDataSource.getAllProduct();
    return either.fold((error) => Left(error), (response) => Right(response));
  }
  
}