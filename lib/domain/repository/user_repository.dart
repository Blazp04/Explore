import 'package:explore/_all.dart';

abstract class IUserRepository {
  Future<UserModel> getUserData();
}

class UserRepository implements IUserRepository {
  // final api = services.get<DioConfiguration>();
  @override
  Future<UserModel> getUserData() async {
    await Future.delayed(const Duration(seconds: 2));
    return UserModel(
      name: "Blaz",
      imageUrl: 'assets/images/blaz.jpg',
    );
  }
}
