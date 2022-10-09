import 'package:kss_driver/model/api/infos/infosModule.dart';

// class OfferResponse {
//   var success;
//   List<Infos> infos;
//
//   OfferResponse({required this.success, required this.infos});
//
//   factory OfferResponse.fromJson(Map<dynamic, dynamic> json) {
//     OfferResponse offerResponse = OfferResponse(success: 'success', infos:[]);
//     for(var c in json['infos'] ){
//       Infos temp = Infos.fromJson(c);
//       offerResponse.infos.add(temp);
//     };
//     offerResponse.success = json['success'];
//     return offerResponse;
//   }
// }
class OfferResponse {
  bool? success;
  List<Infos>? infos;

  OfferResponse({this.success, this.infos});

  OfferResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['infos'] != null) {
      infos = <Infos>[];
      json['infos'].forEach((v) {
        infos!.add(new Infos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.infos != null) {
      data['infos'] = this.infos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Infos {
  String? sId;
  String? offer;
  int? kss_driverPhone;
  String? kss_driverEmail;
  int? bokNumber;
  int? iV;

  Infos(
      {this.sId,
        this.offer,
        this.kss_driverPhone,
        this.kss_driverEmail,
        this.bokNumber,
        this.iV});

  Infos.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    offer = json['offer'];
    kss_driverPhone = json['kss_driverPhone'];
    kss_driverEmail = json['kss_driverEmail'];
    bokNumber = json['bokNumber'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['offer'] = this.offer;
    data['kss_driverPhone'] = this.kss_driverPhone;
    data['kss_driverEmail'] = this.kss_driverEmail;
    data['bokNumber'] = this.bokNumber;
    data['__v'] = this.iV;
    return data;
  }
}