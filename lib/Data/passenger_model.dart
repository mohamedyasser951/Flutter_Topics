class PassengerModel {
  int? totalPassengers;
  int? totalPages;
  List<Data>? data;

  PassengerModel({this.totalPassengers, this.totalPages, this.data});

  PassengerModel.fromJson(Map<String, dynamic> json) {
    totalPassengers = json['totalPassengers'];
    totalPages = json['totalPages'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  
}

class Data {
  String? sId;
  String? name;
  int? trips;
  List<Airline>? airline;
  int? iV;

  Data({this.sId, this.name, this.trips, this.airline, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    trips = json['trips'];
    if (json['airline'] != null) {
      airline = <Airline>[];
      json['airline'].forEach((v) {
        airline!.add( Airline.fromJson(v));
      });
    }
    iV = json['__v'];
  }

}

class Airline {
  String? sId;
  int? id;
  String? name;
  String? country;
  String? logo;
  String? slogan;
  String? headQuaters;
  String? website;
  String? established;
  int? iV;

  Airline(
      {this.sId,
      this.id,
      this.name,
      this.country,
      this.logo,
      this.slogan,
      this.headQuaters,
      this.website,
      this.established,
      this.iV});

  Airline.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    name = json['name'];
    country = json['country'];
    logo = json['logo'];
    slogan = json['slogan'];
    headQuaters = json['head_quaters'];
    website = json['website'];
    established = json['established'];
    iV = json['__v'];
  }
}
