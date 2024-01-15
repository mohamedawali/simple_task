import '../../../../core/error/failure.dart';
import '../../data/models/user_model.dart';
import 'package:dartz/dartz.dart';
abstract class UsersRepository{
 Future <Either<Failure, List<UserModel>>> getAllUsers();
}