import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_gd1/Cau8/controller/authController.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final controller = AuthController(context);
  // flag to show/hide password
  bool _isObscure = true;

  bool _isButtonDisabled = true;

  bool _isRemember = false;

  String? _savedUsername;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadSavedLoginInfo();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void _validateForm() {
    setState(() {
      _isButtonDisabled = !controller.formKey.currentState!.validate();
    });
  }

  Future<void> _loadSavedLoginInfo() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedUsername = prefs.getString('username');
      if (_savedUsername != null) {
        controller.userController.text = _savedUsername!;
        _isRemember = true;
      }
      print("Đọc dữ liệu từ local storage: $_savedUsername");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Form Test GD 1"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          onChanged: _validateForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "Login Form",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 100, child: Text("Tên đăng nhập")),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      controller: controller.userController,
                      keyboardType: TextInputType.emailAddress,
                      keyboardAppearance: Brightness.light,
                      focusNode: controller.userFocus,
                      onFieldSubmitted: (value) {
                        controller.userFocus.unfocus();
                        FocusScope.of(context).requestFocus(controller.passFocus);
                      },
                      decoration: const InputDecoration(
                        labelText: "Nhập 6 đến 12 kí tự",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập tên đăng nhập';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 100, child: Text("Mật khẩu")),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      controller: controller.passController,
                      obscureText: _isObscure,
                      focusNode: controller.passFocus,
                      onFieldSubmitted: (value) {
                        controller.passFocus.unfocus();
                      },
                      keyboardType: TextInputType.visiblePassword,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        hintText: "Mật khẩu",
                        labelText: "Mật khẩu",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập mật khẩu';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _isButtonDisabled
                      ? null
                      : () {
                          controller.login(context);
                        },
                  child: const Text("Đăng nhập"),
                ),
              ),
              _isRemember
                  ? ElevatedButton(
                      onPressed: () {
                        controller.showDataLocal();
                      },
                      child: Text("Show Data Local Storage"))
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
