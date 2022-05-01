import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}
// enum
enum Gender {
  male,
  female,
  transGender,
}
class _FormPageState extends State<FormPage> {
  //form key
  final _globalFormKey = GlobalKey<FormState>();
  // Reference variable of Gender
  Gender defaultValue = Gender.male;
  //bool value
  bool firstValue = false;
  bool secondValue = false;
  bool thirdValue = false;
  //text form field variable
  var fullName = " ";
  var city = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("FORM",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            Form(
                key: _globalFormKey,
                child: Column(
                  children: <Widget> [
                    Text("Personal Details",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Name",
                      ),
                      validator: (value){
                        fullName = value!;
                        if(value.isEmpty){
                          return "Please fill the correct name";
                        }return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "City"
                      ),
                      validator: (value){
                        city = value!;
                        if(value.isEmpty){
                          return " Please enter the city ";
                        }return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text("Gender",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 10,
                    ),
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
                    SizedBox(
                      height: 10,
                    ),
                    Text("Pick your Seating",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text("Group A"),
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
                      title: Text("Group B"),
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
                      title: Text("Group C"),
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
                          print(fullName+defaultValue.toString() + "ticked");
                        },
                        child: Text("Submit"))
                  ],
                )
            ),],
        ),
      )
    );
  }
}
