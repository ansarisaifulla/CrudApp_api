import 'package:flutter/material.dart';
import 'package:login_api/api.dart';
import 'model.dart';

class loginSuccess extends StatefulWidget {
  @override
  _loginSuccessState createState() => _loginSuccessState();
}

class _loginSuccessState extends State<loginSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "List of registered users",
                style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w500,height: 2),
              )
            ],
          ),
          Expanded(
            child: Container(
                child: FutureBuilder(
              future: getAllData(),
              builder: (context, dataSnapShot) {
                if (dataSnapShot.hasData) {
                  return ListView.builder(
                    itemCount: dataSnapShot.data.length,
                    itemBuilder: (BuildContext, int index) {
                      Model model = dataSnapShot.data[index];
                      return ListTile(
                        leading: Container(
                          width: 50,
                          height: 50,
                          child: CircleAvatar(
                            child: Text(
                              firstChar(model.name),
                              style: TextStyle(
                                  fontSize: 29, fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                        title: Text(model.name),
                        subtitle: Text(model.email),
                      );
                    },
                  );
                } else {
                  CircularProgressIndicator();
                }
              },
            )),
          ),
        ],
      ),
    );
  }

  String firstChar(String s) {
    return s.substring(0, 1);
  }
}
