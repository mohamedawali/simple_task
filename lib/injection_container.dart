import 'package:get_it/get_it.dart';

import 'feature/users/data/datasources/remote/users_remote_data_source.dart';
import 'feature/users/data/repositories/users_repository_impl.dart';
import 'feature/users/domain/repositories/users_repository.dart';
import 'feature/users/domain/usecases/get_all_users_useCase.dart';
import 'feature/users/presentation/cubit/user_cubit.dart';

final instance = GetIt.instance;
init() {
  instance.registerLazySingleton<UserCubit>(() => UserCubit(instance()));
  instance.registerLazySingleton<GetAllUsersUseCase>(
      () => GetAllUsersUseCase(instance()));
  instance
      .registerLazySingleton<UserRemoteDataBase>(() => UserRemoteDataBaseImp());

  instance.registerLazySingleton<UsersRepository>(
      () => UsersRepositoryImp(instance()));
}
