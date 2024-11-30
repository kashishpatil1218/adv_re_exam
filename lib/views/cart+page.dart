import 'package:adv_re_exam/provider/Home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart_page_provider.dart';
import 'detail_page.dart';

class cartPage extends StatelessWidget {
  const cartPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProviderT = Provider.of(context, listen: true);
    CartProvider cartProviderF = Provider.of(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text(
          'Cart Page',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ...List.generate(
              cartList.length,
              (index) {
                return Card(
                  elevation: 8,
                  color: Colors.grey.shade200,
                  child: ListTile(
                    leading: Image.network(cartList[index].image),
                    title: Text(
                      cartList[index].category,
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      cartList[index].price.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          cartProviderF.RemoveDataAll(index);
                        },
                        icon: Icon(Icons.delete)),
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.blue.shade800,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              Provider.of<ProductProvider>(context, listen: true)
                  .ans
                  .toString(),
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
