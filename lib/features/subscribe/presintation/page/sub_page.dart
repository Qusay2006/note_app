import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rivaan_project2/features/subscribe/data/repo/sub_repo.dart';
import 'package:rivaan_project2/features/subscribe/presintation/cubit/sub_cubit.dart';
import '../cubit/sub_state.dart';

class SubscribeProvider extends StatelessWidget {
  const SubscribeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => SubscribeCubit(SubRepoImpl()),
      child: const SubscribePage(),);
  }
}



class SubscribePage extends StatelessWidget {
  const SubscribePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SubscribeCubit,SubscribeState>(builder: (context, state) {
        return ElevatedButton(onPressed: () {
          context.read<SubscribeCubit>().toggleChange();
        },style: ElevatedButton.styleFrom(
            backgroundColor: state.isSubscribed?Colors.green:Colors.red),
            child: state.isSubscribed? const Text('Subed'):const Text('Subscribe'));
      },
          listenWhen: (previous, current) => current.error!=null,
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                content: Text(state.error)));
          }
      ),);
  }
}
