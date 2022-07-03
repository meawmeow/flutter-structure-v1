import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure_v1/state_management/bloc/coin/coin_event.dart';

import '../../../data/models/coin_modal.dart';
import '../../../data/repositories/coin_repository.dart';
import 'coin_state.dart';

class CoinBLoc extends Bloc<CoinEvent, CoinState> {
  final CoinRepository coinRepository;
  int start = 1;
  int limit = 20;
  bool fetchMore = false;
  List<Data> datas = [];

  CoinBLoc({required this.coinRepository}) : super(CoinInitial()) {
    on<CoinEventLoading>(_fetchCoinPage);
  }
  void _fetchCoinPage(CoinEventLoading event, Emitter<CoinState> emit) async {
    fetchMore = true;
    if (event.isDefaultPage) {
      start = 1;
      limit = 20;
      datas.clear();
      emit(CoinLoading());
      print("CoinLoading");
    } else {
      emit(CoinFetchData(dataList: datas, isLoading: true));
      print("CoinFetchData");
    }
    await Future.delayed(const Duration(milliseconds: 1000), () async {
      try {
        print("start:" + start.toString() + " limit : " + limit.toString());
        final res = await coinRepository.fetchCoinPage(
            start.toString(), limit.toString());
        if (res!.resData == null) {
          emit(CoinError(error: res.msg.toString()));
          fetchMore = false;
        } else {
          start += limit;
          limit += 20;
          List<Data> dlist = (res.resData as CoinModel).data;
          datas.addAll(dlist);
          emit(CoinFetchData(dataList: datas, isLoading: false));
          fetchMore = false;
        }
      } catch (e) {
        emit(CoinError(error: e.toString()));
        fetchMore = false;
      }
    });
  }
}
