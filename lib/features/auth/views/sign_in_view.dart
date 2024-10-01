import 'package:flutter/material.dart';
import 'package:task_next_x/app/utils/size_config.dart';
import 'package:task_next_x/app/widgets/background_widget.dart';
import 'package:task_next_x/features/auth/widgets/auth_footer_widget.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.screenWidth! * 0.06),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.screenHeight! * 0.12),
                    Text("Get Started With",
                        style: Theme.of(context).textTheme.titleLarge),
                    SizedBox(height: SizeConfig.screenHeight! * 0.03),
                    TextFormField(
                      controller: _emailTEController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.email_outlined)),
                      validator: (String? value) {
                        /// Handle email validation
                      },
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.01),
                    TextFormField(
                      controller: _passwordTEController,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _isPasswordVisible = !_isPasswordVisible;
                            setState(() {});
                          },
                          icon: Icon(_isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                      validator: (String? value) {
                        /// Handle password validation
                      },
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.02),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          /// Proceed with SignIn logic
                        }
                      },
                      child: const Icon(Icons.arrow_circle_right_outlined),
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.04),
                    _signInFooter(context)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _signInFooter(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            /// Handle Forget Password
          },
          child: const Text("Forgot Password?"),
        ),
        AuthFooterWidget(
          promptText: 'Don\' have an account?',
          actionText: 'SignUp',
          onTap: () {
            /// Handle Sign Up Navigation
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
