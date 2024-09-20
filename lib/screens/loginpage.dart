import 'package:cubit/login/login_cubit.dart';
import 'package:cubit/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if(state is LoginSuccess){
             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const Homepage()));
          }
           else if (state is LoginError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
               controller: email,
              decoration: const InputDecoration(hintText: "email"),
            ),
            TextFormField(
              controller: password,
              decoration: const InputDecoration(hintText: "password"),
            ),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<LoginCubit>(context)
                      .loginUser(email.text.trim(), password.text.trim());
                },
                child: const Text("login"))
          ],
        ),
      ),
    );
  }
}
