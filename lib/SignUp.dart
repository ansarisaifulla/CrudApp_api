import 'package:flutter/material.dart';
import 'package:login_api/AfterLogin.dart';
import 'package:login_api/main.dart';
import 'api.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:toast/toast.dart';

class signUp extends StatefulWidget {
  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final r_key = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
        backgroundColor: Colors.green[400],
        elevation: 0.5,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Image.asset("assets/register.png"),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Expanded(
                child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Form(
                      key: r_key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                labelText: "Name",
                                labelStyle: TextStyle(fontSize: 16.0),
                                hintText: "enter name"),
                            controller: nameController,
                            validator: (String value) {
                              return value.isEmpty ? "enter password" : null;
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                labelText: "Email",
                                labelStyle: TextStyle(fontSize: 16.0),
                                hintText: "enter email"),
                            controller: emailController,
                            validator: (String value) {
                              return value.isEmpty ? "enter password" : null;
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                labelText: "Ph no.",
                                labelStyle: TextStyle(fontSize: 16.0),
                                hintText: "enter number"),
                            controller: mobileController,
                            validator: (String value) {
                              return value.isEmpty ? "enter password" : null;
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                labelText: "Password",
                                labelStyle: TextStyle(fontSize: 16.0),
                                hintText: "enter password"),
                            controller: passwordController,
                            obscureText: true,
                            validator: (String value) {
                              return value.isEmpty ? "enter password" : null;
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                labelText: "Confirm",
                                labelStyle: TextStyle(fontSize: 16.0),
                                hintText: "retype password"),
                            controller: confirmController,
                            obscureText: true,
                            validator: (String value) {
                              return passwordController.text !=
                                      confirmController.text
                                  ? "enter password"
                                  : null;
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Have an account?",
                                style: TextStyle(fontSize: 17.0),
                              ),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext) =>
                                                myHome()));
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(fontSize: 18.0),
                                  ))
                            ],
                          ),
                          Center(
                            child: RaisedButton(
                              padding: EdgeInsets.symmetric(horizontal: 21.0,vertical: 9.0),
                              shape: RoundedRectangleBorder(
                                
                                  borderRadius: BorderRadius.circular(15.0),
                                  ),
                              onPressed: () async {
                                if (r_key.currentState.validate()) {
                                  var name = nameController.text;
                                  var email = emailController.text;
                                  var mobile = mobileController.text;
                                  var password = passwordController.text;
                                  var data = await register(
                                      name, email, mobile, password);
                                  print(data);

                                  if (data == "Data registered succcessfully") {
                                    // setState(() {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext) =>
                                                loginSuccess()));
                                    // });

                                  } else {
                                    Toast.show("Email Already exists", context,
                                        duration: Toast.LENGTH_SHORT,
                                        gravity: Toast.BOTTOM);
                                  }
                                }
                              },
                              color: Colors.greenAccent,
                              child: Text(
                                "Register",
                                style: TextStyle(fontSize: 19.0),
                              ),
                            ),
                          )
                        ],
                      )),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
