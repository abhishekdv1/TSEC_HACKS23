import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final productNameController = TextEditingController();
  final productDescriptionController = TextEditingController();
  final productWantController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(children: [
          TextField(
            decoration: InputDecoration(
              label: Text("Enter Product Name"),
            ),
            controller: productNameController,
            onSubmitted: (value) {},
          ),
          TextField(
            decoration: InputDecoration(
              label: Text("Enter Product Description"),
            ),
            controller: productDescriptionController,
            onSubmitted: (value) {},
          ),
          TextField(
            decoration: InputDecoration(
              label: Text("you want in return description "),
            ),
            controller: productWantController,
            onSubmitted: (value) {},
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Next"),
          ),
        ]),
      ),
    );
  }
}
