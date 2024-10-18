import 'package:flutter/material.dart';
import '../models/album.dart';

class AlbumDetails extends StatelessWidget {
  final Album album;
  final bool isInReadingList;
  final Function(Album) onToggleReadingList;

  const AlbumDetails({
    Key? key,
    required this.album,
    required this.isInReadingList,
    required this.onToggleReadingList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.titre),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Album n°: ${album.numero}',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Résumé: ${album.resume}',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            SizedBox(height: 10),
            Text(
              'Année de parution: ${album.parution}',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            album.image.isNotEmpty
                ? Center(
              child: Image.asset(
                'images/${album.image}',
                width: 200,
                height: 300,
                fit: BoxFit.cover,
              ),
            )
                : Icon(Icons.image, size: 100, color: Colors.white),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onToggleReadingList(album);
          Navigator.pop(context);
        },
        backgroundColor: Colors.redAccent,
        child: Icon(
          isInReadingList ? Icons.remove_circle : Icons.add_circle,
        ),
      ),
    );
  }
}
