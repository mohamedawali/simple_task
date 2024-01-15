import 'package:flutter/material.dart';

import '../../../../data/models/user_model.dart';
import 'customText.dart';

class ListViewItem extends StatelessWidget {
  UserModel? user;
  ListViewItem(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          CustomText("Name: ${user?.name}"),
          CustomText("Email: ${user?.email}"),
          CustomText("Phone: ${user?.phone}")
        ],
      ),
    ));
  }
}
