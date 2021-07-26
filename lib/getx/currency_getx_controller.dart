
import 'package:badgetplanner/Database/controllers/currency_db_controller.dart';
import 'package:badgetplanner/models/models/currency.dart';
import 'package:badgetplanner/preferences/user_preferences.dart';
import 'package:get/get.dart';

class CurrencyGetxController extends GetxController {
  RxList<Currency> currencies = <Currency>[].obs;

  CurrencyDbController dbController = CurrencyDbController();

  static CurrencyGetxController get to => Get.find();

  @override
  void onInit() {
  read();
  super.onInit();
  }

  @override
  void onClose() {
  currencies.clear();
  super.onClose();
  }
  Future read() async {
    currencies.value = await dbController.read();
  }
  void undoCheckedCurrency() {
    currencies.forEach((element) {
      element.checked = false;
    });
  }

  Future<void> deleteAllRows() async {
  await dbController.deleteAllRows();
  currencies.clear();
  update();
  }
  Currency? getSelectedCurrency() {
    int index = currencies.indexWhere((element) => element.checked);
    if(index != -1) return currencies[index];
    return null;
  }
  void changeCheckStatus(int index) {
    currencies.forEach((element) {
      element.checked = false;
      if (element.id == currencies[index].id) element.checked = true;
    });
    currencies.refresh();
  }
  Currency getCurrencyById({required int id, bool setSelected = false}){
    int index = currencies.indexWhere((element) => element.id == id);
    if(setSelected) currencies[index].checked = true;
    return currencies[index];
  }
  String getCurrencyName(int id){
  int index = currencies.indexWhere((element) => id == element.id);
  return SharedPrefController().languageCode == 'ar'? currencies[index].nameAr : currencies[index].nameEn;
  }
  }