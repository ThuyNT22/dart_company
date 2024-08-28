import 'dart:convert';
import 'dart:io';
import '../entity/employee.dart';

class EmployeeService {
  final String filePath = 'data/employees.json';
  List<Employee> employees = [];

  EmployeeService() {
    loadData();
  }

  void loadData() {
    var file = File(filePath);
    if (file.existsSync()) {
      var jsonData = file.readAsStringSync();
      var data = jsonDecode(jsonData) as List<dynamic>;
      employees =
          data.map((employeeJson) => Employee.fromJson(employeeJson)).toList();
    }
  }

  void saveData() {
    var file = File(filePath);
    var jsonData = jsonEncode(employees.map((e) => e.toJson()).toList());
    file.writeAsStringSync(jsonData);
  }

  void addEmployee(Employee employee) {
    employees.add(employee);
    saveData();
  }

  List<Employee> getAllEmployees() {
    return employees;
  }

  void updateEmployee(int id,
      {String? newFullname,
      String? newBirthDay,
      String? newAddress,
      String? newPhoneNumber}) {
    for (var i = 0; i < employees.length; i++) {
      if (employees[i].id == id) {
        if (newFullname != null) {
          employees[i].fullname = newFullname;
        }
        if (newBirthDay != null) {
          employees[i].birthDay = newBirthDay;
        }
        if (newAddress != null) {
          employees[i].address = newAddress;
        }
        if (newPhoneNumber != null) {
          employees[i].phoneNumber = newPhoneNumber;
        }
        saveData();
        return;
      }
    }
    print("Employee with ID $id not found.");
  }
}
