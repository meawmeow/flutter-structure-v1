import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure_v1/state_management/bloc/coin/coin_bloc.dart';
import 'package:flutter_structure_v1/state_management/bloc/coin/coin_state.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../state_management/bloc/coin/coin_event.dart';
import 'coin_error_cpn.dart';
import 'widget/coin_cir_progress.dart';
import 'widget/coin_item.dart';

class BlocPage extends StatelessWidget {
  BlocPage({Key? key}) : super(key: key);

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CoinBLoc>(context)
        .add(CoinEventLoading(isDefaultPage: true));

    _scrollController.addListener(() {
      var triggerFetchMoreSize =
          0.9 * _scrollController.position.maxScrollExtent;

      if (_scrollController.position.pixels > triggerFetchMoreSize) {
        final fetchMore = BlocProvider.of<CoinBLoc>(context).fetchMore;
        if (!fetchMore) {
          print("Bottom bloc fetch api fetchMore ${fetchMore}");
          BlocProvider.of<CoinBLoc>(context)
              .add(CoinEventLoading(isDefaultPage: false));
        }
      }
    });

    return BlocListener<CoinBLoc, CoinState>(
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
        appBar: AppBar(title: Text("BlocPage"), actions: [
          InkWell(
            onTap: () => {
              BlocProvider.of<CoinBLoc>(context)
                  .add(CoinEventLoading(isDefaultPage: true))
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.refresh),
            ),
          )
        ]),
        body: BlocBuilder<CoinBLoc, CoinState>(
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
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: coins.length,
                      itemBuilder: (context, index) {
                        return CoinItem(data: coins[index]);
                      },
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
