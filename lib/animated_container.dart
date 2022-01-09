import 'package:flutter/material.dart';

enum AuthMode {
  Login,
  SingUp,
}

class AnimatedContainerCustom extends StatefulWidget {
  @override
  _AnimatedContainerCustomState createState() =>
      _AnimatedContainerCustomState();
}

class _AnimatedContainerCustomState extends State<AnimatedContainerCustom>
    with SingleTickerProviderStateMixin {
  AuthMode _authMode = AuthMode.Login;

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.SingUp;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Card(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.linear,
            height: (_authMode == AuthMode.Login ? 350 : 500),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: "Email"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Senha"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _authMode == AuthMode.SingUp
                      ? TextFormField(
                          decoration:
                              InputDecoration(labelText: "Confirmar Senha"),
                        )
                      : Container(),
                  SizedBox(
                    height: 50,
                  ),
                  RaisedButton(
                    onPressed: _switchAuthMode,
                    child: Text(_authMode == AuthMode.Login
                        ? 'CRIAR CONTA'
                        : 'REGISTRAR-SE'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: Text(
                      'ENTRAR',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
