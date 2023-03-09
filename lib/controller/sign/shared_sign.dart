import 'package:shared_preferences/shared_preferences.dart';

String? user;

setEmail() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('user', user!);
}

Future getEmail() async {
  try {
    final sharedpref = await SharedPreferences.getInstance();
    user = sharedpref.getString('user')!;
    print(user);
  } catch (_) {
    user = null;
  }
}

Future removeDate() async {
  final sharedpref = await SharedPreferences.getInstance();
  sharedpref.remove('user');
  sharedpref.remove('username');
}

String? username;
setUserName() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('username', username!);
}

Future getUserName() async {
  try {
    final sharedpref = await SharedPreferences.getInstance();
    username = sharedpref.getString('username')!;
    print(username);
  } catch (_) {
    username = null;
  }
}
