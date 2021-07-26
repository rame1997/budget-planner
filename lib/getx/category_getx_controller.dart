
import 'package:badgetplanner/Database/controllers/category_db_controller.dart';
import 'package:badgetplanner/getx/users_getx_controller.dart';
import 'package:badgetplanner/models/models/category.dart';
import 'package:badgetplanner/utilities/enums.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

class CategoryGetxController extends GetxController {
  List<Category> category = <Category>[];
  CategoryDbController dbController = CategoryDbController();

  static CategoryGetxController get to => Get.find();

  @override
  void onInit() {
    readCategory();
    super.onInit();
  }

  @override
  void onClose() {
    category.clear();
    super.onClose();
  }

  Future<void> readCategory() async {
    category = await dbController.read();
    update();
  }

  Future<bool> createCategory(Category newCategory) async {
    int id = await dbController.create(newCategory);
    if (id != 0) {
      newCategory.id = id;
      category.add(newCategory);
      update();
      return true;
    }
    return false;
  }

  Future<bool> updateCategory(Category updatedCategory) async {
    bool updated = await dbController.update(updatedCategory);
    if (updated) {
      int index =
      category.indexWhere((element) => element.id == updatedCategory.id);
      if (index != -1) {
        category[index] = updatedCategory;
        update();
        return true;
      }
    }
    return false;
  }
  Future<bool> deleteUserCategories() async {
    bool deleted = await dbController.delete(UsersGetxController.to.user.id);
    if(deleted) category.clear();
    return deleted;
  }

  Category? getSelectedCategory() {
    int index = category.indexWhere((element) => element.checked);
    if (index != -1) return category[index];
    return null;
  }

  void undoCheckedCategory() {
    category.forEach((element) {
      element.checked = false;
    });
  }


  List<Category> getCategoriesByType({required CategoryType type}) {
    bool expenses = type == CategoryType.Expense;
    return category.where((element) => element.expense == expenses).toList();
  }

  Future<void> deleteAllRows() async {
    await dbController.deleteAllRows();
    category.clear();
  }
  String getCategoryName(int id){
    int index = category.indexWhere((element) => id == element.id);
    return category[index].name;
  }
  Category getCategoryById({required int id, bool setSelected = false}) {
    int index = category.indexWhere((element) => element.id == id);
    if (setSelected) category[index].checked = true;
    return category[index];
  }
}