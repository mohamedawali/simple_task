import 'package:flutter/material.dart';

import '../../../data/models/user_model.dart';
import 'components/body.dart';

class UserDetailsPage extends StatelessWidget {
  UserModel user;
  UserDetailsPage(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: const Text(
          'User Details',
        ),
      ),
      body: UserDetailsBody(user)
    );
  }
}
