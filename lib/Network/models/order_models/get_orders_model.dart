import 'package:json_annotation/json_annotation.dart';

part 'get_orders_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetOrdersModel {
  int? success;
  String? message;
  List<Party>? data;

  GetOrdersModel({this.success, this.message, this.data});

  factory GetOrdersModel.fromJson(Map<String, dynamic> json) => _$GetOrdersModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetOrdersModelToJson(this);

  GetOrdersModel copyWith({
    int? success,
    String? message,
    List<Party>? data,
  }) {
    return GetOrdersModel(
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Party {
  int? partyId;
  String? partyName;
  String? partyPhone;
  String? partyEmail;
  List<Order>? orders;

  Party({this.partyId, this.partyName, this.partyPhone, this.partyEmail, this.orders});

  factory Party.fromJson(Map<String, dynamic> json) => _$PartyFromJson(json);

  Map<String, dynamic> toJson() => _$PartyToJson(this);

  Party copyWith({
    int? partyId,
    String? partyName,
    String? partyPhone,
    String? partyEmail,
    List<Order>? orders,
  }) {
    return Party(
      partyId: partyId ?? this.partyId,
      partyName: partyName ?? this.partyName,
      partyPhone: partyPhone ?? this.partyPhone,
      partyEmail: partyEmail ?? this.partyEmail,
      orders: orders ?? this.orders,
    );
  }
}

@JsonSerializable()
class Order {
  int? orderId;
  String? purchaseOrderNumber;
  String? boxType;
  String? boxSize;
  String? boxQuantity;
  String? wayType;
  String? boxPurity;
  String? isTop;
  String? topPatiyaSize;
  String? topPatiyaQuantity;
  String? sleeperPatiyaSize;
  String? sleeperPatiyaQuantity;
  String? ghodiPatiyaSize;
  String? ghodiPatiyaQuantity;
  String? blockSize;
  String? blockQuantity;
  String? deliveryDate;

  Order({
    this.orderId,
    this.purchaseOrderNumber,
    this.boxType,
    this.boxSize,
    this.boxQuantity,
    this.wayType,
    this.boxPurity,
    this.isTop,
    this.topPatiyaSize,
    this.topPatiyaQuantity,
    this.sleeperPatiyaSize,
    this.sleeperPatiyaQuantity,
    this.ghodiPatiyaSize,
    this.ghodiPatiyaQuantity,
    this.blockSize,
    this.blockQuantity,
    this.deliveryDate,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);

  Order copyWith({
    int? orderId,
    String? purchaseOrderNumber,
    String? boxType,
    String? boxSize,
    String? boxQuantity,
    String? wayType,
    String? boxPurity,
    String? isTop,
    String? topPatiyaSize,
    String? topPatiyaQuantity,
    String? sleeperPatiyaSize,
    String? sleeperPatiyaQuantity,
    String? ghodiPatiyaSize,
    String? ghodiPatiyaQuantity,
    String? blockSize,
    String? blockQuantity,
    String? deliveryDate,
  }) {
    return Order(
      orderId: orderId ?? this.orderId,
      purchaseOrderNumber: purchaseOrderNumber ?? this.purchaseOrderNumber,
      boxType: boxType ?? this.boxType,
      boxSize: boxSize ?? this.boxSize,
      boxQuantity: boxQuantity ?? this.boxQuantity,
      wayType: wayType ?? this.wayType,
      boxPurity: boxPurity ?? this.boxPurity,
      isTop: isTop ?? this.isTop,
      topPatiyaSize: topPatiyaSize ?? this.topPatiyaSize,
      topPatiyaQuantity: topPatiyaQuantity ?? this.topPatiyaQuantity,
      sleeperPatiyaSize: sleeperPatiyaSize ?? this.sleeperPatiyaSize,
      sleeperPatiyaQuantity: sleeperPatiyaQuantity ?? this.sleeperPatiyaQuantity,
      ghodiPatiyaSize: ghodiPatiyaSize ?? this.ghodiPatiyaSize,
      ghodiPatiyaQuantity: ghodiPatiyaQuantity ?? this.ghodiPatiyaQuantity,
      blockSize: blockSize ?? this.blockSize,
      blockQuantity: blockQuantity ?? this.blockQuantity,
      deliveryDate: deliveryDate ?? this.deliveryDate,
    );
  }
}
