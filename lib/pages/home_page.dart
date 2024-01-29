import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/pages/cart_page.dart';
import 'package:shopping_app/widgets/product_list.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> pages = const [
    ProductList(),
    CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentPage,
              selectedFontSize: 0,
              unselectedFontSize: 0,
              iconSize: 35.0,
              onTap: (value){
                setState(() {
                  currentPage = value;
                });
              },
              items: const [
                BottomNavigationBarItem(
                    label: "",
                    icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                    label: "",
                    icon: Icon(Icons.shopping_cart),
                )
              ]
          ),
    );
  }
}
