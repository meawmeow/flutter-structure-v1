import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure_v1/data/models/coin_modal.dart';
import 'package:flutter_structure_v1/data/repositories/coin_repository.dart';

import 'coin_state.dart';

class CoinCubit extends Cubit<CoinState> {
  final CoinRepository coinRepository;
  int start = 1;
  int limit = 20;
  List<Data> datas = [];
  //final isLoading = false;

  CoinCubit({required this.coinRepository}) : super(CoinInitial());

  void fetchCoinPage(bool isDefaultPage) async {
    if (isDefaultPage) {
      start = 1;
      limit = 20;
      datas.clear();
      emit(CoinLoading());
    } else {
      emit(CoinFetchData(dataList: datas, isLoading: true));
    }
    Future.delayed(const Duration(milliseconds: 1000), () async {
      try {
        print("start:" + start.toString() + " limit : " + limit.toString());
        final res = await coinRepository.fetchCoinPage(
            start.toString(), limit.toString());
        if (res!.resData == null) {
          emit(CoinError(error: res.msg.toString()));
        } else {
          start += limit;
          limit += 20;
          List<Data> dlist = (res.resData as CoinModel).data;
          datas.addAll(dlist);
          emit(CoinFetchData(dataList: datas, isLoading: false));
        }
      } catch (e) {
        emit(CoinError(error: e.toString()));
      }
    });
  }
}
