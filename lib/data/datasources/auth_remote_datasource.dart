import 'package:dartz/dartz.dart';
import 'package:flutter_cbt/core/constants/variables.dart';
import 'package:flutter_cbt/data/models/requests/auth_register_request_model.dart';
import 'package:flutter_cbt/data/models/responses/auth_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasources {
  Future<Either<String, AuthResponseModel>> register(RegisterRequestModel registerRequestModel) async {
    final response = await http.post(
      Uri.parse('$Variables.baseUrl/api/reqister'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: registerRequestModel.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('register gagal');
    }
  }
}