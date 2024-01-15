import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/user_model.dart';
import '../../domain/usecases/get_all_users_useCase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetAllUsersUseCase _getAllUsersUseCase;
  List<UserModel> usersList = [];
  UserCubit(this._getAllUsersUseCase) : super(UserInitial());

  void getAllUsers() async {
    emit(LoadingUsers());
    var failureOrUsersList = await _getAllUsersUseCase();
    failureOrUsersList.fold(
        (failure) => emit(FailureState(failureMessage(failure))), (users) {
      if (usersList.isEmpty) {
        usersList.addAll(users);
      } else {
        for (var user in users) {
          if (usersList.contains(user)) {
            usersList.add(user);
          }
        }
      }
      emit(LoadedUsers(usersList));
    });
  }

  String failureMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "ServerFailure";

      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
