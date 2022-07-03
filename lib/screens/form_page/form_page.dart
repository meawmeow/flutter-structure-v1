import 'package:flutter/material.dart';
import 'package:flutter_structure_v1/components/buttons/button_widget.dart';
import 'package:flutter_structure_v1/components/helpers/helper_header.dart';
import 'package:flutter_structure_v1/components/helpers/helper_msg.dart';
import 'package:flutter_structure_v1/components/textinputs/textformfield_widget.dart';
import 'package:flutter_structure_v1/utils/input_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../components/headers/custom_appbar.dart';

class FormPage extends StatelessWidget {
  FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passController = TextEditingController();
    final confirmPassController = TextEditingController();

    return Scaffold(
      appBar: CustomAppBar(
        title: "Form",
        leadingIcon: Icons.arrow_back_ios,
        onLeading: () {
          Navigator.pop(context);
          HelperMsg.showMsgToast("onLeading click!");
        },
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Form'),
                TextFormFieldWidget(
                    controller: emailController,
                    validator: InputValidator.validatorEmail,
                    hintText: 'example@ggmail.com',
                    prefixIcon: Icons.email),
                TextFormFieldWidget(
                    controller: passController,
                    validator: InputValidator.validatorPassword,
                    hintText: 'Password',
                    helpText: "New Password",
                    isPassword: true,
                    prefixIcon: Icons.lock),
                TextFormFieldWidget(
                    controller: confirmPassController,
                    validator: InputValidator.validatorPassword,
                    hintText: 'Password',
                    helpText: "Confirm Password",
                    isPassword: true,
                    prefixIcon: Icons.lock),
                ButtonWidget(
                    onPress: () {
                      if (formKey.currentState?.validate() == true) {
                        if (!passController.text
                            .toString()
                            .endsWith(confirmPassController.text.toString())) {
                          HelperMsg.showMsgToast("Mismatch password!");
                        } else {
                          formKey.currentState?.save();
                          HelperMsg.showMsgSnackBar(
                              context, 'Validation Successful');
                        }
                      }
                    },
                    textColor: Colors.white,
                    bgColor: Colors.lightBlue,
                    borderColor: Colors.blue,
                    text: "Summit",
                    icon: Icon(Icons.account_box),
                    width: 100,
                    height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
