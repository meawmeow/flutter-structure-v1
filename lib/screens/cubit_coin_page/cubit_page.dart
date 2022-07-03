import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure_v1/screens/cubit_coin_page/coin_error_cpn.dart';
import 'package:flutter_structure_v1/screens/cubit_coin_page/widget/coin_cir_progress.dart';
import 'package:flutter_structure_v1/screens/cubit_coin_page/widget/coin_item.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../state_management/cubit/coin/coin_cubit.dart';
import '../../state_management/cubit/coin/coin_state.dart';

class CubitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CoinCubit>(context).fetchCoinPage(true);
    return BlocListener<CoinCubit, CoinState>(
      listener: (context, state) {
        if (state is CoinError) {
          Fluttertoast.showToast(
              msg: "Coin Error : ${state.error}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cubit Coin"),
          actions: [
            InkWell(
              onTap: () =>
                  BlocProvider.of<CoinCubit>(context).fetchCoinPage(true),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.refresh),
              ),
            )
          ],
        ),
        body: BlocBuilder<CoinCubit, CoinState>(
          builder: (context, state) {
            if (state is CoinLoading) {
              return Container(
                color: Colors.transparent,
                child: CoinCirProgress(
                  color: Colors.lightBlueAccent,
                ),
              );
            }
            if (state is CoinError) {
              return CoinErrorComponent(error: state.error);
            }
            if (state is CoinFetchData) {
              final coins = state.dataList;
              final isLoading = state.isLoading;
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (scrollNotification) {
                        if (scrollNotification is ScrollStartNotification) {
                        } else if (scrollNotification
                            is ScrollUpdateNotification) {
                        } else if (scrollNotification
                            is ScrollEndNotification) {}

                        if (scrollNotification.metrics.pixels ==
                            scrollNotification.metrics.maxScrollExtent) {
                          if (scrollNotification is ScrollEndNotification) {
                            print("bottom fetch");
                            BlocProvider.of<CoinCubit>(context)
                                .fetchCoinPage(false);
                          }
                        }

                        return true;
                      },
                      child: ListView.builder(
                        itemCount: coins.length,
                        itemBuilder: (context, index) {
                          return CoinItem(data: coins[index]);
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: isLoading ? 50.0 : 0,
                    color: Colors.transparent,
                    child: CoinCirProgress(
                      color: Colors.amber,
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
