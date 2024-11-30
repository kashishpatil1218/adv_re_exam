import 'package:adv_re_exam/provider/Home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class home_page extends StatelessWidget {
  const home_page({super.key});

  Widget build(BuildContext context) {
    ProductProvider productProviderTrue =
        Provider.of<ProductProvider>(context, listen: true);
    ProductProvider productProviderFalse =
        Provider.of<ProductProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ProductProvider>(context, listen: false).Button();
              },
              icon: Icon(Icons.grid_view,color: Colors.white,))
        ],
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue.shade800,
        title: Text(
          'Home Page',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<ProductProvider>(context).fromList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return (productProviderTrue.isList)
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: productProviderFalse.productList.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: GestureDetector(
                          onDoubleTap: () {
                            selIndex = index;
                            Navigator.of(context).pushNamed('/detail');
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 180,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          offset: Offset(0, 2))
                                    ],
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: NetworkImage(productProviderFalse
                                          .productList[index].image
                                          .toString()),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 130),
                                        child: Container(
                                          height: 50,
                                          width: 200,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Text(
                                                  "Price : ${productProviderFalse.productList[index].price.toString()}",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Text(
                                                  productProviderFalse
                                                      .productList[index]
                                                      .category
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: productProviderFalse.productList.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: GestureDetector(
                          onDoubleTap: () {
                            selIndex = index;
                            Navigator.of(context).pushNamed('/detail');
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 180,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          offset: Offset(0, 2))
                                    ],
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: NetworkImage(productProviderFalse
                                          .productList[index].image
                                          .toString()),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 130),
                                        child: Container(
                                          height: 50,
                                          width: 200,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Text(
                                                  "Price : ${productProviderFalse.productList[index].price.toString()}",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Text(
                                                  productProviderFalse
                                                      .productList[index]
                                                      .category
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
          } else {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.blue,
            ));
          }
        },
      ),
    );
  }
}

int selIndex = 0;
