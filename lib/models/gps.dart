class GPS {
  final double latitude;
  final double longitude;

  GPS({required this.latitude, required this.longitude});

  @override
  String toString() {
    return 'GPS: (latitude: $latitude, longitude: $longitude)';
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
