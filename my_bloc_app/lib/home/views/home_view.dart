import 'package:flutter/material.dart';
import 'package:my_bloc_app/widgets/custom_app_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppPage(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Center(
          child: Column(
            children: const [
              Text('Username: '),
              Text('Password: '),
            ],
          ),
        ),
      ),
    );
  }
}
