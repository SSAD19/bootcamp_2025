import 'dart:convert';

// import 'package:bootcampo_extrados_class/features/Location/domain/entities.dart/location_entity.dart';

CharacterEntity characterFromJson(String str) => CharacterEntity.fromJson(json.decode(str));

String characterToJson(CharacterEntity data) => json.encode(data.toJson());

class CharacterEntity {
    int id;
    String name;
    String status;
    String species;
    String type;
    String gender;
 //   Location origin;
 //   Location location;
    String image;
    

    CharacterEntity({
        required this.id,
        required this.name,
        required this.status,
        required this.species,
        required this.type,
        required this.gender,
     //   required this.origin,
      //  required this.location,
        required this.image,
    });

    factory CharacterEntity.fromJson(Map<String, dynamic> json) => CharacterEntity(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
    //    origin: Location.fromJson(json["origin"]),
    //    location: Location.fromJson(json["location"]),
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
        "type": type,
        "gender": gender,
    //    "origin": origin.toJson(),
    //    "location": location.toJson(),
        "image": image,
    };
}






