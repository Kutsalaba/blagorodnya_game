part of 'page_cubit.dart';

abstract class PageState extends Equatable {
  const PageState();

  @override
  List<Object> get props => [];
}

class HomePage extends PageState {}

class ProfilePage extends PageState {}

class LoginPage extends PageState {}
