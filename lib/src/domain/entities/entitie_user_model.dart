import 'package:equatable/equatable.dart';

class EntitieUserModel extends Equatable {

  final String? token;
  const EntitieUserModel(
      { 
       this.token});


  @override
  List<Object?> get props =>
      [token];
}
