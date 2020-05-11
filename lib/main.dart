import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_login/flutter_login.dart';

void main() => runApp(ModularApp(module: MainLoginModule()));

mixin Thing {
  List<String> labels = [];
  void doAthing(String thing);
}

class MainLoginModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
    // Router("/", module: LoginModule()),
  ];
  @override
  Widget get bootstrap => LoginScreen();
}

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
    Router("/", child: (_, args) => LoginScreen()),
  ];

  static Inject get to => Inject<LoginModule>.of();
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

    void _onLoginPressed() {
    print('test');
  }

  @override
  Widget build(BuildContext context) {
    final thing = Modular.get<Thing>();
    return MaterialApp(
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
        title: Text(thing.labels[0]),
        onTap: () {
          thing.doAthing('thing');
        },
      ),
      ListTile(
        title: Text(thing.labels[1]),
        onTap: () {
          thing.doAthing('thing');
        },
      ),
            ListTile(
        title: Text(thing.labels[2]),
        onTap: () {
          thing.doAthing('thing');
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
            onPressed: _onLoginPressed,
            child: Text("Login"),
      ),
        ],
      ),
      ),
    )
    );
  }
}

