import 'package:flutter/material.dart';
import 'package:mezcal/models.dart';
import 'package:mezcal/provider.dart';
import 'package:provider/provider.dart';
import 'orderpage.dart';

const String imgurl = "/assets/bg.png";

List<Product> shoppingList = [];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool scroll = false;
  int currentIndex = 0;

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          PageView(
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
              if (value == 0) {
                setState(() {
                  scroll = false;
                });
              } else {
                setState(() {
                  scroll = true;
                });
              }
            },
            controller: pageController,
            scrollDirection: Axis.vertical,
            pageSnapping: false,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/bg.png"))),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black.withOpacity(.3),
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: const CustomTitleWidget(
                        color: Colors.white,
                        text: 'Mezcal, in a new way.',
                      ),
                    ),
                  ),
                ],
              ),
              const Center(
                child: ContentShowerWidget(
                    title: "Our products",
                    bodyText:
                        "lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum"),
              ),
              ProductsPage(
                //this refresh thing is a hack to make the page refresh when you add a product to the shoppinglist
                refresh: () {
                  setState(() {});
                },
                pageController: pageController,
                title: 'Order now!',
              ),
            ],
          ),
          //DIY appbar
          Positioned(
              top: 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                height: (MediaQuery.of(context).size.height * 0.06) > 60
                    ? MediaQuery.of(context).size.height * 0.06
                    : 60,
                width: MediaQuery.of(context).size.width,
                color: scroll ? Colors.white : Colors.black.withOpacity(.1),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HeaderButton(
                      onPressed: () {
                        pageController.animateToPage(0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut);
                        debugPrint("hi");
                      },
                      text: "Home",
                      color: currentIndex == 0 ? Colors.white : Colors.grey,
                    ),
                    HeaderButton(
                      onPressed: () {
                        pageController.animateToPage(1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut);
                      },
                      text: "Products",
                      color: currentIndex == 1 ? Colors.black : Colors.grey,
                    ),
                    HeaderButton(
                      onPressed: () {
                        pageController.animateToPage(2,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut);
                      },
                      text: "Order",
                      color: currentIndex == 2 ? Colors.black : Colors.grey,
                    ),
                    HeaderButton(
                      onPressed: () {
                        pageController.animateToPage(3,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut);
                      },
                      text: "Contact",
                      color: currentIndex == 3 ? Colors.black : Colors.grey,
                    ),
                    HeaderIcon(
                        onPressed: () {
                          pageController.animateToPage(2,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut);
                        },
                        icon: Expanded(
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Icon(
                                Icons.shopping_cart,
                                color: currentIndex == 0
                                    ? Colors.grey
                                    : (currentIndex == 2
                                        ? const Color.fromARGB(255, 31, 31, 31)
                                        : Colors.grey),
                              ),
                              context
                                      .read<ShoppingCart>()
                                      .shoppingList
                                      .isNotEmpty
                                  ? Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          height: 18,
                                          width: 18,
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                        Text(
                                          "${context.read<ShoppingCart>().shoppingList.length}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    )
                                  : Container(),
                            ],
                          ),
                        )),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
