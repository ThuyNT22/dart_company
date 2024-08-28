import 'dart:io';
import 'package:company_management/entity/employee.dart';
import 'package:company_management/services/employee_service.dart';

void main() {
  var employeeService = EmployeeService();

  while (true) {
    print('\nChọn một chức năng:');
    print('1: Thêm mới nhân viên');
    print('2: Lấy toàn bộ thông tin nhân viên');
    print('3: Cập nhật thông tin nhân viên');
    print('4: Thoát');
    stdout.write('Lựa chọn của bạn: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        addEmployee(employeeService);
        break;
      case '2':
        getAllEmployees(employeeService);
        break;
      case '3':
        updateEmployee(employeeService);
        break;
      case '4':
        exit(0);
      default:
        print('Lựa chọn không hợp lệ. Vui lòng chọn lại.');
    }
  }
}

void addEmployee(EmployeeService employeeService) {
  stdout.write('Nhập ID nhân viên: ');
  int id = int.parse(stdin.readLineSync()!);
  stdout.write('Nhập tên nhân viên: ');
  String fullname = stdin.readLineSync()!;
  stdout.write('Nhập ngày sinh nhân viên: ');
  String birthDay = stdin.readLineSync()!;
  stdout.write('Nhập địa chỉ nhân viên: ');
  String address = stdin.readLineSync()!;
  stdout.write('Nhập số điện thoại nhân viên: ');
  String phoneNumber = stdin.readLineSync()!;

  var newEmployee = Employee(
    id: id,
    fullname: fullname,
    birthDay: birthDay,
    address: address,
    phoneNumber: phoneNumber,
  );
  employeeService.addEmployee(newEmployee);
  print('Đã thêm nhân viên mới.');
}

void getAllEmployees(EmployeeService employeeService) {
  var employees = employeeService.getAllEmployees();
  print('\nDanh sách toàn bộ nhân viên:');
  for (var employee in employees) {
    print(
        'ID: ${employee.id}, Name: ${employee.fullname}, BirthDay: ${employee.birthDay}, Address: ${employee.address}, Phone: ${employee.phoneNumber}');
  }
}

void updateEmployee(EmployeeService employeeService) {
  stdout.write('Nhập ID nhân viên cần cập nhật: ');
  int id = int.parse(stdin.readLineSync()!);

  stdout.write('Nhập tên mới (hoặc để trống nếu không thay đổi): ');
  String? newFullname = stdin.readLineSync();
  if (newFullname != null && newFullname.isEmpty) {
    newFullname = null;
  }

  stdout.write('Nhập ngày sinh mới (hoặc để trống nếu không thay đổi): ');
  String? newBirthDay = stdin.readLineSync();
  if (newBirthDay != null && newBirthDay.isEmpty) {
    newBirthDay = null;
  }

  stdout.write('Nhập địa chỉ mới (hoặc để trống nếu không thay đổi): ');
  String? newAddress = stdin.readLineSync();
  if (newAddress != null && newAddress.isEmpty) {
    newAddress = null;
  }

  stdout.write('Nhập số điện thoại mới (hoặc để trống nếu không thay đổi): ');
  String? newPhoneNumber = stdin.readLineSync();
  if (newPhoneNumber != null && newPhoneNumber.isEmpty) {
    newPhoneNumber = null;
  }

  employeeService.updateEmployee(
    id,
    newFullname: newFullname,
    newBirthDay: newBirthDay,
    newAddress: newAddress,
    newPhoneNumber: newPhoneNumber,
  );
  print('Đã cập nhật thông tin nhân viên.');
}
