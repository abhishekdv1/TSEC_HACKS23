import 'package:barter_app/constants.dart';
import 'package:barter_app/models/product_display_model.dart';
import 'package:barter_app/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyProducts extends StatefulWidget {
  const MyProducts({Key? key}) : super(key: key);

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  User user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text(
          'My Products',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder(
          stream: database.ref('products').child('${user.uid}').onValue,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            List<ProductDisplayModel> _myDataList = [];
            if (snapshot.hasData) {
              final myProductData = Map<dynamic, dynamic>.from(
                  (snapshot.data! as DatabaseEvent).snapshot.value
                      as Map<dynamic, dynamic>);
              myProductData.forEach((key, value) {
                final currentProductData = Map<String, dynamic>.from(value);
                _myDataList.add(ProductDisplayModel(
                    imagePath: 'assets/images/phone.jpg',
                    productTitle: currentProductData['productTitle'],
                    productDescription:
                        currentProductData['productDescription'],
                    exchangeProductDescription:
                        currentProductData['exchangeProductDescription'],
                    tag: currentProductData['tag'],
                    views: currentProductData['views'] as int,
                    priceWhenBought:
                        currentProductData['priceWhenBought'] as int,
                    numYearsSinceBought:
                        currentProductData['numYearsSinceBought'] as int));
              });
              return ListView.builder(
                itemCount: _myDataList.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: cardColor,
                        context: context,
                        builder: (context) {
                          return ListView(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 200.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              '${_myDataList[index].imagePath}'),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Colors.black)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Product name:  ${_myDataList[index].productTitle}',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Colors.black)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'tag:  ${_myDataList[index].tag}',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Colors.black)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Price when bought: Rs. ${_myDataList[index].priceWhenBought}',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Colors.black)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Number of years elapsed since purchase:  ${_myDataList[index].numYearsSinceBought}',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Product description",
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Builder(builder: (context) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        _myDataList[index].productDescription,
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              const Center(
                                child: Text(
                                  "What I Want in exchange",
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Colors.black)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      _myDataList[index]
                                          .exchangeProductDescription,
                                      textAlign: TextAlign.justify,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 90,
                              ),
                              Row(
                                children: [],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cancel"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("Intreseted?"),
                                  ),
                                ],
                              )
                            ],
                          );
                        },
                      );
                    },
                    child: Card(
                      color: cardColor,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Column(
                        children: [
                          Column(
                            children: <Widget>[
                              Text(_myDataList[index].productTitle,
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                              Container(
                                width: double.infinity,
                                height: 200.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            '${_myDataList[index].imagePath}'),
                                        fit: BoxFit.fill)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text(
                  'You have no items',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            }
          }),
    );
  }
}
