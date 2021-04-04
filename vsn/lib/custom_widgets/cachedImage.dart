import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class CachedImage extends StatelessWidget {
  String image;
  CachedImage({this.image});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      placeholder: (context, url) =>  Image.asset('assets/images/placeholder.png',fit: BoxFit.cover,width: MediaQuery.of(context).size.width),
      errorWidget: (context, url, error) => Image.asset('assets/images/placeholder.png',fit: BoxFit.cover,width: MediaQuery.of(context).size.width),
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width,
    );
  }
}
