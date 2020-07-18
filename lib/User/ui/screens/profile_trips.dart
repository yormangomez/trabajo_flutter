import 'package:flutter/material.dart';
import 'package:flutter_demos/User/bloc/bloc_user.dart';
import 'package:flutter_demos/User/model/user.dart';
import 'package:flutter_demos/User/ui/screens/profile_header.dart';
import 'package:flutter_demos/User/ui/widgets/profile_places_list.dart';
import 'package:flutter_demos/User/ui/widgets/profile_background.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ProfileTrips extends StatelessWidget {
  UserBloc userBloc;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch (snapshot.connectionState){
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.active:
            return showProfileData(snapshot);
          case ConnectionState.done:
            return showProfileData(snapshot);

          default:

        }
      },
    );



    /**/
  }

  Widget showProfileData(AsyncSnapshot snapshot){
    if(snapshot.hasData || snapshot.hasData){
      print("No logeado");
      return Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: <Widget>[
              Text("Usuario no logeado. Haz Login")
             // ProfileHeader(),//User datos
             // ProfilePlacesList()//User uid

            ],
          ),
        ],
      );
    }else{
      print("Logeado");
      var user = User(
        uid: snapshot.data.uid,
        name: snapshot.data.displayName,
        email: snapshot.data.email,
        photoURL: snapshot.data.photoUrl,
      );

      return Stack(
        children: <Widget>[
          ProfileBackground(),
              ListView(
                children: <Widget>[
                  ProfileHeader(user),//User datos
                  ProfilePlacesList(user)//User uid
                ],
              ),
            ],
      );
    }

  }

}