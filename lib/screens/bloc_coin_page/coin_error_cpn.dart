import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state_management/bloc/coin/coin_bloc.dart';
import '../../state_management/bloc/coin/coin_event.dart';

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
            "Bloc Page Error : ${error}",
            style: TextStyle(color: Colors.red),
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<CoinBLoc>(context)
                  .add(CoinEventLoading(isDefaultPage: true));
            },
            child: Text('Reload!'),
          )
        ],
      ),
    );
  }
}
