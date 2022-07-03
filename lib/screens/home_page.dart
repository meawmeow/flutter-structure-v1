import 'package:flutter/material.dart';
import 'package:flutter_structure_v1/components/dialogs/dialog_rating.dart';

import '../components/headers/custom_appbar.dart';
import '../components/helpers/helper_header.dart';
import '../router/router_name.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.white,
      primary: Colors.lightBlue,
      minimumSize: Size(150, 36),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );
    return Scaffold(
      appBar: CustomAppBar(title: "Home Example", iconActions: [
        CustomAppBar.iconAct(Icons.settings, () {
          print("settings");
        }),
        CustomAppBar.iconAct(Icons.info, () {
          print("info");
        }),
      ]),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    Navigator.pushNamed(context, RouterName.CUBIT_PAGE);
                  },
                  child: Text("CubitPage")),
              ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    Navigator.pushNamed(context, RouterName.BLOC_PAGE);
                  },
                  child: Text("BlocPage")),
              ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    openRatingDialog(context);
                  },
                  child: Text("Dialog RatingView")),
              ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    Navigator.pushNamed(context, RouterName.FORM_PAGE);
                  },
                  child: Text("Form Page"))
            ],
          ),
        ),
      ),
    );
  }

  openRatingDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: DialogRating(),
          );
        });
  }
}
