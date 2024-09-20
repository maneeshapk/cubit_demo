import 'package:cubit/register/register_cubit.dart';
import 'package:cubit/screens/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Registerpage extends StatelessWidget {
  const Registerpage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      body: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if(state is RegisterSuccess){
             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const Loginpage()));
          }
           else if (state is RegisterError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
            print(state.error);
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
                  BlocProvider.of<RegisterCubit>(context)
                      .registerUser(email.text.trim(), password.text.trim());
                },
                child: const Text("register"))
          ],
        ),
      ),
    );
  }
}
