import 'package:flutter/material.dart';
import '../models/album.dart';
import '../screens/album_details.dart';

class AlbumPreview extends StatelessWidget {
  final Album album;

  AlbumPreview({required this.album});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(album.title),
      leading: album.image.isNotEmpty
          ? Image.network(album.image, width: 50, height: 50, fit: BoxFit.cover)
          : Icon(Icons.music_note, size: 50),
      // Redirection vers l'écran AlbumDetails au clic
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlbumDetails(album: album),
          ),
        );
      },
    );
  }
}
