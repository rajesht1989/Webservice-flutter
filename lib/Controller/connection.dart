import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restapisample/Model/UserListResponse.dart';

import '../Model/CreateUser.dart';

Future<UserListResponse> fetchUsers(String page) async {
  final response = await http.get(Uri.parse('https://reqres.in/api/users?page=$page'));
  if (response.statusCode == 200) 
  {
    return UserListResponse.fromJson(jsonDecode(response.body));
  }
  else
    {
      throw Exception('Failed to load user list');
    }
}

Future<UserCreateResponse> createUser(UserCreateBody user) async {
  var body = user.toJson();
  final response = await http.post(Uri.parse('https://reqres.in/api/users'), body: body);
  if (response.statusCode == 201)
  {
    return UserCreateResponse.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('Failed to add user');
  }
}