import 'package:flutter/material.dart';
import '../models/album.dart';

class AlbumDetails extends StatelessWidget {
  final Album album;

  AlbumDetails({required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.titre),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            album.image.isNotEmpty
                ? Image.network(album.image, height: 200, fit: BoxFit.cover)
                : Icon(Icons.music_note, size: 200),
            SizedBox(height: 20),
            Text(
              album.titre,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Year: ${album.parution}', style: TextStyle(fontSize: 18)),
            Text('Album Number: ${album.numero}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
