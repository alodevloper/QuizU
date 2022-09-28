import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../../../core/core.dart';

class ProfileRepo {
  ProfileRepo(this.ref);
  final Ref ref;
  getUserInfo() async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    final token = prefs.getString(SharedPrefrenceKeys.token.name);
    final result = await http
        .get(Uri.parse(userInfo), headers: {"Authorization": "Bearer $token"});
    final data = json.decode(result.body);
    log(data.toString());
    return data;
  }
}

final profileRepoProvider = Provider<ProfileRepo>((ref) {
  return ProfileRepo(ref);
});
