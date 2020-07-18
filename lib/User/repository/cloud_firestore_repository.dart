import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_demos/Place/model/place.dart';
import 'package:flutter_demos/Place/ui/widgets/card_image.dart';
import 'package:flutter_demos/User/model/user.dart';
import 'package:flutter_demos/User/repository/cloud_firestore_api.dart';
import 'package:flutter_demos/User/ui/widgets/profile_place.dart';

class CloudFirestoreRepository {

  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);
  Future<void> updatePlaceData(Place place) => _cloudFirestoreAPI.updatePlaceData(place);

  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreAPI.buildMyPlaces(placesListSnapshot);
  //List<CardImageWithFabIcon> buildPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreAPI.buildPlaces(placesListSnapshot);
  List<Place> buildPlaces(List<DocumentSnapshot> placesListSnapshot, User user) => _cloudFirestoreAPI.buildPlaces(placesListSnapshot, user);

  Future likePlace(Place place, String uid) => _cloudFirestoreAPI.likePlace(place,uid);
  
}