import 'package:json_annotation/json_annotation.dart';

part 'lokasi.g.dart';

@JsonSerializable()
class LokasiResponse extends Object with _$LokasiResponseSerializerMixin {

  @JsonKey(name: "location")
  List<LokasiData> data;

  LokasiResponse(this.data);
  factory LokasiResponse.fromJson(Map<String, dynamic> json) => _$LokasiResponseFromJson(json);


}

@JsonSerializable()
class LokasiData extends Object with _$LokasiDataSerializerMixin {
  @JsonKey(name: "code")
  String code;
  @JsonKey(name: "value")
  String value;
  @JsonKey(name: "desa")
  String desa;
  @JsonKey(name: "kecamatan")
  String kec;
  @JsonKey(name: "kotakab")
  String kotakab;
  @JsonKey(name: "provinsi")
  String provinsi;

  LokasiData(this.code, this.value, this.desa, this.kec, this.kotakab,
      this.provinsi);

  factory LokasiData.fromJson(Map<String, dynamic> json) => _$LokasiDataFromJson(json);


}