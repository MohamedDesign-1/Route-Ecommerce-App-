import 'package:dartz/dartz.dart';

import '../../../domain/entities/RegisterResponseEntity.dart';
import '../../../domain/failuers.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure , RegisterResponseEntity>> register(String name, String email, String password,
      String rePassword, String phone);

}