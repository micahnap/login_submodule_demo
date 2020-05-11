import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_login/flutter_login.dart';

void main() => runApp(LoginWidget());

mixin Thing {
  List<String> labels = [];
  void doAthing(String thing);
}

class LoginWidget extends StatelessWidget {

    void _onDriverPressed() {
    print('test');
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // set your initial route
      navigatorKey: Modular.navigatorKey,
      initialRoute: "/",
      // add Modular to manage the routing system
      onGenerateRoute: Modular.generateRoute,
      home: Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: Center(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RaisedButton(
            onPressed: _onDriverPressed,
            child: Text("Passenger")
         ),
      SizedBox(height: 40),
          RaisedButton(
            onPressed: _onDriverPressed,
            child: Text("Driver"),
      ),
        ],
      ),
      ),
    )
    );
  }
}

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.thing}) : super(key: key);
  final Thing thing;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Duration get loginTime => Duration(milliseconds: 2250);
  
  // Future<String> _authUser(LoginData data) {
  //   print('Make ${widget.channelId} call with Name: ${data.name}, Password: ${data.password}');
  //   return Future.delayed(loginTime).then((_) {
  //     if (!users.containsKey(data.name)) {
  //       return '${widget.channelId} does not exist';
  //     }
  //     if (users[data.name] != data.password) {
  //       return 'Password does not match';
  //     }
  //     return null;
  //   });
  // }

  // Future<String> _recoverPassword(String name) {
  //   print('Name: $name');
  //   return Future.delayed(loginTime).then((_) {
  //     if (!users.containsKey(name)) {
  //       return 'Username does not exist';
  //     }
  //     return null;
  //   });
  // }

    void _onDriverPressed() {
    print('test');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // set your initial route
      //navigatorKey: Modular.navigatorKey,
      initialRoute: "/",
      // add Modular to manage the routing system
      onGenerateRoute: Modular.generateRoute,
      home: Scaffold(
        drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
      DrawerHeader(
        child: Text('Drawer Header'),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
      ListTile(
        title: Text(widget.thing.labels[0]),
        onTap: () {
          widget.thing.doAthing('thing');
        },
      ),
      ListTile(
        title: Text(widget.thing.labels[1]),
        onTap: () {
          widget.thing.doAthing('thing');
        },
      ),
            ListTile(
        title: Text(widget.thing.labels[2]),
        onTap: () {
          widget.thing.doAthing('thing');
        },
      ),
    ],
    ),
  ),
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Center(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
  decoration: InputDecoration(
    border: InputBorder.none,
    hintText: 'Username'
  ),
),
      SizedBox(height: 40),
TextField(
  decoration: InputDecoration(
    border: InputBorder.none,
    hintText: 'Password'
  ),
),
        SizedBox(height: 40),
        RaisedButton(
            onPressed: _onDriverPressed,
            child: Text("Login"),
      ),
        ],
      ),
      ),
    )
    );
  }
}

