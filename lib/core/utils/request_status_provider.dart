import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/keys_enums.dart';
import '../models/request_status_model.dart';

final requestStatusProvider =
    StateProvider.autoDispose<RequestStatusModel>((ref) {
  return RequestStatusModel(requestStatus: RequestStatus.init);
});
