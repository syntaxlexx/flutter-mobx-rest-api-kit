import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

import '../../data/store/auth_store.dart';
import '../../di/locator.dart';
import '../../utils/helpers.dart';
import '../widgets/spacers.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const route = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController usernameCtr, passwordCtr;
  final _formKey = GlobalKey<FormState>();
  final _store = getIt.get<AuthStore>();
  bool showPassword = false;

  @override
  void initState() {
    super.initState();

    usernameCtr = TextEditingController();
    passwordCtr = TextEditingController();
  }

  void togglePassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  void dispose() {
    usernameCtr.dispose();
    passwordCtr.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Observer(builder: (context) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    spacer(),
                    SizedBox(
                      height: 220,
                      child: Lottie.asset('assets/lottie/login.json'),
                    ),
                    spacer(),
                    TextFormField(
                      controller: usernameCtr,
                      onSaved: (value) {
                        // controller.loginRequest.username = value;
                      },
                      validator: (value) => validateRequiredField(value),
                      decoration: inputDecoration('Username', Icons.person),
                    ),
                    spacer(forInput: true),
                    TextFormField(
                      obscureText: !showPassword,
                      validator: (value) => validateRequiredField(value),
                      controller: passwordCtr,
                      onSaved: (value) {
                        // controller.loginRequest.password = value;
                      },
                      decoration: inputDecoration(
                        'Password',
                        Icons.lock,
                        onIconClicked: togglePassword,
                      ),
                    ),
                    spacer(),
                    errorMessage(context, error: _store.errorMessage),
                    spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            _store.login(usernameCtr.text, passwordCtr.text);
                          }
                        },
                        child: _store.isLoading
                            ? const Text('Authenticating...')
                            : const Text('Login'),
                      ),
                    ),
                    spacer(),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
