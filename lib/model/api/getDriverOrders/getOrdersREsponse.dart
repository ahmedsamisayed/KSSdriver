class GetDeliveries {
  bool? success;
  List<Deliveries>? deliveries;

  GetDeliveries({this.success, this.deliveries});

  GetDeliveries.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['deliveries'] != null) {
      deliveries = <Deliveries>[];
      json['deliveries'].forEach((v) {
        deliveries!.add(new Deliveries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.deliveries != null) {
      data['deliveries'] = this.deliveries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Deliveries {
  String? sId;
  String? user;
  String? order;
  int? iV;

  Deliveries({this.sId, this.user, this.order, this.iV});

  Deliveries.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    order = json['order'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['order'] = this.order;
    data['__v'] = this.iV;
    return data;
  }
}