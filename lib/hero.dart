import 'package:estudo_animacoes/custom_route.dart';
import 'package:estudo_animacoes/imagedetail.dart';
import 'package:estudo_animacoes/nba_model.dart';
import 'package:flutter/material.dart';

class HeroCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) => HeroTile(
              image: imageList[index].image,
            ),
            itemCount: 2,
          ),
        ),
      ),
    );
  }
}

class HeroTile extends StatelessWidget {
  final String image;
  const HeroTile({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => ImageDetail(image: image),
          ),
        );
      },
      child: Container(
        child: Image.network(
          image,
        ),
      ),
    );
  }
}
