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
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 10),
            Text('Numéro: ${album.numero}'),
            Text('Parution: ${album.parution}'),
            if (album.parutionEnCouleur != null)
              Text('Parution en couleur: ${album.parutionEnCouleur}'),
            SizedBox(height: 10),
            Text('Résumé: ${album.resume}'),
            SizedBox(height: 10),
            Text('Lieu: ${album.lieu}'),
            SizedBox(height: 10),
            Text('Coordonnées GPS: ${album.gps.latitude}, ${album.gps.longitude}'),
            album.image.isNotEmpty
                ? Image.asset(
              'images/${album.image}',
              width: 250,
              height: 250,)
                : Icon(Icons.image),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onToggleReadingList(album);
          Navigator.pop(context);
        },
        child: Icon(
          isInReadingList ? Icons.remove_circle : Icons.add_circle,
        ),
      ),
    );
  }
}
