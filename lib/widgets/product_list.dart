import 'package:flutter/material.dart';
import 'package:shopping_app/global_variables.dart';
import 'package:shopping_app/pages/product_detail_page.dart';
import 'package:shopping_app/widgets/product_card.dart';
class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> brands = const [
    'All',
    'Addidas',
    'Nike',
    'Bata'
  ];
  late String selectedBrand;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedBrand = brands[0];
  }
  @override
  Widget build(BuildContext context) {

    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(119, 119, 119, 1),
      ),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
    );
    return SafeArea(
      child: Column(
        children: [
          Row(
              children:[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Shoes\nCollections', style: Theme.of(context).textTheme.titleLarge),
                ),
                const Expanded(child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search,),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                )),
              ]
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: brands.length,
                itemBuilder: (context, index){
                  final brand = brands[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedBrand = brand;
                        });
                      },
                      child: Chip(
                        backgroundColor: selectedBrand == brand ? Theme.of(context).colorScheme.primary : const Color.fromRGBO(245, 247, 249, 1),
                        side: const BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1),
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                        labelStyle: const TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(134, 134, 134, 1)
                        ),
                        label: Text(brand),
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: LayoutBuilder(
                builder: (context, constrains){
                  if(constrains.maxWidth > 1300){
                    return  GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2.0
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index){
                          final product = products[index];
                          return GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                return ProductDetailPage(product: product);
                              }
                              ),
                              );
                            },
                            child: ProductCart(
                              title: product['title'] as String,
                              price: product['price'] as double,
                              image: product['imageUrl']as String,
                              backgroundColor: index.isEven ? const Color.fromRGBO(216, 240, 253, 1):const Color.fromRGBO(245, 247, 249, 1),
                            ),
                          );
                        }
                    );
                  }else{
                    return ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context,index){
                        final product = products[index];
                        return GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                              return ProductDetailPage(product: product);
                            }
                            ),
                            );
                          },
                          child: ProductCart(
                            title: product['title'] as String,
                            price: product['price'] as double,
                            image: product['imageUrl']as String,
                            backgroundColor: index.isEven ? const Color.fromRGBO(216, 240, 253, 1):const Color.fromRGBO(245, 247, 249, 1),
                          ),
                        );
                      },
                    );
                  }
                }
            ),
          ),
        ],
      ),
    );
  }
}
