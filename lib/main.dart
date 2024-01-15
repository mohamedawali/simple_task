import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/users/presentation/cubit/user_cubit.dart';
import 'feature/users/presentation/pages/users_page/users_page.dart';
import 'injection_container.dart';

void main() {
  // call dependence injection container
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,

      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor:Colors.deepOrange ),

        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => instance<UserCubit>(),
        child: const UsersPage(),
      ),
    );
  }
}


