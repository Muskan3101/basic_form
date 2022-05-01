import 'package:flutter/material.dart';
class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}
class _ThirdPageState extends State<ThirdPage> {
//Form Key
final _globalFormKey = GlobalKey<FormState>();
//bool value
  bool firstValue = false;
  bool secondValue = false;
  bool thirdValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Box"),
      ),
      body: Form(
        key: _globalFormKey,
          child:Column(
            children: <Widget>[
              Text("Test your CheckBox"),
              SizedBox(
                height: 20.0,
              ),
              ListTile(
                title: Text("A"),
                leading: Checkbox(
                    value: firstValue,
                    onChanged: (changedValue){
                      setState(() {
                        firstValue = changedValue!;
                      });
                    }
                ),
              ),
              ListTile(
                title: Text("B"),
                leading: Checkbox(
                    value: secondValue,
                    onChanged: (changedValue){
                      setState(() {
                        secondValue = changedValue!;
                      });
                    }
                ),
              ),
              ListTile(
                title: Text("None"),
                leading: Checkbox(
                    value: thirdValue,
                    onChanged: (changedValue){
                      setState(() {
                        thirdValue = changedValue!;
                      });
                    }
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    var valid = _globalFormKey.currentState!.validate();
                    if(!valid){
                      return;
                    }
                    print("ticked");
                  },
                  child: Text("Submit")
              )
            ],
          ),
      )
    );
  }
}
