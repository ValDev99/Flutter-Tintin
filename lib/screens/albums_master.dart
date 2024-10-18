import 'package:flutter/material.dart';
import '../models/album.dart';
import '../services/album_service.dart';
import '../widgets/album_preview.dart';

class AlbumsMaster extends StatefulWidget {
  @override
  _AlbumsMasterState createState() => _AlbumsMasterState();
}

class _AlbumsMasterState extends State<AlbumsMaster> {
  List<Album> _readingList = [];

  void toggleReadingList(Album album) {
    setState(() {
      if (_readingList.contains(album)) {
        _readingList.remove(album);
      } else {
        _readingList.add(album);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Colors.black,
        child: FutureBuilder<List<Album>>(
          future: AlbumService.fetchAlbums(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text(
                'Erreur de chargement',
                style: TextStyle(color: Colors.white),
              )
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text(
                'Aucun album disponible',
                style: TextStyle(color: Colors.white),
              )
              );
            }

            final albums = snapshot.data!;
            return ListView.builder(
              itemCount: albums.length,
              itemBuilder: (context, index) {
                final album = albums[index];
                final isInReadingList = _readingList.contains(album);

                return AlbumPreview(
                  album: album,
                  isInReadingList: isInReadingList,
                  onToggleReadingList: toggleReadingList,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
