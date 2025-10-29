
class AddressEntity {
  String? name;
  String? email;
  String? address;
  String? floor;
  String? city;
  String? phone;

  AddressEntity({
    this.name,
    this.email,
    this.address,
    this.floor,
    this.city,
    this.phone,
  });

  factory AddressEntity.fromJson(Map<String, dynamic> json) {
    return AddressEntity(
      name: json['name'],
      email: json['email'],
      address: json['address'],
      floor: json['floor'],
      city: json['city'],
      phone: json['phone'],
    );
  }




  @override
  String toString() {
    return '$address, floor: $floor, city: $city ';
  }

}
