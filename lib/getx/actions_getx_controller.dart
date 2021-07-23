
import 'package:badgetplanner/Database/controllers/actions_db_controller.dart';
import 'package:badgetplanner/models/models/actions.dart';
import 'package:get/get.dart';

class ActionsGetxController extends GetxController {
  List<ActionClass> action = <ActionClass>[];
  ActionDbController dbController = ActionDbController();

  static ActionsGetxController get to => Get.find();

  @override
  void onInit() {
    readOperation();
    super.onInit();
  }

  @override
  void onClose() {
    action.clear();
    super.onClose();
  }

  Future<void> readOperation() async {
    action = await dbController.read();
    update();
  }

  Future<bool> createOperation(ActionClass newOperation) async {
    int id = await dbController.create(newOperation);
    if (id != 0) {
      newOperation.id = id;
      action.add(newOperation);
      update();
      return true;
    }
    return false;
  }

  Future<void> deleteAllRows() async {
    await dbController.deleteAllRows();
    action.clear();
  }

  List<ActionClass> getTheLastActions() {
    List<ActionClass> lastOperations = [];
    for (int i = 0; i < action.length; i++) {
      if (i == 4)
        break;
      else
        lastOperations.add(action.elementAt(i));
    }
    return lastOperations;
  }

}