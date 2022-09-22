import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  String? id;
  String firstName;
  String lastName;
  String email;
  String notes;
  List<String> picture;
  String phone;

  Contact(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.notes,
      required this.phone,
      required this.picture});

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
