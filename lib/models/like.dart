import 'User.dart';

class Like {
  late User user;
  late LikeType likeType;
}

enum LikeType { like, love, haha, wow, angry, sad }
