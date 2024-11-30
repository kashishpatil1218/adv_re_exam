

import 'package:flutter/cupertino.dart';


import '../views/detail_page.dart';

class CartProvider extends ChangeNotifier{
  dynamic price=0;
  int quantity = 1;

  void addData(int index)
  {

    Qty[index]++;
    notifyListeners();
  }
  void removeData(int index)
  {
    if(Qty[index]>0)
    {
      Qty[index]--;
      notifyListeners();
    }
  }
  void RemoveDataAll(int index)
  {
    price -= cartList[index].price;
    cartList.removeAt(index);
    Qty[index] = 1;
    notifyListeners();
  }

}
