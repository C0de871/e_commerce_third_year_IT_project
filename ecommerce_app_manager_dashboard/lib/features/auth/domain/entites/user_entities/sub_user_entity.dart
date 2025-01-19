class SubUserEntity {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? location;
  String? phoneNumber;
  String? imageUrl;
  String? fcmToken;
  String role;

  SubUserEntity({
    required this.id,
    required this.firstName,
    required this.email,
    required this.lastName,
    required this.location,
    required this.phoneNumber,
    required this.imageUrl,
    required this.fcmToken,
    required this.role,
  });
}
