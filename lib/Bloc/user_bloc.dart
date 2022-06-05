import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management/Bloc/bloc_state.dart';
import 'package:school_management/DataModel/user.dart';
import 'package:school_management/Repository/user_repo.dart';

class UserBloc extends Cubit<BlocState> {
  UserBloc() : super(Inital());

  User? _user;

  void authenticate(String mobile, String pass) async {
    if (state is Loading) return;
    try {
      emit(Loading());
      _user = await UserRepo.authenticate(mobile, pass);
      emit(Aunthenticated(_user!));
    } catch (e) {
      emit(Failed(e as Exception));
    }
  }

  User? get user => _user;
}
