import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget {
  final String image;

  const ImageDetail({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 300,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Jumpman 23"),
            background: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                const DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment(0, 0.8),
                            end: Alignment(0, 0),
                            colors: [
                      Color.fromRGBO(0, 0, 0, 0.6),
                      Color.fromRGBO(0, 0, 0, 0)
                    ])))
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text("Michael Jordan "),
              ),
              SizedBox(
                height: 800,
              )
            ],
          ),
        )
      ]),
    );
  }
}
