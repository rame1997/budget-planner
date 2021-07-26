
import 'package:badgetplanner/Database/controllers/actions_db_controller.dart';
import 'package:badgetplanner/getx/category_getx_controller.dart';
import 'package:badgetplanner/getx/currency_getx_controller.dart';
import 'package:badgetplanner/getx/users_getx_controller.dart';
import 'package:badgetplanner/models/models/actions.dart';
import 'package:badgetplanner/models/models/currency.dart';
import 'package:badgetplanner/models/models/user.dart';
import 'package:badgetplanner/utilities/enums.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ActionGetxController extends GetxController {
  RxList<ActionClass> actions = <ActionClass>[].obs;
  ActionDbController _dbController = ActionDbController();

  late Currency userCurrency;
  RxDouble totalExpenses = 0.0.obs;
  RxDouble totalIncomes = 0.0.obs;

  static ActionGetxController get to => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    read();
    super.onInit();
  }

  Future<void> read() async {
    actions.value = await _dbController.read();
    actions.forEach((element) {
      setActionCategoryAndCurrency(element);
    });
    calculateTotalIncomesAndExpenses();
  }

  void setActionCategoryAndCurrency(ActionClass element) {
    element.category =
        CategoryGetxController.to.getCategoryById(id: element.categoryId);
    element.currency =
        CurrencyGetxController.to.getCurrencyById(id: element.currencyId);
  }

  Future<bool> create({required ActionClass action}) async {
    getUserCurrency();
    int newId = await _dbController.create(action);
    if (newId != 0) {
      action.id = newId;
      actions.add(action);
      setActionCategoryAndCurrency(action);
      updateIncomeAndExpenses(action);
      return true;
    }
    return false;
  }

  void calculateTotalIncomesAndExpenses() {
    if (actions.isNotEmpty) {
      var format = DateFormat('yyyy-MM-dd');
      var today = format.format(DateTime.now());

      getUserCurrency();
      actions.forEach((element) {
        if (element.date == DateTime.parse(today))
          updateIncomeAndExpenses(element);
      });
    }
  }

  void updateIncomeAndExpenses(ActionClass action) {
    var amount = _convertCurrency(
        amount: action.amount, actionCurrencyId: action.currencyId);
    action.expense
        ? totalExpenses.value += amount
        : totalIncomes.value += amount;
  }

  void getUserCurrency() {
    User user = UsersGetxController.to.user;
    userCurrency =
        CurrencyGetxController.to.getCurrencyById(id: user.currencyId);
  }

  Future<bool> deleteUserActions() async {
    bool deleted =
    await _dbController.delete(UsersGetxController.to.user.id);
    if (deleted) {
      totalExpenses.value = 0;
      totalIncomes.value = 0;
      actions.clear();
    }
    return deleted;
  }

  double _convertCurrency(
      {required double amount, required int actionCurrencyId}) {
    if (userCurrency.id == Currencies.Nis.index + 1) {
      if (actionCurrencyId == Currencies.Nis.index + 1) {
        return amount;
      } else if (actionCurrencyId == Currencies.Dollar.index + 1) {
        //from DOLLAR -> NIS
        print('from DOLLAR -> NIS');
        return amount * 3.2;
      } else if (actionCurrencyId == Currencies.Dinar.index + 1) {
        //from DINAR -> NIS
        print('from DINAR -> NIS');
        return amount * 4.6;
      }
    } else if (userCurrency.id == Currencies.Dollar.index + 1) {
      if (actionCurrencyId == Currencies.Nis.index + 1) {
        //from NIS -> DOLLAR
        print('from NIS -> DOLLAR');
        return amount / 3.2;
      } else if (actionCurrencyId == Currencies.Dollar.index + 1) {
        return amount;
      } else if (actionCurrencyId == Currencies.Dinar.index + 1) {
        //from DINAR -> DOLLAR
        print('from DINAR -> DOLLAR');
        return amount * .7;
      }
    } else if (userCurrency.id == Currencies.Dinar.index + 1) {
      if (actionCurrencyId == Currencies.Nis.index + 1) {
        //from NIS -> DINAR
        print('from NIS -> DINAR');
        return amount / 4.6;
      } else if (actionCurrencyId == Currencies.Dollar.index + 1) {
        //from DOLLAR -> DINAR
        print('from DOLLAR -> DINAR');
        return amount / .7;
      } else if (actionCurrencyId == Currencies.Dinar.index + 1) {
        return amount;
      }
    }
    return 0;
  }
  List<ActionClass> getTheLastActions() {
    List<ActionClass> lastOperations = [];
    for (int i = 0; i < actions.length; i++) {
      if (i == 4)
        break;
      else
        lastOperations.add(actions.elementAt(i));
    }
    return lastOperations;
  }

}