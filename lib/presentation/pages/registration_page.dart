import 'package:binderbee/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../domain/repositories/auth_repository.dart';
import '../bloc/auth/auth_bloc.dart';
import 'main_page.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(context.read<AuthRepository>()),
      child: const RegistrationPageView(),
    );
  }
}

class RegistrationPageView extends StatefulWidget {
  const RegistrationPageView({Key? key}) : super(key: key);

  @override
  State<RegistrationPageView> createState() => _RegistrationPageViewState();
}

class _RegistrationPageViewState extends State<RegistrationPageView> {
  late AuthBloc _bloc;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _usernameController;
  late TextEditingController _confpasswordController;
  bool isPassFilled = false;
  bool isUserFilled = false;
  bool isConfPassFilled = false;
  bool isUsernameFilled = false;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<AuthBloc>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameController = TextEditingController();
    _confpasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 95,
                  height: 85,
                  child: SvgPicture.asset('assets/logo/logo.svg'),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 113,
                  height: 25,
                  child: SvgPicture.asset('assets/logo/oqysay.svg'),
                )
              ],
            ),
            Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 335,
                  child: TextField(
                    controller: _usernameController,
                    onChanged: (text) => setState(() {
                      if(text.isNotEmpty){
                        isUsernameFilled = true;
                      }else{
                        isUsernameFilled = false;
                      }
                    }),
                    decoration: InputDecoration(
                        hintText: 'Name Surname',
                        hintStyle: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF8B8B8B),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFF807F7F),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFF223263),
                            width: 2,
                          ),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFECE9E9),
                        contentPadding: const EdgeInsets.only(
                            left: 25.0, right: 5.0, top: 15.0, bottom: 15.0)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox
                  (
                  width: 335,
                  child: TextField(
                    controller: _emailController,
                    onChanged: (text) => setState(() {
                      if(text.isNotEmpty){
                        isUserFilled = true;
                      }else{
                        isUserFilled = false;
                      }
                    }),
                    decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF8B8B8B),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFF807F7F),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFF223263),
                            width: 2,
                          ),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFECE9E9),
                        contentPadding: const EdgeInsets.only(
                            left: 25.0, right: 5.0, top: 15.0, bottom: 15.0)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 335,
                  child: TextField(
                    controller: _passwordController,
                    onChanged: (text) => setState(() {
                      if(text.isNotEmpty){
                        isPassFilled = true;
                      }else{
                        isPassFilled = false;
                      }
                    }),
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF8B8B8B),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFF807F7F),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFF223263),
                            width: 2,
                          ),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFECE9E9),
                        contentPadding: const EdgeInsets.only(left: 25.0, right: 5.0, top: 15.0, bottom: 15.0)
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 335,
                  child: TextField(
                    controller: _confpasswordController,
                    onChanged: (text) => setState(() {
                      if(text.isNotEmpty){
                        isConfPassFilled = true;
                      }else{
                        isConfPassFilled = false;
                      }
                    }),
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Confirm password',
                        hintStyle: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF8B8B8B),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFF807F7F),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFF223263),
                            width: 2,
                          ),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFECE9E9),
                        contentPadding: const EdgeInsets.only(left: 25.0, right: 5.0, top: 15.0, bottom: 15.0)
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                BlocBuilder<AuthBloc, AuthState>(builder: _stateBuilder),
                BlocListener<AuthBloc, AuthState>(
                  listener: _stateListener,
                  child: Container(),
                ),
                const SizedBox(height: 10,),
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const MainPage(),
                      ));
                    },
                    child: const Text(
                      "Enter as Guest",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 16,
                          color: Color(0xFF223263),
                          fontWeight: FontWeight.w700
                      ),
                    )
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: SizedBox(
                width: 335,
                height: 47,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Sign in",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xFF223263)
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stateBuilder(BuildContext context, AuthState state) {
    return SizedBox(
      width: 335,
      height: 47,
      child: Container(
        decoration: BoxDecoration(
          color: (isPassFilled && isUserFilled && isConfPassFilled && isUsernameFilled) ?  const Color(0xFF223263) : const Color(0xFFC3C3C3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton(
          onPressed: (isPassFilled && isUserFilled && isConfPassFilled && isUsernameFilled)? () => _bloc.add(AuthRegistrationEvent(_emailController.text, _passwordController.text, _usernameController.text)) : null,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
            primary: Colors.transparent,
          ),
          child: (state.state == AuthStateType.isLoading) ?
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                    strokeWidth: 2.0,
                  )
              ),
            ],
          )    :
          const Text(
            "Create account" ,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void _stateListener(BuildContext context, AuthState state){
    switch(state.state){
      case AuthStateType.failure: {
        Fluttertoast.showToast(msg: "Error");
      }
      break;
      case AuthStateType.success: {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const MainPage(),
        ));
      }
      break;
    }
  }
}
