import 'dart:convert';


import 'package:google_maps/core/utilis/shared_prefrences.dart';

import '../../login_view/data/models/user_model.dart';
import '../../login_view/domain/entities/user_entity.dart';
import 'constants.dart';

addUserDataLocally(UserEntity userEntity) {
  var jsonString=jsonEncode(UserModel.fromEntity(userEntity).toJson());
  SharedPreferencesSingelton.setString(kSaveUserLocally, jsonString);
}

UserEntity getUserDataLocally() {
  var jsonString=SharedPreferencesSingelton.getString(kSaveUserLocally);
  UserEntity userEntity=(UserModel.fromJson(jsonDecode(jsonString))).toEntity();
  return userEntity;

}




