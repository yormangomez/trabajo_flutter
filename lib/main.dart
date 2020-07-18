import 'dart:async';
import "package:flutter_demos/User/bloc/bloc_user.dart";
import 'package:flutter_demos/User/ui/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'platzi_trips.dart';
import 'platzi_trips_cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        // home: PlatziTripsCupertino,
        home: SignInScreen(),
      ),
      bloc: UserBloc(),
    );
  }
}
