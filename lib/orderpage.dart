import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcal/provider.dart';
import 'package:provider/provider.dart';

import 'models.dart';

class ProductsPage extends StatefulWidget {
  final Function refresh;
  final String title;
  final PageController pageController;
  const ProductsPage(
      {Key? key,
      required this.title,
      required this.pageController,
      required this.refresh})
      : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: (screenWidth / screenHeight) < 1.6
          ? const EdgeInsets.fromLTRB(30, 100, 30, 0)
          : const EdgeInsets.fromLTRB(400, 100, 400, 0),
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        CustomTitleWidget(
          text: widget.title,
          color: Colors.black,
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (final product in products)
              ProductTileWidget(
                isAdded:
                    context.read<ShoppingCart>().shoppingList.contains(product)
                        ? true
                        : false,
                onTap: () {
                  widget.refresh();
                  //get shoppinglist provider and add to shoppinglist
                  if (context
                      .read<ShoppingCart>()
                      .shoppingList
                      .contains(product)) {
                    context.read<ShoppingCart>().shoppingList.remove(product);
                  } else {
                    context.read<ShoppingCart>().shoppingList.add(product);
                  }
                  widget.pageController.animateToPage(2,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut);
                },
                product: product,
              ),
          ],
        ),
      ]),
    );
  }
}

class ProductTileWidget extends StatefulWidget {
  final Product product;
  final Function onTap;
  final bool isAdded;
  const ProductTileWidget(
      {Key? key,
      required this.product,
      required this.onTap,
      required this.isAdded})
      : super(key: key);

  @override
  State<ProductTileWidget> createState() => _ProductTileWidgetState();
}

class _ProductTileWidgetState extends State<ProductTileWidget> {
  bool _isHovering = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      height: _isHovering ? 205 : 200,
      width: _isHovering ? 205 : 200,
      child: Material(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: widget.isAdded
                ? Theme.of(context).colorScheme.secondary
                : Colors.white,
            width: 2,
          ),
        ),
        color: Colors.white,
        elevation: 5,
        child: InkWell(
          onHover: ((value) {
            setState(() {
              _isHovering = value;
            });
          }),
          onTap: () {
            widget.onTap();
          },
          child: Center(
            child: _isHovering
                ? (widget.isAdded
                    ? Icon(Icons.check,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 50)
                    : const Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 50,
                      ))
                : Text(
                    widget.product.title,
                    style: GoogleFonts.raleway(
                      fontSize: 24,
                      color: widget.isAdded
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.black,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

//class
class Product {
  final String title;
  final String img;
  Product({required this.title, required this.img});
}

List<Product> products = [
  Product(
    title: "Product 1",
    img:
        "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  ),
  Product(
    title: "Product 2",
    img:
        "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  ),
  Product(
    title: "Product 3",
    img:
        "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  ),
  Product(
    title: "Product 4",
    img:
        "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  ),
];
