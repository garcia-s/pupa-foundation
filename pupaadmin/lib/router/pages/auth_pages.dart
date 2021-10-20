import 'package:flutter/material.dart';
import 'package:pupaadmin/auth/ui/login_screen.dart';

class AuthPages {
  static const login = MaterialPage(
    key: ValueKey('login_page'),
    child: LoginScreen(),
  );
}
