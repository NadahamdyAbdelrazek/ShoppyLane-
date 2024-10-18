import 'package:appliction_ec/features/login/domain/entity/ResponceEntity.dart';
import 'package:appliction_ec/features/login/presentation/pages/login.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class LoginRepo{


 Future<Either<Failures,ResponseEntity>> logIn(String email,String password);
}