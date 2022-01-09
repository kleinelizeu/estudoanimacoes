import 'package:flutter/material.dart';

enum AuthMode {
  Login,
  SingUp,
}

class AnimacaoOpacidade extends StatefulWidget {
  @override
  _AnimacaoOpacidadeState createState() => _AnimacaoOpacidadeState();
}

class _AnimacaoOpacidadeState extends State<AnimacaoOpacidade>
    with SingleTickerProviderStateMixin {
  AuthMode _authMode = AuthMode.Login;
  AnimationController _controller;

  Animation<double> _opacityAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 600,
      ),
    );

    _opacityAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));

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
            height: 400,
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
                  FadeTransition(
                    opacity: _opacityAnimation,
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "Confirmar Senha"),
                    ),
                  ),
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
