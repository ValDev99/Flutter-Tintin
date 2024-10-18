import 'package:flutter/material.dart';
import '../models/album.dart';
import '../screens/album_details.dart';


class AlbumPreview extends StatelessWidget {
  final Album album;
  final bool isInReadingList;
  final Function(Album) onToggleReadingList;

  const AlbumPreview({
    Key? key,
    required this.album,
    required this.isInReadingList,
    required this.onToggleReadingList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        album.titre,
        style: TextStyle(
          fontWeight: isInReadingList ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      leading: Image.asset(
        'images/${album.image}',
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      tileColor: isInReadingList ? Colors.lightGreen[100] : null,
      trailing: IconButton(
        icon: Icon(
          isInReadingList ? Icons.check_box : Icons.check_box_outline_blank,
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
    );
  }
}
