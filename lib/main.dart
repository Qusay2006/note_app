import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rivaan_project2/core/common/cubit/app_user_cubit.dart';
import 'package:rivaan_project2/core/common/cubit/app_user_state.dart';
import 'package:rivaan_project2/core/secrets/app_secrets.dart';
import 'package:rivaan_project2/features/auth/presintation/bloc/auth_bloc.dart';
import 'package:rivaan_project2/features/auth/presintation/bloc/auth_event.dart';
import 'package:rivaan_project2/features/auth/presintation/pages/login_page.dart';
import 'package:rivaan_project2/features/blog/presintation/bloc/blog_bloc.dart';
import 'package:rivaan_project2/features/blog/presintation/page/blog_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/injection/injection.dart';
import 'core/theme/app_theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Supabase.initialize(url: AppSecrets.supbabaseUrl,
     publishableKey: AppSecrets.supbabaseAnnonKey);
  await Hive.initFlutter();
  await Hive.openBox('blogs');
  configureDependencies();
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    context.read<AuthBloc>().add(AuthCurrentUserEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.darkThemeMode,
      home: BlocSelector<AppUserCubit,AppUserState,bool>(selector:
          (state) => state.when(initial: () => false,
                loggedIn: (user) => true,),
          builder: (context, isLoggedIn) {
        if(isLoggedIn){
          return const BlogProvider();
        }
        else{
          return const LoginProvider();
        }
      }));
  }
}