import 'package:json_annotation/json_annotation.dart';

part 'get_parties_model.g.dart';

@JsonSerializable()
class GetPartiesModel {
  int? success;
  List<PartyData>? data;

  GetPartiesModel({
    this.success,
    this.data,
  });

  factory GetPartiesModel.fromJson(Map<String, dynamic> json) => _$GetPartiesModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetPartiesModelToJson(this);

  GetPartiesModel copyWith({
    int? success,
    List<PartyData>? data,
  }) {
    return GetPartiesModel(
      success: success ?? this.success,
      data: data ?? this.data,
    );
  }
}

@JsonSerializable()
class PartyData {
  int? partyId;
  String? partyName;
  String? partyPhone;
  String? partyEmail;

  @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  DateTime? createdDate;

  String? createdTime;

  PartyData({
    required this.partyId,
    required this.partyName,
    required this.partyPhone,
    required this.partyEmail,
    required this.createdDate,
    required this.createdTime,
  });

  factory PartyData.fromJson(Map<String, dynamic> json) => _$PartyDataFromJson(json);

  Map<String, dynamic> toJson() => _$PartyDataToJson(this);

  static DateTime? _dateTimeFromJson(String? date) => date != null ? DateTime.tryParse(date) : null;

  static String? _dateTimeToJson(DateTime? date) => date?.toIso8601String();

  PartyData copyWith({
    int? partyId,
    String? partyName,
    String? partyPhone,
    String? partyEmail,
    DateTime? createdDate,
    String? createdTime,
  }) {
    return PartyData(
      partyId: partyId ?? this.partyId,
      partyName: partyName ?? this.partyName,
      partyPhone: partyPhone ?? this.partyPhone,
      partyEmail: partyEmail ?? this.partyEmail,
      createdDate: createdDate ?? this.createdDate,
      createdTime: createdTime ?? this.createdTime,
    );
  }
}
