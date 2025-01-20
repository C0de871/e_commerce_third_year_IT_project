// ignore_for_file: public_member_api_docs, sort_constructors_first
class DataEntity {
  int id;
  String firstName;
  String lastName;
  String email;
  String location;
  String phoneNumber;
  String imageUrl;
  String? role;
  DataEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.location,
    required this.phoneNumber,
    required this.imageUrl,
    this.role,
  });
}
