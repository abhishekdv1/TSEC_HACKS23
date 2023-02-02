import 'package:barter_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:barter_app/models/product_display_model.dart';
import 'package:barter_app/utils.dart';
import 'package:flutter/rendering.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ScrollController _scrollController = ScrollController();
  double _bottomNavBarHeight = 56;
  bool _showBottomNavBar = true;
  TextEditingController searcheditingcontroller = TextEditingController();
  bool isPresent = false;
  List<ProductDisplayModel> tagList = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _showBottomNavBar = false;
        });
      } else {
        setState(() {
          _showBottomNavBar = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
          child: Column(
            children: [
              TextField(
                controller: searcheditingcontroller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Color(0xffd9acf5), width: 3.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Color(0xffd9acf5), width: 3.0)),
                  filled: true,
                  hintText: "Mobile, Laptop, Smartphone, Refrigerator.......",
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search_rounded),
                    onPressed: () {
                      tagList.clear();
                      final String tagString =
                          searcheditingcontroller.text.toLowerCase().trim();
                      isPresent = false;
                      for (var i = 0; i < products.length; i++) {
                        if (products[i].tag == tagString) {
                          tagList.add(products[i]);
                          isPresent = true;
                        }
                      }
                      if (isPresent != true) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Search Status"),
                              content: const Text(
                                  "The searched product was not found"),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Okay"))
                              ],
                            );
                          },
                        );
                      } else {
                        setState(() {});
                      }
                    },
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                  controller: _scrollController,
                  shrinkWrap: true,
                  itemCount: tagList.length,
                  itemBuilder: (context, index) {
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
                                  child: Builder(builder: (context) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border:
                                              Border.all(color: Colors.black)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          tagList[index].productDescription,
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
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        tagList[index]
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
                        color: Color(0xffd9acf5),
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Column(
                          children: [
                            Column(
                              children: <Widget>[
                                Text(tagList[index].productTitle,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold)),
                                Container(
                                  width: double.infinity,
                                  height: 200.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/${tagList[index].imageName}'),
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
              )
            ],
          ),
        ),
      ),
    ));
  }
}
