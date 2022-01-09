import 'package:estudo_animacoes/animacao_opacidade.dart';
import 'package:estudo_animacoes/animated_builder.dart';
import 'package:estudo_animacoes/animated_container.dart';
import 'package:estudo_animacoes/custom_route.dart';
import 'package:estudo_animacoes/forma_manual.dart';
import 'package:estudo_animacoes/hero.dart';
import 'package:estudo_animacoes/imagedetail.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: CustomPageTransitionsBuilder(),
          })),
      home: HeroCustom(),
      routes: {
        '/image-detail': (ctx) => ImageDetail(),
      },
    );
  }
}
