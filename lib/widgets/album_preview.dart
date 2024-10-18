import 'package:flutter/material.dart';
import '../models/album.dart';

class AlbumPreview extends StatelessWidget {
  final Album album;

  const AlbumPreview({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(album.titre),
      leading: album.image.isNotEmpty
          ? Image.asset(
        'images/${album.image}',
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      )
          : const Icon(Icons.image_not_supported),
    );
  }
}
