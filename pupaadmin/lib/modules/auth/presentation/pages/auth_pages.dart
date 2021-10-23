import 'package:flutter/material.dart';
import 'package:pupaadmin/modules/auth/presentation/pages/login_screen.dart';


class AuthPages {
  static const login = MaterialPage(
    key: ValueKey('login_page'),
    child: LoginScreen(),
  );
}
