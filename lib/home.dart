import 'package:barter_app/constants.dart';
import 'package:barter_app/models/product_display_model.dart';
import 'package:flutter/material.dart';
import 'utils.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              final productNameController = TextEditingController();
              final productDescriptionController = TextEditingController();
              final inExchangeProductController = TextEditingController();
              final yearsElapsedWhenBoughtController = TextEditingController();
              final priceWhenBoughtController = TextEditingController();
              final productTypeController = TextEditingController();
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SingleChildScrollView(
                    child: Container(
                      child: Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Color(0xffd9acf5), width: 1.0)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Color(0xffd9acf5), width: 1.0)),
                            label: Text(
                              "Enter Product Name",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          controller: productNameController,
                          onSubmitted: (value) {},
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Color(0xffd9acf5), width: 1.0)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Color(0xffd9acf5), width: 1.0)),
                            label: Text(
                              "Product Type",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          controller: productTypeController,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Color(0xffd9acf5), width: 1.0)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Color(0xffd9acf5), width: 1.0)),
                            label: Text(
                              "Enter Product Description",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          controller: productDescriptionController,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Color(0xffd9acf5), width: 1.0)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Color(0xffd9acf5), width: 1.0)),
                            label: Text(
                              "What do you want in return",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          controller: inExchangeProductController,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Color(0xffd9acf5), width: 1.0)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Color(0xffd9acf5), width: 1.0)),
                            label: Text(
                              "Years elapsed since you bought the product",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          controller: yearsElapsedWhenBoughtController,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Color(0xffd9acf5), width: 1.0)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Color(0xffd9acf5), width: 1.0)),
                            label: Text(
                              "Price of the product when you bought it",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          controller: priceWhenBoughtController,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              products.add(ProductDisplayModel(
                                  priceWhenBought:
                                      int.parse(priceWhenBoughtController.text),
                                  numYearsSinceBought: int.parse(
                                      yearsElapsedWhenBoughtController.text),
                                  views: 0,
                                  tag: productTypeController.text,
                                  imageName: 'phone.jpg',
                                  productTitle: productNameController.text,
                                  productDescription:
                                      productDescriptionController.text,
                                  exchangeProductDescription:
                                      inExchangeProductController.text));
                            });
                            Navigator.pop(context);
                          },
                          child: const Text("Next"),
                        ),
                      ]),
                    ),
                  );
                },
              );
            },
            label: const Text('Add product')),
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[100],
          automaticallyImplyLeading: false,
          title: const Text(
            'Bart-lo',
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: products.length,
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
                                        'assets/images/${products[index].imageName}'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        const Center(
                          child: Text(
                            "About the Product",
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Builder(builder: (context) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.black)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  products[index].productDescription,
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
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.black)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                products[index].exchangeProductDescription,
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Column(
                  children: [
                    Column(
                      children: <Widget>[
                        Text(products[index].productTitle,
                            style: const TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                        Container(
                          width: double.infinity,
                          height: 200.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/${products[index].imageName}'),
                                  fit: BoxFit.fill)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
