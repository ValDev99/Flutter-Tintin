import 'package:flutter/material.dart';
import './models/album.dart';
import './models/gps.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Album App',
      home: AlbumScreen(),
    );
  }
}

class AlbumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    GPS gps = GPS(latitude: 48.8584, longitude: 2.2945);


    Album album = Album(
      title: 'Greatest Hits',
      numero: 1,
      year: 2023,
      yearInColor: null,
      image: 'https://example.com/image.jpg',
      resume: 'The best songs of the decade.',
      gps: gps,
      location: 'Paris, France',
    );


    print(album.toString());

    print(album.toJson());

    return Scaffold(
      appBar: AppBar(
        title: Text('Album Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: ${album.title}'),
            Text('Numero: ${album.numero}'),
            Text('Year: ${album.year}'),
            Text('Year in Color: ${album.yearInColor ?? 'N/A'}'),
            Text('Image: ${album.image}'),
            Text('Resume: ${album.resume}'),
            Text('GPS: ${album.gps.toString()}'),
            Text('Location: ${album.location}'),
            SizedBox(height: 20),
            Text('Album in JSON:'),
            Text(album.toJson().toString()),
          ],
        ),
      ),
    );
  }
}
