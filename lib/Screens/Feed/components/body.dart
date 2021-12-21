import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Feed/feed_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/components/post_container.dart';
import 'package:flutter_auth/generated/l10n.dart';
import 'package:flutter_auth/models/models.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Body extends StatelessWidget {
  final Future<Bar> bar;


  Body({Key key, this.bar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Center(
          child: FutureBuilder(
              future: getPosts(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print(snapshot.data);
                if (snapshot.data == null) {
                  return Container(
                      child: Center(child: CircularProgressIndicator()));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 1.0),
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        color: Colors.black,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  _PostHeader(post: snapshot.data[index]),
                                  const SizedBox(height: 4.0),
                                  Text(snapshot.data[index].texto,
                                      style: TextStyle(color: Colors.white)),
                                  snapshot.data[index].imageUrl != null
                                      ? const SizedBox.shrink()
                                      : const SizedBox(
                                          height: 6.0,
                                        ),
                                ],
                              ),
                            ),
                            snapshot.data[index].imageUrl != " "
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: CachedNetworkImage(
                                        imageUrl:
                                            snapshot.data[index].imageUrl),
                                  )
                                : const SizedBox.shrink(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: _PostStats(post: snapshot.data[index]),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }
              })),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  

  const _PostHeader({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override

  
  Widget build(BuildContext context) {

    DateTime dt = DateTime.parse(post.fecha);

    return Row(
      children: [
        CircleAvatar(
            radius: 20.0, backgroundImage: NetworkImage(post.imageBar)),
        const SizedBox(width: 8.0),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              post.nameBar,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Row(
              children: [
                Text(
                  timeAgo(dt),
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12.0,
                  ),
                ),
                Icon(
                  Icons.public,
                  color: Colors.grey[600],
                  size: 12.0,
                )
              ],
            )
          ]),
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          color: Colors.white,
          onPressed: () => print('More'),
        )
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
                padding: const EdgeInsets.all(4.0),
                child: const Icon(
                  Icons.star,
                  size: 20.0,
                  color: Colors.yellow,
                )),
            const SizedBox(width: 4.0),
            Expanded(
              child: Text(
                '${post.likes}' + S.current.favs,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
              icon: Icon(MdiIcons.starOutline,
                  color: Colors.grey[600], size: 20.0),
              label: S.current.fav,
              onTap: () => print('Favorito'),
            ),
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;

  const _PostButton({
    Key key,
    @required this.icon,
    @required this.label,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.black,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4.0),
                Text(
                  label,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String timeAgo(DateTime d) {
  Duration diff = DateTime.now().difference(d);
  if (diff.inDays > 365)
    return S.current.hace + "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? S.current.year : S.current.years} " + S.current.atras;
  if (diff.inDays > 30)
    return S.current.hace + "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? S.current.mes : S.current.meses} " + S.current.atras;
  if (diff.inDays > 7)
    return S.current.hace + "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? S.current.semana : S.current.semanas} " + S.current.atras;
  if (diff.inDays > 0)
    return S.current.hace + "${diff.inDays} ${diff.inDays == 1 ? S.current.dia : S.current.dias} " + S.current.atras;
  if (diff.inHours > 0)
    return S.current.hace + "${diff.inHours} ${diff.inHours == 1 ? S.current.hora : S.current.horas} " + S.current.atras;
  if (diff.inMinutes > 0)
    return S.current.hace + "${diff.inMinutes} ${diff.inMinutes == 1 ? S.current.minuto : S.current.minutos} " + S.current.atras;
  return S.current.ahora;
}