import 'package:flutter/material.dart';

import 'login_header_components/login_logo.dart';
import 'login_header_components/login_title_section.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        LoginLogo(),
        LoginTitleSection(),
      ],
    );
  }
}
