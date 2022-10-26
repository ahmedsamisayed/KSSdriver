class GetSingleOrder {
  bool? success;
  Order? order;

  GetSingleOrder({this.success, this.order});

  GetSingleOrder.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    return data;
  }
}

class Order {
  BokImage? bokImage;
  String? sId;
  List<ShippingInfo>? shippingInfo;
  User? user;
  List<OrderItems>? orderItems;
  String? orderStatus;
  String? createdAt;
  int? iV;

  Order(
      {this.bokImage,
        this.sId,
        this.shippingInfo,
        this.user,
        this.orderItems,
        this.orderStatus,
        this.createdAt,
        this.iV});

  Order.fromJson(Map<String, dynamic> json) {
    bokImage = json['bokImage'] != null
        ? new BokImage.fromJson(json['bokImage'])
        : null;
    sId = json['_id'];
    if (json['shippingInfo'] != null) {
      shippingInfo = <ShippingInfo>[];
      json['shippingInfo'].forEach((v) {
        shippingInfo!.add(new ShippingInfo.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['orderItems'] != null) {
      orderItems = <OrderItems>[];
      json['orderItems'].forEach((v) {
        orderItems!.add(new OrderItems.fromJson(v));
      });
    }
    orderStatus = json['orderStatus'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bokImage != null) {
      data['bokImage'] = this.bokImage!.toJson();
    }
    data['_id'] = this.sId;
    if (this.shippingInfo != null) {
      data['shippingInfo'] = this.shippingInfo!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.orderItems != null) {
      data['orderItems'] = this.orderItems!.map((v) => v.toJson()).toList();
    }
    data['orderStatus'] = this.orderStatus;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}

class BokImage {
  String? data;

  BokImage({this.data});

  BokImage.fromJson(Map<String, dynamic> json) {
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    return data;
  }
}

class ShippingInfo {
  Location? location;
  String? address;
  String? phoneNo1;
  String? phoneNo2;
  String? sId;

  ShippingInfo(
      {this.location, this.address, this.phoneNo1, this.phoneNo2, this.sId});

  ShippingInfo.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    address = json['address'];
    phoneNo1 = json['phoneNo1'];
    phoneNo2 = json['phoneNo2'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['address'] = this.address;
    data['phoneNo1'] = this.phoneNo1;
    data['phoneNo2'] = this.phoneNo2;
    data['_id'] = this.sId;
    return data;
  }
}

class Location {
  double? latitude;
  double? longitude;

  Location({this.latitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class User {
  String? sId;
  String? phone;

  User({this.sId, this.phone});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['phone'] = this.phone;
    return data;
  }
}

class OrderItems {
  String? name;
  String? head;
  String? bowels;
  String? weight;
  int? headPrice;
  int? weightPrice;
  int? bowelsPrice;
  int? quantity;
  int? totalPrice;
  String? sId;

  OrderItems(
      {this.name,
        this.head,
        this.bowels,
        this.weight,
        this.headPrice,
        this.weightPrice,
        this.bowelsPrice,
        this.quantity,
        this.totalPrice,
        this.sId});

  OrderItems.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    head = json['head'];
    bowels = json['bowels'];
    weight = json['weight'];
    headPrice = json['headPrice'];
    weightPrice = json['weightPrice'];
    bowelsPrice = json['bowelsPrice'];
    quantity = json['quantity'];
    totalPrice = json['totalPrice'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['head'] = this.head;
    data['bowels'] = this.bowels;
    data['weight'] = this.weight;
    data['headPrice'] = this.headPrice;
    data['weightPrice'] = this.weightPrice;
    data['bowelsPrice'] = this.bowelsPrice;
    data['quantity'] = this.quantity;
    data['totalPrice'] = this.totalPrice;
    data['_id'] = this.sId;
    return data;
  }
}