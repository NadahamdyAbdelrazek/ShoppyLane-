import 'package:appliction_ec/core/error/failures.dart';
import 'package:appliction_ec/features/login/domain/entity/ResponceEntity.dart';
import 'package:appliction_ec/features/login/domain/repositery/login_repo.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  LoginRepo loginRepo;

  LoginUseCase(this.loginRepo);


  Future<Either<Failures,ResponseEntity>> call(String email, String password) =>
      loginRepo.logIn(email, password);
}