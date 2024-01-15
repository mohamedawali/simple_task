import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/user_model.dart';
import '../../../cubit/user_cubit.dart';
import '../../user_details_page/user_details_page.dart';
import 'listView_item.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    BlocProvider.of<UserCubit>(context).getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      if (state is LoadingUsers) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is LoadedUsers) {
        List<UserModel> usersList = state.users;
        return ListView.builder(
            itemCount: usersList.length,
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UserDetailsPage(usersList[index])));
                      },
                      child: ListViewItem(usersList[index])),
                ));
      } else if (state is FailureState) {
       return Center(
          child: Text(
            state.failure,
            style: const TextStyle(color: Colors.deepOrange),
          ),
        );
      }
return const SizedBox();
    });
  }
}
