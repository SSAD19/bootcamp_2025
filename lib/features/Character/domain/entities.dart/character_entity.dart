import 'dart:convert';

CharacterEntity characterFromJson(String str) => CharacterEntity.fromJson(json.decode(str));

String characterToJson(CharacterEntity data) => json.encode(data.toJson());

class CharacterEntity {
    int id;
    String name;
    String status;
    String species;
    String type;
    String gender;
    late String origin;
    late String location;
    String image;
    

    CharacterEntity({
        required this.id,
        required this.name,
        required this.status,
        required this.species,
        required this.type,
        required this.gender,
        required this.origin,
        required this.location,
        required this.image,
    });

    factory CharacterEntity.fromJson(Map<String, dynamic> json) => CharacterEntity(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        image: json["image"],
        origin: json["origin"]["name"],
        location: json["location"]["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
        "type": type,
        "gender": gender,
        "origin": origin,
        "location": location,
        "image": image,
    };
}

