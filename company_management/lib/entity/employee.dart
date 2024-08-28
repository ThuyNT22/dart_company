class Employee {
  int id;
  String fullname;
  String birthDay;
  String address;
  String phoneNumber;

  Employee({
    required this.id,
    required this.fullname,
    required this.birthDay,
    required this.address,
    required this.phoneNumber,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      fullname: json['fullname'],
      birthDay: json['birthDay'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullname': fullname,
      'birthDay': birthDay,
      'address': address,
      'phoneNumber': phoneNumber,
    };
  }
}
