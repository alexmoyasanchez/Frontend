import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/components/post_container.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/components/create_post_container.dart';
import 'package:flutter_auth/models/models.dart';
import 'package:flutter_auth/data/data.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CreatePostContainer(currentUser: currentUser),

          ), 
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index){
                final Post post = posts[index];
                return PostContainer(post: post);
              },
              childCount: posts.length,
            ))
        ],
      )
    );
  }
}
