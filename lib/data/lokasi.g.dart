// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lokasi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LokasiResponse _$LokasiResponseFromJson(Map<String, dynamic> json) {
  return new LokasiResponse((json['location'] as List)
      ?.map((e) =>
          e == null ? null : new LokasiData.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

abstract class _$LokasiResponseSerializerMixin {
  List<LokasiData> get data;
  Map<String, dynamic> toJson() => <String, dynamic>{'location': data};
}

LokasiData _$LokasiDataFromJson(Map<String, dynamic> json) {
  return new LokasiData(
      json['code'] as String,
      json['value'] as String,
      json['desa'] as String,
      json['kecamatan'] as String,
      json['kotakab'] as String,
      json['provinsi'] as String);
}

abstract class _$LokasiDataSerializerMixin {
  String get code;
  String get value;
  String get desa;
  String get kec;
  String get kotakab;
  String get provinsi;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code,
        'value': value,
        'desa': desa,
        'kecamatan': kec,
        'kotakab': kotakab,
        'provinsi': provinsi
      };
}
