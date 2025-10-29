
import '../../domain/entites/address_entity.dart';

class AddressModel {
  String? name;
  String? email;
  String? address;
  String? floor;
  String? city;
  String? phone;

  AddressModel({
    this.name,
    this.email,
    this.address,
    this.floor,
    this.city,
    this.phone,
  });

factory AddressModel.fromJson(Map<String,dynamic> json){
  return AddressModel(
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

  toJason() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'floor': floor,
      'city': city,
      'phone': phone,
    };
  }

  toEntity(){
  return AddressEntity(
    name: name,
    email: email,
    address: address,
    floor: floor,
    city: city,
  );
}
}
