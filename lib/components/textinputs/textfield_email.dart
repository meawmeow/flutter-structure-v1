import 'package:flutter/material.dart';

class TextFieldEmail extends StatefulWidget {
  var emailController = TextEditingController();
  TextFieldEmail({Key? key, required this.emailController}) : super(key: key);

  @override
  _TextFieldEmailState createState() => _TextFieldEmailState();
}

class _TextFieldEmailState extends State<TextFieldEmail> {
  //final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.emailController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    widget.emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.emailController,
      decoration: InputDecoration(
        hintText: 'name@example.com',
        labelText: 'Email',
        prefixIcon: Icon(
          Icons.mail,
          color: Colors.lightBlueAccent,
        ),
        // icon: Icon(Icons.mail),
        suffixIcon: widget.emailController.text.isEmpty
            ? Container(width: 0)
            : IconButton(
                icon: Icon(Icons.close),
                onPressed: () => widget.emailController.clear(),
              ),
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      // autofocus: true,
    );
    ;
  }
}
