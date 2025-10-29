
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



  @override
  String toString() {
    return '$address, floor: $floor, city: $city ';
  }

}
