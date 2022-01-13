import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class ProfileAvatar extends StatelessWidget{
  final String imageUrl;
  final bool isActive;

  const ProfileAvatar({
    Key key,
    @required this.imageUrl,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      radius: 20.0,
      backgroundColor: PrimaryColor,
      backgroundImage: CachedNetworkImageProvider(imageUrl),              
    );
  }



}

