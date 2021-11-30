export 'circle_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/models/models.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CreatePostContainer extends StatelessWidget{
  final User currentUser;
  
  const CreatePostContainer({
    Key key,
    @required this.currentUser,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      color: Colors.blue,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.grey[200],
                backgroundImage: CachedNetworkImageProvider(currentUser.imageUrl),              
              ),
              const SizedBox(width: 8.0,),
          //El error está en el expanded
              Expanded(
                child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: 'What\'s on your mind?',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}