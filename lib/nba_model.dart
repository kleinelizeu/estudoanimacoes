import 'package:flutter/cupertino.dart';

class NBA {
  final String id;
  final String image;

  NBA({
    @required this.id,
    @required this.image,
  });
}

final imageList = [
  NBA(
    id: '01',
    image: "http://a.espncdn.com/photo/2017/0523/r212047_1296x864_3-2.jpg",
  ),
  NBA(
    id: '02',
    image: "http://a.espncdn.com/photo/2017/0523/r212047_1296x864_3-2.jpg",
  ),
];
