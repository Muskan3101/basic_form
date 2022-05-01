import 'package:flutter/material.dart';
import 'package:form/form.dart';
import 'package:form/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FormPage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //form key
  final _globalFormKey = GlobalKey<FormState>();
  var name = " ";
  var password = " ";  //integer pass karenge if we want numeric password.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
      ),
      body: Form(
        key: _globalFormKey,
          child: Column(
            children: <Widget> [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Name",
                ),
                validator: (value){
                  name = value!;
                  if(value.isEmpty){
                    return "Please fill the correct name";
                  }return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Password"
                ),
                validator: (value){
                  password = value!;
                  if(value.isEmpty){
                    return " Please Fill correct password ";
                  }return null;
                },
              ),
              ElevatedButton(
                  onPressed: (){
                    var valid = _globalFormKey.currentState!.validate();
                    if(!valid){
                      return ;
                    }
                    print(name + password);
                  },
                  child: Text("Submit")
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>SecondPage()));
                  },
                  child: Text("Redirect to Second Page")
              ),
            ],
          )
      ),
    );
  }
}

