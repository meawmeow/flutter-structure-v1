import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state_management/cubit/coin/coin_cubit.dart';

class CoinErrorComponent extends StatelessWidget {
  final String error;
  CoinErrorComponent({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Error : ${error}",
            style: TextStyle(color: Colors.red),
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<CoinCubit>(context).fetchCoinPage(true);
            },
            child: Text('Reload!'),
          )
        ],
      ),
    );
  }
}
