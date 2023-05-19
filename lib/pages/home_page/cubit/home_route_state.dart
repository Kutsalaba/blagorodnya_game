part of 'home_route_cubit.dart';

class HomeRouteState extends Equatable {
  final GoRoute page;

  const HomeRouteState({
    required this.page,
  });

  @override
  List<Object> get props => [page];

  HomeRouteState copyWith({
    GoRoute? page,
  }) {
    return HomeRouteState(
      page: page ?? this.page,
    );
  }
}
