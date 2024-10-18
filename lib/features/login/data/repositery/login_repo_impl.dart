import 'package:appliction_ec/features/login/data/datasource/remote/remote_login_ds.dart';
import 'package:appliction_ec/features/login/domain/entity/ResponceEntity.dart';
import 'package:appliction_ec/features/login/domain/repositery/login_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

class LoginRepoImpl implements LoginRepo{
  RemoteLoginDs remoteLoginDs;

  LoginRepoImpl(this.remoteLoginDs);

  @override
  Future<Either<Failures, ResponseEntity>> logIn(String email, String password) async {
    try{
      var responce= await remoteLoginDs.logIn(email, password);
      return Right(responce);
    }catch(e){
      return Left(RemoteFailures(e.toString()));
    }
  }

  
}