import 'package:flutter/material.dart';
import 'package:form/third_page.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

// enum
enum Gender {
  male,
  female,
  transGender,
}

class _SecondPageState extends State<SecondPage> {
  //formkey
  final _globalFormKey = GlobalKey<FormState>();

  // Reference variable of Gender
  Gender defaultValue = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio Button"),
      ),
      body: Form(
        key: _globalFormKey,
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("Male"),
              leading: Radio(
                value: Gender.male,
                groupValue: defaultValue,
                onChanged: (Gender? changedValue) {
                  setState(() {
                    defaultValue = changedValue!;
                  });
                },
              ),
            ),
            ListTile(
              title: Text("Female"),
              leading: Radio(
                value: Gender.female,
                groupValue: defaultValue,
                onChanged: (Gender? changedValue) {
                  setState(() {
                    defaultValue = changedValue!;
                  });
                },
              ),
            ),
            ListTile(
              title: Text("TransGender"),
              leading: Radio(
                value: Gender.transGender,
                groupValue: defaultValue,
                onChanged: (Gender? changedValue) {
                  setState(() {
                    defaultValue = changedValue!;
                  });
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  var valid = _globalFormKey.currentState!.validate();
                  if (!valid) {
                    return;
                  }
                  print(defaultValue.toString());
                },
                child: Text("Form Submit")),
            ElevatedButton(
                onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ThirdPage()));
                },
                child: Text("Redirect to ThirdPage")),
          ],
        ),
      ),
    );
  }
}
