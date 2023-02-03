import 'package:barter_app/models/product_display_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/firebase_picture_uploader_widget.dart';
import 'package:flutter/cupertino.dart';

class AddProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<UploadJob>? _profilePictures = [];
  final productNameController = TextEditingController();
  final productDescriptionController = TextEditingController();
  final inExchangeProductController = TextEditingController();
  final yearsElapsedWhenBoughtController = TextEditingController();
  final priceWhenBoughtController = TextEditingController();
  final productTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final profilePictureTile = new Material(
      color: Colors.transparent,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Profile Picture',
              style: TextStyle(
                color: CupertinoColors.systemBlue,
                fontSize: 15.0,
              )),
          const Padding(
            padding: EdgeInsets.only(bottom: 5.0),
          ),
          PictureUploadWidget(
            initialImages: _profilePictures,
            onPicturesChange: profilePictureCallback,
            buttonStyle: PictureUploadButtonStyle(),
            buttonText: 'Upload Picture',
            localization: PictureUploadLocalization(),
            settings: PictureUploadSettings(
                // customDeleteFunction: ProfileController.deleteProfilePicture,
                // customUploadFunction: RecipeController.uploadRecipePicture,
                imageSource: ImageSourceExtended.askUser,
                minImageCount: 0,
                maxImageCount: 5,
                imageManipulationSettings: const ImageManipulationSettings(
                    enableCropping: true, compressQuality: 75)),
            enabled: true,
          ),
          Container(
            child: Column(children: [
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Color(0xffd9acf5), width: 1.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Color(0xffd9acf5), width: 1.0)),
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
                      borderSide:
                          BorderSide(color: Color(0xffd9acf5), width: 1.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Color(0xffd9acf5), width: 1.0)),
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
                      borderSide:
                          BorderSide(color: Color(0xffd9acf5), width: 1.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Color(0xffd9acf5), width: 1.0)),
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
                      borderSide:
                          BorderSide(color: Color(0xffd9acf5), width: 1.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Color(0xffd9acf5), width: 1.0)),
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
                      borderSide:
                          BorderSide(color: Color(0xffd9acf5), width: 1.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Color(0xffd9acf5), width: 1.0)),
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
                      borderSide:
                          BorderSide(color: Color(0xffd9acf5), width: 1.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Color(0xffd9acf5), width: 1.0)),
                  label: Text(
                    "Price of the product when you bought it",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                controller: priceWhenBoughtController,
              ),
              ElevatedButton(
                onPressed: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  String? getImageUrlPath = pref.getString('imagePaffth');
                  ProductDisplayModel currentVar = ProductDisplayModel(
                      priceWhenBought:
                          int.parse(priceWhenBoughtController.text),
                      numYearsSinceBought:
                          int.parse(yearsElapsedWhenBoughtController.text),
                      views: 0,
                      tag: productTypeController.text,
                      imagePath: "ss ds $getImageUrlPath",
                      productTitle: productNameController.text,
                      productDescription: productDescriptionController.text,
                      exchangeProductDescription:
                          inExchangeProductController.text);
                  final FirebaseDatabase database = FirebaseDatabase.instance;
                  User user = FirebaseAuth.instance.currentUser!;
                  DatabaseReference databaseReference =
                      database.ref('products').child('${user.uid}');
                  await databaseReference.push().set(currentVar.toMap());
                  DatabaseReference _databaseReference =
                      database.ref('productsAll');
                  await _databaseReference.push().set(currentVar.toMap());
                },
                child: const Text("Next"),
              ),
            ]),
          ),
        ],
      ),
    );

    return new Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 100, 20, 50),
            child: Column(children: <Widget>[profilePictureTile])),
      ),
    );
  }

  void profilePictureCallback(
      {List<UploadJob>? uploadJobs, bool? pictureUploadProcessing}) {
    print(uploadJobs![0]!.toString());
    _profilePictures = uploadJobs;
  }
}
