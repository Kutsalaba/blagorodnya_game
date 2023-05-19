import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'home_route_state.dart';

class HomeRouteCubit extends Cubit<HomeRouteState> {
  HomeRouteCubit() : super(HomeRouteState(page: GoRoute(path: ''))) {
    

  }

 
}
