import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/user_cubit.dart';
import 'components/body.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    var userCubitInstance = BlocProvider.of<UserCubit>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: const Text(
          'Users Page',
        ),
      ),
      body: const Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userCubitInstance.getAllUsers();
        },
        child: const Icon(Icons.refresh_outlined),
      ),
    );
  }
}
