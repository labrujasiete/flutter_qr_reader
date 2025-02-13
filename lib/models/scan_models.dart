import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));

String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {

    int? id;
    String? tipo;
    String valor;

    // returns googlemaps LatLng Object
    LatLng getLatLng(){
      final latLng = this.valor.substring(4).split(',');
      final lat = double.parse(latLng[0]);
      final lng = double.parse(latLng[1]);
      return LatLng(lat, lng);
    }

    ScanModel({
        this.id,
        this.tipo,
        required this.valor,
    }) {

    if (valor.contains('http')) {
      tipo = 'http';
    } else {
      tipo = 'geo';
    }
    
    }



    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
    };
}
