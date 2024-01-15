import '../../../../core/error/failure.dart';
import '../../data/models/user_model.dart';
import '../repositories/users_repository.dart';
import 'package:dartz/dartz.dart';
class GetAllUsersUseCase{
  final UsersRepository _usersRepository;

  GetAllUsersUseCase(this._usersRepository);

  Future <Either<Failure, List<UserModel>>> call()async{
  return  await _usersRepository.getAllUsers();
  }
}