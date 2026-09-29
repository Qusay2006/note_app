import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rivaan_project2/core/common/entity/user_entity.dart';
import 'package:rivaan_project2/features/auth/presintation/bloc/auth_bloc.dart';
import 'package:rivaan_project2/features/auth/presintation/bloc/auth_event.dart';
import '../../../../core/bloc/bloc_state.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/theme/app_pallete.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_field.dart';
import 'login_page.dart';

class SignUpProvider extends StatelessWidget {
  const SignUpProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => getIt<AuthBloc>() ,
      child: SignUpPage(),);
  }
}
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Widget _signUpForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Sing Up', style: TextStyle(fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: AppPallete.gradient1),),
              const SizedBox(height: 30,),
              AuthField(hintText: "Name",
                controller: nameController,),
              const SizedBox(height: 15,),
              AuthField(hintText: "Email",
                controller: emailController,),
              const SizedBox(height: 20,),
              AuthField(hintText: "Password",
                controller: passwordController,
                isPassword: true,),
              const SizedBox(height: 25,),
              AuthButton(onPressed: () {
                if (formKey.currentState!.validate()) {
                  print('THE NAME IS: [${nameController.text}]');
                  context.read<AuthBloc>().add(
                      AuthSingUpEvent(name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text));
                }
              },
                text: 'Sign Up',
                color1: AppPallete.gradient1,
                color2: AppPallete.gradient2,),
              const SizedBox(height: 15,),
              GestureDetector(onTap: () =>
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => LoginPage(),)),
                child: RichText(text: TextSpan(
                    text: "Already have an account? ", style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium,
                    children: [
                      TextSpan(text: 'Sign In', style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                          color: AppPallete.gradient1,
                          fontWeight: FontWeight.bold
                      ))
                    ]
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
      body: BlocConsumer<AuthBloc, BlocState<UserEntity>>(
        listener: (context, state) {
          state.whenOrNull(
            error: (error) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
              Text(error.trim())));
            },
            success: (data) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
              Text('welcome ${data.name}')));
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LoginPage();
              },));
            },
          );
        },

        builder: (context, state) {
          return state.when(
            initial: () {
            return _signUpForm(context);
          },
            loading: () {
              return Center(child: CircularProgressIndicator(),);
            }, success: (data) {
            return _signUpForm(context);
            }, error: (error) {
              return _signUpForm(context);
            },
            successDisplay: (data) {
              return SizedBox();
            },
          );
        },
      ),);
  }
}


