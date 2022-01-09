import 'package:flutter/material.dart';

enum AuthMode {
  Login,
  SingUp,
}

class AnimacaoFormaManual extends StatefulWidget {
  @override
  _AnimacaoFormaManualState createState() => _AnimacaoFormaManualState();
}

class _AnimacaoFormaManualState extends State<AnimacaoFormaManual>
    with SingleTickerProviderStateMixin {
  bool _isLoading = false;
  AuthMode _authMode = AuthMode.Login;
  AnimationController _controller;
  Animation<Size> _heightAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
    );

    _heightAnimation = Tween(
      begin: Size(double.infinity, 300),
      end: Size(double.infinity, 400),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));

    _heightAnimation.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.SingUp;
        _controller.forward();
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
        _controller.reverse();
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
          child: Container(
            height: _heightAnimation.value.height ??
                (_authMode == AuthMode.Login ? 500 : 550),
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
