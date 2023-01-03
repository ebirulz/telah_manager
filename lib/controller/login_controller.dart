import 'package:manager/models/login/login_request.dart';
import 'package:manager/network/fetch_data.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../models/login/login_response.dart' as response;

enum LoginField { IDENTIFIER, PASSWORD, CHECKBOX }

class LoginController {
  FormGroup formGroup() => fb.group(<String, Object>{
        LoginField.IDENTIFIER.name: FormControl<String>(
          validators: [Validators.required, Validators.email],
        ),
        LoginField.PASSWORD.name: FormControl<String>(
            validators: [Validators.required, Validators.minLength(8)]),
        'rememberMe': false,
        LoginField.CHECKBOX.name: FormControl<bool>(
          value: false,
        ),
      });

  Future<response.LoginResponse?> login(FormGroup formGroup) async {
    final data = formGroup.value;
    LoginRequest request = LoginRequest(
        identifier: data[LoginField.IDENTIFIER.name].toString(),
        password: data[LoginField.PASSWORD.name].toString(),
        invalidateOtherSessions: data[LoginField.CHECKBOX.name] as bool,
        firebaseToken: "",
        data: <Data>[
          Data(
            name: "email",
            value: data[LoginField.IDENTIFIER.name].toString(),
          ),
        ],
        refreshTokenDurationInSeconds: 0);
    final apiRequest = await FetchData.login(request.toJson());
    return apiRequest;
  }
}
