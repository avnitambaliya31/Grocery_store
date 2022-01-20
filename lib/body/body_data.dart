import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:woman_grocerry/constant/constant_data.dart';
import 'package:woman_grocerry/constant/products.dart';
import 'package:woman_grocerry/home_page/detail_page.dart';

class BodyData extends StatefulWidget {
  BodyData({Key? key}) : super(key: key);

  @override
  _BodyDataState createState() => _BodyDataState();
}

class _BodyDataState extends State<BodyData> {
  List<String> categoryData = [
    "Hand Bag",
    "Jwellery",
    "FootWear",
    "Dresses",
    "Sarres",
    "NightWear",
    "UnderWear"
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kDafualtPadding, vertical: 30),
          child: Text(
            "Woman",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 25,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryData.length,
              itemBuilder: (context, index) => buildCategory(index)),
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
            child: GridView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.95,
                    // crossAxisSpacing: kDafualtPadding,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) => gridBuilderData(index, () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (_) => DetailPage(
                                products: products[index],
                              )));
                    })))
      ],
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDafualtPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categoryData[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: currentIndex == index ? kTextColor : kTextLightColor),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              height: 2,
              width: 30,
              color: currentIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }

  Widget gridBuilderData(int index, Function() press) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 190,
            width: 190,
            decoration: BoxDecoration(
              color: products[index].color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Hero(
              tag: "${products[index].id}",
              child: Image.asset(
                products[index].image!,
                fit: BoxFit.contain,
                // width: 50,
                // height: 60,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            products[index].title!,
            style: TextStyle(color: kTextLightColor),
          ),
          Text(
            "\$${products[index].price}",
            style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
