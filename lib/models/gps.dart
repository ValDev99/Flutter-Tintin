class GPS {
  final double latitude;
  final double longitude;

  GPS({required this.latitude, required this.longitude});

  factory GPS.fromJson(String gpsString) {
    List<String> gpsCoords = gpsString.split(',');
    return GPS(
      latitude: double.parse(gpsCoords[0]),
      longitude: double.parse(gpsCoords[1]),
    );
  }
}
