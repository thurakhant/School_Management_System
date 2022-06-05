import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management/Bloc/bloc_state.dart';
import 'package:school_management/Bloc/user_bloc.dart';
import 'package:provider/provider.dart';
import 'module/widget.dart';
import 'screen/dashboard.dart';
import 'module/extension.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(create: (_) => UserBloc()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocBuilder<UserBloc, BlocState>(
        builder: (context, state) {
          if (state is Aunthenticated) return const Dashboard();
          return Login(state: state);
        },
      ),
    );
  }
}

class Login extends StatelessWidget {
  final BlocState state;
  const Login({
    required this.state,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _mobile = TextEditingController();
    TextEditingController _pass = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SizedBox(
          width: context.width * 0.3 < 350 ? 350 : context.width * 0.3,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                'Welcome To Bliss School'
                    .toLabel(bold: true, color: Colors.grey, fontsize: 22)
                    .padding9
                    .margin9,
                Edit(
                  hint: 'Username',
                  controller: _mobile,
                  notempty: true,
                ).margin9,
                Edit(
                        hint: 'Password',
                        password: true,
                        controller: _pass,
                        notempty: true)
                    .margin9,
                AbsorbPointer(
                  absorbing: state is Loading,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Button(
                        title: 'Register',
                        onTap: () => print('clicked'),
                        color: Colors.green,
                        icon: const Icon(Icons.edit, size: 15),
                      ).margin9,
                      state is Loading
                          ? const CupertinoActivityIndicator()
                          : Container(),
                      Button(
                        title: 'Login',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            return context
                                .read<UserBloc>()
                                .authenticate(_mobile.text, _pass.text);
                          }
                        },
                        color: Colors.blue,
                        icon: const Icon(Icons.vpn_key, size: 15),
                      ).margin9,
                    ],
                  ),
                ),
                state is Failed
                    ? Container(
                        margin: const EdgeInsets.all(25),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12)),
                        child: (state as Failed).exception.toString().toLabel(
                              color: Colors.white,
                              bold: true,
                            ))
                    : Container(),
              ],
            ),
          ),
        ).padding9.margin9.card.center,
      ),
    );
  }
}
