import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc_app/login/bloc/login_cubit.dart';
import 'package:my_bloc_app/widgets/widgets.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomAppPage(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  validator: (text) {
                    if ((text ?? '').isEmpty) {
                      return 'Username cannot be empty.';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text('Username'),
                  ),
                  onChanged: (text) =>
                      context.read<LoginCubit>().updateUsername(text),
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return TextFormField(
                      validator: (text) {
                        if ((text ?? '').isEmpty) {
                          return 'Password cannot be empty.';
                        }
                        return null;
                      },
                      obscureText: state.obscurePw,
                      decoration: InputDecoration(
                        label: const Text('Password'),
                        suffixIcon: IconButton(
                          onPressed: () =>
                              context.read<LoginCubit>().togglePwText(),
                          icon: Icon(
                            state.obscurePw
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      onChanged: (text) =>
                          context.read<LoginCubit>().updatePassword(text),
                    );
                  },
                ),
                const Spacer(),
                SafeArea(
                  child: BlocListener<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state.status == LoginStatus.complete) {
                        Navigator.of(context).pushNamed('/home');
                      }
                    },
                    child: BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () {
                            if (_loginFormKey.currentState!.validate() &&
                                state.status == LoginStatus.inProgress) {
                              context.read<LoginCubit>().submitForm();
                            }
                          },
                          child: state.status == LoginStatus.submitting
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    CupertinoActivityIndicator(),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Submitting')
                                  ],
                                )
                              : const Text('Login'),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
