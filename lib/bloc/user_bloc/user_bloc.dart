import 'package:explore/_all.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final IUserRepository userRepository;
  UserBloc({
    required this.userRepository,
  }) : super(UserInitial()) {
    on<UserLoadEvent>(loadUserData);
  }

  Future loadUserData(UserLoadEvent event, Emitter emit) async {
    emit(UserLoadingState());
    try {
      final user = await userRepository.getUserData();
      emit(UserLoadedState(user: user));
    } catch (e) {
      emit(UserErrorState(error: e.toString()));
    }
  }
}
