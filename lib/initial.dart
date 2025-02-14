import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:presence_app/modules/home/presentation/home_view.dart';
// import 'package:presence_app/modules/routes/app_routes.gr.dart';

@RoutePage()
class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    if (!isLogin) {
      Future.delayed(const Duration(seconds: 3), () {
        context.router.replaceNamed('/home');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Please wait"),
      ),
    );
  }
}
