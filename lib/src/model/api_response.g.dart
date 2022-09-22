// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkApi _$LinkApiFromJson(Map<String, dynamic> json) => LinkApi(
      rel: json['rel'] as String,
      href: json['href'] as String,
    );

Map<String, dynamic> _$LinkApiToJson(LinkApi instance) => <String, dynamic>{
      'rel': instance.rel,
      'href': instance.href,
    };

ResponseApi _$ResponseApiFromJson(Map<String, dynamic> json) => ResponseApi(
      links: (json['_links'] as List<dynamic>)
          .map((e) => LinkApi.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] as String,
      contacts: (json['data'] as List<dynamic>)
          .map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseApiToJson(ResponseApi instance) =>
    <String, dynamic>{
      '_links': instance.links,
      'count': instance.count,
      'data': instance.contacts,
    };
