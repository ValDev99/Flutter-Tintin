import 'package:flutter/material.dart';
import '../services/album_service.dart';
import '../models/album.dart';
import '../widgets/album_preview.dart';



class AlbumsMaster extends StatefulWidget {
  @override
  _AlbumsMasterState createState() => _AlbumsMasterState();
}

class _AlbumsMasterState extends State<AlbumsMaster> {
  late Future<List<Album>> _albums;

  @override
  void initState() {
    super.initState();
    _albums = AlbumService.fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
      ),
      body: FutureBuilder<List<Album>>(
        future: _albums,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No albums found'));
          }

          List<Album> albums = snapshot.data!;
          return ListView.builder(
            itemCount: albums.length,
            itemBuilder: (context, index) {
              Album album = albums[index];
              return AlbumPreview(album: album);
            },
          );
        },
      ),
    );
  }
}
