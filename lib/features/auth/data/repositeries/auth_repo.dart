import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../../../core/constants/endpoints.dart';
import '../../../../core/constants/keys_enums.dart';
import '../../../../core/utils/local_data_provider.dart';

class AuthRepo {
  AuthRepo(this.ref);
  final Ref ref;
  tokenVerfication() async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    final token = prefs.getString(SharedPrefrenceKeys.token.name);
    final result = await http.get(Uri.parse(tokenVerification),
        headers: {"Authorization": "Bearer $token"});
    final data = json.decode(result.body);
    return data;
  }

  userLogin(Map<String, dynamic> loginBody) async {
    final result = await http.post(Uri.parse(login), body: loginBody);
    final data = json.decode(result.body);
    return data;
  }

  postUserName(Map<String, dynamic> postUsernameBody) async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    final token = prefs.getString(SharedPrefrenceKeys.token.name);
    final result = await http.post(Uri.parse(postName),
        headers: {"Authorization": "Bearer $token"}, body: postUsernameBody);
    final data = json.decode(result.body);
    return data;
  }

  logoutUser() async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    prefs.clear();
  }
}

final authRepoProvider = Provider<AuthRepo>((ref) {
  return AuthRepo(ref);
});
