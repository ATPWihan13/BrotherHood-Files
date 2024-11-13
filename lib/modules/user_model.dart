import 'package:brotherhood/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel{
  String userID;
  String name;
  String phoneNumber;
  String image;
  String token;
  String aboutMe;
  String lastSeen;
  String dateCreated;
  bool isOnline;
  List<String> brothersUIDs;
  List<String> brotherRequest;
  List<String> blockedUIDs;

  UserModel({
    required this.userID,
    required this.name,
    required this.phoneNumber,
    required this.image,
    required this.token,
    required this.aboutMe,
    required this.lastSeen,
    required this.dateCreated,
    required this.isOnline,
    required this.brothersUIDs,
    required this.brotherRequest,
    required this.blockedUIDs,
  });

  // fromMap
  factory UserModel.fromMap(Map<String, dynamic> map){
    return UserModel(
        userID: map[Constants.userID] ?? '',
        name: map[Constants.name] ?? '',
        phoneNumber: map[Constants.phoneNumber] ?? '',
        image: map[Constants.image] ?? '',
        token: map[Constants.token] ?? '',
        aboutMe: map[Constants.aboutMe] ?? '',
        lastSeen: map[Constants.lastSeen] ?? '',
        dateCreated: map[Constants.dateCreated] ?? '',
        isOnline: map[Constants.isOnline] ?? false,
        brothersUIDs: List<String>.from(map[Constants.brothersUIDs] ?? []),
        brotherRequest: List<String>.from(map[Constants.brotherRequest] ?? []),
        blockedUIDs: List<String>.from(map[Constants.blockedUIDs] ?? [])
    );
  }

  // to map
  Map<String, dynamic> toMap(){
    return{
      Constants.userID: userID,
      Constants.name: name,
      Constants.phoneNumber: phoneNumber,
      Constants.image: image,
      Constants.token: token,
      Constants.aboutMe: aboutMe,
      Constants.lastSeen: lastSeen,
      Constants.dateCreated: dateCreated,
      Constants.isOnline: isOnline,
      Constants.brothersUIDs: blockedUIDs,
      Constants.brotherRequest: brotherRequest,
      Constants.blockedUIDs: blockedUIDs,

    };
  }
}