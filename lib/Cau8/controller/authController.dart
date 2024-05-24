import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final BuildContext context;
  AuthController(this.context);

  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final FocusNode userFocus = FocusNode();
  final FocusNode passFocus = FocusNode();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void dispose() {
    userController.dispose();
    passController.dispose();
    userFocus.dispose();
    passFocus.dispose();
  }

  void login(BuildContext context) {
    if (userController.text == 'admin' && passController.text == 'admin') {
      _showWelcomeDialog(userController.text, context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đăng nhập thất bại'),
        ),
      );
    }
  }

  Future<void> _showWelcomeDialog(String username, BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Xin chào'),
          content: Text('Xin chào: $username'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: TextButton(
                  onPressed: () {
                    saveLoginInfo();
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK')),
            ),
          ],
        );
      },
    );
  }

  Future<void> saveLoginInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', userController.text);
    await prefs.setString('password', passController.text);
    // thông baáo khi lưu thành công
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Đã lưu thông tin đăng nhập'),
      ),
    );
  }
  //display saved login info by dialog + method to delete saved login info

  Future<void> showDataLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    final password = prefs.getString('password');
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Thông tin đăng nhập'),
          content: Row(
            children: [
              Text('Username: $username' ?? 'Không có dữ liệu'),
              const SizedBox(
                width: 10,
              ),
              Text('Password: $password' ?? 'Không có dữ liệu'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                deleteLocalData();
                Navigator.of(context).pop();
              },
              child: const Text('Delete Saved Local Data'),
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('password');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Đã xóa thông tin đăng nhập'),
      ),
    );
  }
}
