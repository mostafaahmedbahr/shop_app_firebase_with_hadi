import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
 import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_firebase_with_hadi/screens/bottom_nav_bar_screens/feeds.dart';

import '../../../provider/product_provider.dart';
import '../../ineer_screen/brand_nav.dart';
import '../../ineer_screen/brand_rail.dart';
import '../../ineer_screen/categories_feeds_screen.dart';

class FrontHomeLayer extends StatefulWidget {
  FrontHomeLayer({Key? key}) : super(key: key);

  @override
  State<FrontHomeLayer> createState() => _FrontHomeLayerState();
}

class _FrontHomeLayerState extends State<FrontHomeLayer> {
  List images = [
    "assets/images/carousel1.png",
    "assets/images/carousel2.jpeg",
    "assets/images/carousel3.jpg",
    "assets/images/carousel4.png",
  ];

  List brandsImages = [
    "assets/images/apple.jpg",
    "assets/images/addidas.jpg",
    "assets/images/Dell.jpg",
    "assets/images/h&m.jpg",
    "assets/images/samsung.jpg",
    "assets/images/nike.jpg",
    "assets/images/Huawei.jpg",
  ];

  int indexPage = 0;

   List<Map<String, Object>> categories = [
    {
      "categoryName": "Phone",
      "categoryImage": "assets/images/CatPhones.png",
    },
    {
      "categoryName": "Shoes",
      "categoryImage": "assets/images/CatShoes.jpg",
    },
    {
      "categoryName": "Clothes",
      "categoryImage": "assets/images/CatClothes.jpg",
    },
    {
      "categoryName": "Beauty",
      "categoryImage": "assets/images/CatBeauty.jpg",
    },
    {
      "categoryName": "Laptops",
      "categoryImage": "assets/images/CatLaptops.png",
    },
    {
      "categoryName": "Furniture",
      "categoryImage": "assets/images/CatFurniture.jpg",
    },
    {
      "categoryName": "Watches",
      "categoryImage": "assets/images/CatWatches.jpg",
    },
  ];
   @override
  Widget build(BuildContext context) {
     final productPro = Provider.of<ProductsProvider>(context,listen: false);
     return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CarouselSlider(
              items: images
                  .map(
                    (e) => Image(
                      image: AssetImage("$e"),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 200,
                scrollPhysics: const BouncingScrollPhysics(),
                initialPage: 0,
                autoPlay: true,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayCurve: Curves.fastOutSlowIn,
                viewportFraction: 1,
              ),
            ),
            // categories
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: SizedBox(
                height: 130,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        // productPro.findByCategory("${categories[index]["categoryName"]}");
                        Navigator.push(context, MaterialPageRoute(builder: (context)
                        {
                          return CategoriesFeedsScreen(
                            appBarTitle: "${categories[index]["categoryName"]}",
                          );
                        }));
                        print("${categories[index]["categoryName"]}");
                      },
                      child: SizedBox(
                        height: 130,
                        width: 130,
                        child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            Image(
                              image: AssetImage(
                                  "${categories[index]["categoryImage"]}"),
                              height: 130,
                              width: 130,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              color: Colors.grey.withOpacity(0.8),
                              width: double.infinity,
                              child: Text(
                                "${categories[index]["categoryName"]}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                  itemCount: categories.length,
                ),
              ),
            ),
            // brands
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Popular brands",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        BrandNavigationRailScreen.routeName,
                        arguments: {
                          7,
                        },
                      );
                    },
                    child: const Text(
                      "View All  >>",
                      style: TextStyle(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // CarouselSlider.builder(
            //   itemCount: brandsImages.length,
            //   itemBuilder: (BuildContext context, int index, int i) {
            //     return SizedBox(
            //       width: double.infinity,
            //       child: Image.asset(
            //         brandsImages[index],
            //         fit: BoxFit.cover,
            //       ),
            //     );
            //   },
            //   options: CarouselOptions(
            //     onPageChanged: (x, carouselPageChangedReason) {
            //       setState(() {
            //         indexPage = x;
            //       });
            //     },
            //     height: 150,
            //     initialPage: 2,
            //     enlargeCenterPage: true,
            //     pauseAutoPlayOnTouch: true,
            //     scrollDirection: Axis.horizontal,
            //     autoPlayInterval: const Duration(seconds: 1),
            //     autoPlay: true,
            //     scrollPhysics: const BouncingScrollPhysics(),
            //   ),
            // ),
            // products
            SizedBox(
              height: 210,
              width: MediaQuery.of(context).size.width * 0.95,
              child: Swiper(
                itemCount: brandsImages.length,
                autoplay: true,
                viewportFraction: 0.8,
                scale: 0.9,
                onTap: (index) {
                  Navigator.of(context).pushNamed(
                    BrandNavigationRailScreen.routeName,
                    arguments: {
                      index,
                    },
                  );
                },
                itemBuilder: (BuildContext ctx, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.blueGrey,
                      child: Image.asset(
                        brandsImages[index],
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Popular Products",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "View All  >>",
                      style: TextStyle(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width * 0.75,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/CatPhones.png",
                                    height: 150,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.star_border_purple500_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 90,
                                    right: 15,
                                    child: Container(
                                      height: 40,
                                      width: 70,
                                      color: Colors.white,
                                      child: const Center(
                                        child: const Text(
                                          "\$500",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Couch",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text("Couch"),
                                    Icon(Icons.shopping_cart_checkout_outlined),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    );
                  },
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
