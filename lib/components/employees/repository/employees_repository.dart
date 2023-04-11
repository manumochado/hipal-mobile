import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';
import 'package:hipal/components/employees/model/employee.dart';
import 'package:hipal/serializers/pagination.dart';

class EmployeesRepository {
  final String apiHost = Environment().config.apiHost;

  Future<dynamic> getEmployees(BuildContext context, params) async {
    print("**** getEmployees ${params}");
    final httpService = new HttpService(context);
    final response = await httpService.sendGet('$apiHost/employees$params',
        module: "Empleados");

    if (response != null && response.statusCode == 200) {
      print("**** getEmployees 200");
    } else {
      print("**** getEmployees ${response?.statusCode}");
    }

    return response;
  }

  Future<dynamic> saveEmployee(BuildContext context, params) async {
    print("************ employees_repository saveEmployee");
    final httpService = new HttpService(context);
    print(params);

    final response = await httpService.sendPost('$apiHost/employees', params,
        module: "Empleados");

    if (response != null && response.statusCode == 200) {
      print("************ employees_repository status 200");
    }
    return response;
  }

  Future<dynamic> editEmployee(BuildContext context, String id, params) async {
    final httpService = new HttpService(context);

    final response = await httpService
        .sendUpdate('$apiHost/employees/$id', params, module: "Empleados");

    if (response != null && response.statusCode == 200) {}
    return response;
  }

  Future<dynamic> deleteEmployee(BuildContext context, id) async {
    final httpService = new HttpService(context);

    final response = await httpService.sendDelete('$apiHost/employees/$id', {},
        module: "Empleados");

    if (response != null && response.statusCode == 200) {}
    return response;
  }
}
