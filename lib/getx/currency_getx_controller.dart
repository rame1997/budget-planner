
import 'package:badgetplanner/Database/controllers/currency_db_controller.dart';
import 'package:badgetplanner/models/models/currency.dart';
import 'package:badgetplanner/preferences/user_preferences.dart';
import 'package:get/get.dart';

class CurrencyGetxController extends GetxController {
  List<Currency> currencies = [];
  CurrencyDbController dbController = CurrencyDbController();

  static CurrencyGetxController get to => Get.find();

  @override
  void onInit() {
  readCurrencies();
  super.onInit();
  }

  @override
  void onClose() {
  currencies.clear();
  super.onClose();
  }

  Future<void> readCurrencies() async {
  currencies = await dbController.read();
  update();
  }


  Future<void> deleteAllRows() async {
  await dbController.deleteAllRows();
  currencies.clear();
  update();
  }

  String getCurrencyName(int id){
  int index = currencies.indexWhere((element) => id == element.id);
  return SharedPrefController().languageCode == 'ar'? currencies[index].nameAr : currencies[index].nameEn;
  }
  }