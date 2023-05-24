import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'page_state.dart';

class PageCubit extends Cubit<PageState> {
  PageCubit() : super(HomePage());

  void goToHome() => emit(HomePage());

  void goToProfile() => emit(ProfilePage());

  void goToLogin() => emit(LoginPage());
}
