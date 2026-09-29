import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rivaan_project2/core/bloc/bloc_state.dart';
import 'package:rivaan_project2/core/common/entity/user_entity.dart';
import 'package:rivaan_project2/features/auth/presintation/pages/signup_page.dart';
import 'package:rivaan_project2/features/blog/presintation/page/blog_page.dart';
import '../../../../core/theme/app_pallete.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Widget _logInForm(BuildContext context) {
    return Padding(padding: EdgeInsetsGeometry.all(12),
        child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign In",
                style: TextStyle(fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: AppPallete.gradient2),),
              const SizedBox(height: 30,),
              AuthField(
                  hintText: "Email", controller: emailController),
              const SizedBox(height: 15,),
              AuthField(hintText: "Password",
                  controller: passwordController),
              const SizedBox(height: 25,),
              AuthButton(onPressed: () {
                if(_formKey.currentState!.validate()) {
                  context.read<AuthBloc>().add(AuthLogInEvent(
                  email: emailController.text,
                  password: passwordController.text,
                ));
                }
              },
                text: "Sign IN",
                color1: AppPallete.gradient2,
                color2: AppPallete.gradient3,),
              const SizedBox(height: 15,),
              GestureDetector(onTap: () =>
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => SignUpPage(),)),
                child: RichText(text: TextSpan(
                    text: 'Don\'t have an account? ', style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium,
                    children: [
                      TextSpan(text: 'Sign Up', style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                        color: AppPallete.gradient2,
                      ))
                    ]
                )),
              )
            ],
          ),
        )
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
        body: BlocConsumer<AuthBloc, BlocState<UserEntity>>(
          builder: (context, state) {
            return state.when(initial: () {
              return _logInForm(context);
            }, loading: () {
              return Center(child: CircularProgressIndicator(),);
            }, success: (data) {
              return _logInForm(context);
            }, error: (error) {
              return _logInForm(context);
            }, successDisplay: (List<UserEntity> data) {
              return SizedBox();
            },);
          },

          listener: (context, state) {
            state.whenOrNull(
              error: (error) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
                Text(error.trim())));
              }, success: (data) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
              Text('welcome ${data.name}')));
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return BlogPage();
              },));
            },);
          },));
  }
}
