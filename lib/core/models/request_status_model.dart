import '../core.dart';

class RequestStatusModel {
  RequestStatusModel(
      {required this.requestStatus, this.message = '', this.data});
  final RequestStatus requestStatus;
  final String message;
  final dynamic data;
}
