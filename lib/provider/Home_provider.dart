import 'package:adv_re_exam/modal/home_modal.dart';
import 'package:adv_re_exam/views/detail_page.dart';
import 'package:flutter/widgets.dart';

import '../api_helper/api_helper.dart';

class ProductProvider extends ChangeNotifier {
  bool isList = false;

  void Button() {
    isList = !isList;
    notifyListeners();
  }

  double ans=0;
  void total(){
    for(int i=0; i<cartList.length; i++)
      {
        ans+=cartList[i].price;
      }
    notifyListeners();
  }

  ProductApi proHelper = ProductApi();

  List<ProductModal> productList = [];
  List<String> add = [];

  Future<List<ProductModal?>> fromList() async {
    List prod = await proHelper.fetchData();
    productList = prod.map((e) => ProductModal.fromJson(e)).toList();
    return productList;
  }

  ProductProvider() {
    fromList();
  }

// Future<void> fromS() async {
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   sharedPreferences.setStringList("product", add);
//   notifyListeners();
// }
//
// Future<void> fromG() async {
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   add = sharedPreferences.getStringList("product") ?? [];
//   notifyListeners();
// }
}
