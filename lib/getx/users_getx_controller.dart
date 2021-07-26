import 'package:badgetplanner/Database/controllers/user_db_controller.dart';
import 'package:badgetplanner/getx/actions_getx_controller.dart';
import 'package:badgetplanner/getx/category_getx_controller.dart';
import 'package:badgetplanner/models/models/user.dart';
import 'package:badgetplanner/preferences/user_preferences.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';

class UsersGetxController extends GetxController {

  UserDbController _userDbController = UserDbController();

  static UsersGetxController get to => Get.find();
  bool isLoggedIn = false;
  late User user;

  @override
  void onInit() {
    if (SharedPrefController().loggedIn) user = SharedPrefController().getUser();
    super.onInit();
  }
  Future<bool> login({required String email, required String pin}) async {
    User? user = await _userDbController.login(email: email, pin: pin);
    if(user != null){
      await SharedPrefController().save(user);
      this.user = user;
      return true;
    }
    return false;
  }


  Future<bool> createAccount({required User user}) async {
    var newUserId = await _userDbController.create(user);
    if(newUserId != 0){
      user.id = newUserId;
      await SharedPrefController().save(user);
      this.user = user;
      return true;
    }
    return false;
  }
  Future<bool> removeUserAccount() async {
    return await _userDbController.delete(
         UsersGetxController.to.user.id);
  }

  Future<bool> clearAccountData() async {
    return await ActionGetxController.to.deleteUserActions() &&
        await CategoryGetxController.to.deleteUserCategories();
  }

  Future<bool> removeAccount() async {
    return await ActionGetxController.to.deleteUserActions() &&
        await CategoryGetxController.to.deleteUserCategories() &&
        await UsersGetxController.to.removeUserAccount() &&
        await SharedPrefController().logout();
  }
}