import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/Home_provider.dart';
import 'Home_page.dart';

class detailPage extends StatelessWidget {
  const detailPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductProvider productProviderTrue =
        Provider.of<ProductProvider>(context, listen: true);
    ProductProvider productProviderFalse =
        Provider.of<ProductProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(

        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue.shade800,
        title: Text(
          'Details Page',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<ProductProvider>(context).fromList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade800,
                          image: DecorationImage(
                              image: NetworkImage(productProviderFalse
                                  .productList[selIndex].image),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 500,
                      width: 600,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomLeft: Radius.circular(50))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:170),
                                child: Text(
                                  productProviderFalse
                                      .productList[selIndex].category,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 22),
                                ),
                              ),
                              SizedBox(
                                height:10,
                              ),
                              Text(
                                  productProviderFalse
                                      .productList[selIndex].title,
                                  style: TextStyle(
                                      color: Colors.grey.shade200, fontSize: 15)),
                              SizedBox(
                                height:20,
                              ),
                              Container(

                                child: Text(
                                  productProviderFalse
                                      .productList[selIndex].description,
                                  style: TextStyle(
                                      color: Colors.grey.shade200, fontSize:18),
                                ),
                              ),
                              SizedBox(
                                height: 160,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onDoubleTap: () {
                                    cartList.add(productProviderFalse
                                        .productList[selIndex]);
                                    for (int i = 0; i < productProviderFalse.productList.length; i++) {
                                      Qty.add(1);
                                    }
                                    Navigator.of(context).pushNamed('/cart');
                                    productProviderFalse.total();
                                  },
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    height: 50,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(child: Text('ADD TO CART',style: TextStyle(fontWeight: FontWeight.bold),)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

List cartList = [];
List<int> Qty = [];
