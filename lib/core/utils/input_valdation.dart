import 'package:intl_phone_field/phone_number.dart' as intl_phone;
import 'package:phone_number/phone_number.dart';

class InputValidation {
  Future<bool> phoneValidation(intl_phone.PhoneNumber phone) async {
    if (phone.number.length <= 1) {
      return false;
    }
    bool isValid = await PhoneNumberUtil()
        .validate(phone.number, regionCode: phone.countryISOCode);
    return isValid;
  }

  String? nameValidation(String? val) {
    if (val == null || val.trim().isEmpty) {
      return "Name is required";
    } else if (val.length < 3) {
      return "Name must be longe than 2 letters";
    } else {
      return null;
    }
  }
}
