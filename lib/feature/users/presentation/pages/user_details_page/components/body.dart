

import 'package:flutter/material.dart';

import '../../../../data/models/user_model.dart';
import '../../users_page/components/customText.dart';

class UserDetailsBody extends StatelessWidget {
  UserModel user;
   UserDetailsBody(this. user, {super.key});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText("Name : ${user.name}"),
          CustomText("UserName : ${user.username}"),
          CustomText("Email : ${user.email}"),
          CustomText(
              "Address : ${user.address?.street}-${user.address?.suite}-${user.address?.city}"),
          CustomText("Phone : ${user.phone}"),
          CustomText("Website : ${user.website}"),
          CustomText('Company : ${user.company?.name}'),
        ],
      ),
    );}
}
