import 'dart:async';
import 'package:faker/faker.dart';
import '../models/album.dart';
import '../models/gps.dart';

class AlbumService {
  static Future<List<Album>> generateAlbums(int count) async {
    await Future.delayed(Duration(seconds: 2));

    return List.generate(count, (index) {
      var faker = Faker();

      GPS gps = GPS(
        latitude: faker.randomGenerator.decimal(min: -90, scale: 90),
        longitude: faker.randomGenerator.decimal(min: -180, scale: 180),
      );

      return Album(
        title: faker.lorem.words(3).join(' '),
        numero: faker.randomGenerator.integer(100),
        year: faker.date.dateTime(minYear: 1970, maxYear: 2023).year,
        yearInColor: faker.randomGenerator.boolean() ? faker.randomGenerator.integer(2023) : null,
        image: faker.image.image(),
        resume: faker.lorem.sentence(),
        gps: gps,
        location: faker.address.city(),
      );
    });
  }
}
