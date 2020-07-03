import 'package:flutter/material.dart';
import 'package:login_api/api.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'AfterLogin.dart';
import 'SignUp.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(MaterialApp(
    title: "Login_sign",
    debugShowCheckedModeBanner: false,
    home: myHome(),
    theme: ThemeData(primarySwatch: Colors.green),
  ));
}

ProgressDialog pr;

class myHome extends StatefulWidget {
  @override
  _myHomeState createState() => _myHomeState();
}

class _myHomeState extends State<myHome> {
  final _key = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(
      context,
    );
 
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: [
            // Image.asset("assets/img_up.png"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0.0, 5.0),
                                  blurRadius: 5.0),
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0.0, -5.0),
                                  blurRadius: 5.0)
                            ]),
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15.0),
                        child: Form(
                          key: _key,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25.0),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: "Email",
                                    labelStyle: TextStyle(color: Colors.black),
                                    hintText: "enter email",
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12.0)),
                                controller: usernameController,
                                validator: (String text) {
                                  return text.isEmpty ? "enter username" : null;
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    labelText: "Password",
                                    labelStyle: TextStyle(color: Colors.black),
                                    hintText: "enter password",
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12.0)),
                                controller: passwordController,
                                validator: (String text) {
                                  return text.isEmpty ? "enter password" : null;
                                },
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RaisedButton.icon(
                                      color: Colors.lightGreen,
                                      onPressed: () async {
                                        if (_key.currentState.validate()) {
                                          var user = usernameController.text;
                                          var pass = passwordController.text;
                                          var data = await login(user, pass);
                                          await pr.show();

                                          if (data != "login successful") {
                                            await pr.hide();
                                            Toast.show(
                                                "Email Already exists", context,
                                                duration: Toast.LENGTH_SHORT,
                                                gravity: Toast.BOTTOM);
                                          } else {
                                            // setState(() {
                                             await pr.hide();
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (BuildContext) =>
                                                          loginSuccess()));
                                            // });
                                          }
                                        }
                                      },
                                      icon: Icon(Icons.arrow_right),
                                      label: Text("Login")),
                                  Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.green),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "New User?",
                        style: TextStyle(fontSize: 18.0, color: Colors.grey),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext) => signUp()));
                        },
                        child: Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Colors.lightGreen,
                                Colors.greenAccent
                              ]),
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF6078ea).withOpacity(.3),
                                    offset: Offset(0, 8.0),
                                    blurRadius: 8.0)
                              ]),
                          child: Center(
                            child: Text("SIGN-UP"),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
            Image.asset("assets/img_down.png")
          ],
        ),
      ),
    );
  }
}
