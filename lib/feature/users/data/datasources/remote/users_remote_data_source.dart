import 'package:dio/dio.dart';
import '../../../../../core/constant/constant.dart';
import '../../../../../core/error/exception.dart';

abstract class UserRemoteDataBase {
  Future<List> getAllUsers();
}

class UserRemoteDataBaseImp implements UserRemoteDataBase {
  @override
  Future<List> getAllUsers() async {
    var baseOptions = BaseOptions(baseUrl: baseUrl);
    try {
      var response = await Dio(baseOptions).get('users');

      return response.data;
    } on DioException catch (_) {
      throw ServerException();
    }
  }
}
