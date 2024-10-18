import 'gps.dart';

class Album {
  final String titre;
  final int numero;
  final int parution;
  final int? parutionEnCouleur;
  final String image;
  final String resume;
  final GPS gps;
  final String lieu;

  Album({
    required this.titre,
    required this.numero,
    required this.parution,
    this.parutionEnCouleur,
    required this.image,
    required this.resume,
    required this.gps,
    required this.lieu,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    List<String> gpsCoords = json['gps'].split(',');

    return Album(
      titre: json['titre'],
      numero: json['numero'],
      parution: json['parution'],
      parutionEnCouleur: json['parutionEnCouleur'],
      image: json['image'],
      resume: json['resume'],
      lieu: json['lieu'],
      gps: GPS(
        latitude: double.parse(gpsCoords[0]),
        longitude: double.parse(gpsCoords[1]),
      ),
    );
  }
}
