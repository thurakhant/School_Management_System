import 'package:flutter/material.dart';
import 'package:school_management/module/widget.dart';
import 'package:school_management/screen/dashboard.dart';
import 'module/extension.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          width: context.width * 0.3 < 350 ? 400 : context.width * 0.3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              'Welcome To Bliss School'
                  .toLabel(bold: true, color: Colors.grey, fontsize: 22)
                  .padding9
                  .margin9,
              const Edit(
                hint: 'Username',
              ).margin9,
              const Edit(
                hint: 'Password',
                password: true,
              ).margin9,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Button(
                    title: 'Register',
                    onTap: () => print('clicked'),
                    color: Colors.green,
                    icon: const Icon(Icons.edit,size: 15,),
                  ).margin9,
                  Button(
                    title: 'Login',
                    onTap: () => context.showForm(const Dashboard()),
                    color: Colors.blue,
                    icon: const Icon(Icons.vpn_key),
                  ).margin9,
                  
                ],
              ),
            ],
          ),
        ).padding9.margin9.card.center,
      ),
    );
  }
}
