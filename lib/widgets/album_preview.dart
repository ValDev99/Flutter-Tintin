import 'package:flutter/material.dart';
import '../models/album.dart';
import '../screens/album_details.dart';

class AlbumPreview extends StatelessWidget {
  final Album album;
  final bool isInReadingList;
  final Function(Album) onToggleReadingList;

  const AlbumPreview({
    super.key,
    required this.album,
    required this.isInReadingList,
    required this.onToggleReadingList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade900, //
      ),
      child: ListTile(
        title: Text(
          album.titre,
          style: TextStyle(
            fontWeight: isInReadingList ? FontWeight.bold : FontWeight.normal,
            color: Colors.white,
          ),
        ),
        leading: ClipRRect(
          child: Image.asset(
            'images/${album.image}',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        tileColor: isInReadingList ? Colors.green[700] : Colors.brown[800],
        trailing: IconButton(
          icon: Icon(
            isInReadingList ? Icons.bookmark_add : Icons.bookmark_add_outlined,
            color: Colors.white, //
          ),
          onPressed: () => onToggleReadingList(album),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AlbumDetails(
                album: album,
                isInReadingList: isInReadingList,
                onToggleReadingList: onToggleReadingList,
              ),
            ),
          );
        },
      ),
    );
  }
}
