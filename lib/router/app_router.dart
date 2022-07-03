import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure_v1/data/models/coin_modal.dart';
import 'package:flutter_structure_v1/data/repositories/coin_repository.dart';
import 'package:flutter_structure_v1/data/services/core_service.dart';
import 'package:flutter_structure_v1/router/router_name.dart';
import 'package:flutter_structure_v1/screens/coin_detail.dart';
import 'package:flutter_structure_v1/screens/home_page.dart';
import 'package:flutter_structure_v1/state_management/bloc/coin/coin_bloc.dart';
import 'package:flutter_structure_v1/utils/env_utils.dart';

import '../screens/bloc_coin_page/bloc_page.dart';
import '../screens/cubit_coin_page/cubit_page.dart';
import '../screens/form_page/form_page.dart';
import '../state_management/cubit/coin/coin_cubit.dart';

class AppRouter {
  late final CoinRepository coinRepository;
  late final CoinCubit coinCubit;
  late final CoinBLoc coinBLoc;

  AppRouter() {
    coinRepository = CoinRepository(
        coreService: CoreService(EnvUtils.BASE_URL, EnvUtils.HEADERS));
    coinCubit = CoinCubit(coinRepository: coinRepository);
    coinBLoc = CoinBLoc(coinRepository: coinRepository);
  }

  Route? generateRouter(RouteSettings routes) {
    switch (routes.name) {
      case RouterName.HOME:
        return MaterialPageRoute(builder: (_) => Homepage());

      case RouterName.CUBIT_PAGE:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(value: coinCubit, child: CubitPage()),
        );

      case RouterName.COIN_DETAIL:
        final data = routes.arguments as Data;
        return MaterialPageRoute(
          builder: (_) => CoinDetail(
            data: data,
          ),
        );

      case RouterName.BLOC_PAGE:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(value: coinBLoc, child: BlocPage()),
        );
      case RouterName.FORM_PAGE:
        return MaterialPageRoute(builder: (_) => FormPage());
      default:
        return null;
    }
  }
}
