import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/users_repository.dart';
import '../datasources/remote/users_remote_data_source.dart';
import '../models/user_model.dart';

class UsersRepositoryImp implements UsersRepository {
  final UserRemoteDataBase _userRemoteDataBase;

  UsersRepositoryImp(this._userRemoteDataBase);

  @override
  Future<Either<Failure, List<UserModel>>> getAllUsers() async {
    try {
      List users = await _userRemoteDataBase.getAllUsers();
      List<UserModel> usersList =
          users.map((user) => UserModel.fromJson(user)).toList();
      return Right(usersList);
    } on ServerException catch (_) {
      return Left(ServerFailure());
    }
  }
}

