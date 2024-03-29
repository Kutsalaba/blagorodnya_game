part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthorizedState extends AuthenticationState {}

class UnauthorizedState extends AuthenticationState {}
