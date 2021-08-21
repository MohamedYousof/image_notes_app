import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_notes/controller/helpers/api_helper.dart';

class NoteTile extends StatelessWidget {
  final remoteId;
  final imgUrl;
  final comment;
  final username;
  NoteTile({
    this.remoteId,
    this.imgUrl,
    this.username,
    this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          NoteHeader(username),
          Expanded(
            child: CachedNetworkImage(
              imageUrl: imgUrl ?? '${Api.baseUrl}/media/not_found.png',
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => LinearProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              comment,
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}

class NoteHeader extends StatelessWidget {
  final username;
  NoteHeader(this.username);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  username,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.share)),
              IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_border)),
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
            ],
          )
        ],
      ),
    );
  }
}
