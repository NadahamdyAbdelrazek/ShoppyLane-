import 'package:equatable/equatable.dart';

class ResponseEntity extends Equatable{
  ResponseEntity({
      this.user, 
      this.token,});

  UserEntity? user;
  String? token;

  @override
  // TODO: implement props
  List<Object?> get props => [user,token];

}

class UserEntity  extends Equatable{
  UserEntity({
      this.name, 
      this.email, 
      });
  String? name;
  String? email;

  @override
  // TODO: implement props
  List<Object?> get props => [name,email];


}