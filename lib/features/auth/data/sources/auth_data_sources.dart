import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartapi/constants/api_constants.dart';
import 'package:smartapi/constants/key_constants.dart';
import 'package:smartapi/core/apis/api_calls.dart';

abstract class AuthDataSources {
  Future<String> registeruser({required Map<String, dynamic> userData});
}

class AuthDataSourcesImpl extends AuthDataSources {
  final ApiCalls apiCalls;

  AuthDataSourcesImpl({required this.apiCalls});

  @override
  Future<String> registeruser({required Map<String, dynamic> userData}) async {
    final response =
        await apiCalls.postData(
              endpoint:
                  ApiConstants.registerUserRoute, //should not be in strings
              data: userData,

              // Replace with actual shared preferences if needed
            )
            as Map;

    await saveAuthTokenAndUserDetails(
      token: response['token'],
      userDetails: jsonEncode(response['user']),
    );

    print(response);
    return 'User registered successfully';
  }

  Future saveAuthTokenAndUserDetails({
    required String token,
    required String userDetails,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(KeyConstants.kKeyForToken, token);
    await prefs.setString(KeyConstants.kKeyForUserDetail, userDetails);
  }
}
