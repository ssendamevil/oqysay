import 'package:binderbee/data/datasources/box_helper.dart';
import 'package:binderbee/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth/auth_bloc.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Account",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          // if(state.state == AuthStateType.success){
            return Column(
              children: [
                Container(
                  height: 100,
                  decoration: const BoxDecoration(
                      color: Color(0xFFF0F0F0)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color(0xFFC38821)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset("assets/images/No-Image-Placeholder.png",
                              fit: BoxFit.cover,
                              width: 90,
                              height: 90,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${BoxHelper.getUserInfo()?.status} ${BoxHelper.getUserInfo()?.surname}',
                                style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              const Text(
                                "Edit Profile",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Montserrat",
                                    fontSize: 16,
                                    color: Color(0xFFA0A3BD)
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Color(0xFFF0F0F0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Row(
                        children: const [
                          Icon(Icons.all_inbox),
                          SizedBox(width: 50,),
                          Text("My Orders",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(width: 150,),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    )
                ),
                Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Color(0xFFF0F0F0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Row(
                        children: const [
                          Icon(Icons.all_inbox),
                          SizedBox(width: 50,),
                          Text("My Reviews",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(width: 135,),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    )
                ),
                Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Color(0xFFF0F0F0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Row(
                        children: const [
                          Icon(Icons.all_inbox),
                          SizedBox(width: 50,),
                          Text("Shipping Address",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(width: 80,),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    )
                ),
                Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Color(0xFFF0F0F0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Row(
                        children: const [
                          Icon(Icons.all_inbox),
                          SizedBox(width: 50,),
                          Text("Notifications",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(width: 125,),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    )
                ),
                const SizedBox(height: 30,),
                SizedBox(
                  width: 150,
                  height: 45,
                  child: OutlinedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthLogoutEvent());
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ));
                    },
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(width: 1, color: Colors.red),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero
                        )
                    ),
                    child: const Text(
                      "Logout",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                )
              ],
            );
        },
      )
    );
  }
}
