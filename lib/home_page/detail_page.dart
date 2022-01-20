import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:woman_grocerry/constant/add_to_cart.dart';
import 'package:woman_grocerry/constant/color_dots.dart';
import 'package:woman_grocerry/constant/constant_data.dart';
import 'package:woman_grocerry/constant/products.dart';

class DetailPage extends StatefulWidget {
  final Products? products;
  DetailPage({this.products});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: widget.products!.color,
      appBar: appBarData(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  discriptionDetails(size),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDafualtPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Aristocratic Hand Bag",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(widget.products!.title!,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "Price\n",
                                  style: TextStyle(fontSize: 16)),
                              TextSpan(
                                  text: "\$${widget.products!.price}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                            ])),
                            const SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Hero(
                                tag: "${widget.products!.id}",
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Image.asset(
                                    widget.products!.image!,
                                    fit: BoxFit.contain,
                                    height: 240,
                                    // width: 150,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar appBarData() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          "images/icons/back_arrow.svg",
          color: Colors.white,
          width: 20,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            "images/icons/serarch.svg",
            color: Colors.white,
            width: 22,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "images/icons/cart.svg",
            color: Colors.white,
            width: 22,
          ),
          onPressed: () {},
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }

  Widget discriptionDetails(Size size) {
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.3),
      padding: EdgeInsets.only(
          top: size.height * 0.11,
          left: kDafualtPadding,
          right: kDafualtPadding),
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white),
      child: Column(
        children: [
          colorAndSize(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDafualtPadding),
            child: Text(
              widget.products!.discriptions!,
              style: TextStyle(height: 1.5),
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDafualtPadding),
            child: AddToCart(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDafualtPadding),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: kDafualtPadding),
                    width: 60,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: widget.products!.color!, width: 2)),
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "images/icons/add_to_cart.svg",
                        color: widget.products!.color!,
                      ),
                    )),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: widget.products!.color!,
                      child: Text(
                        "buy now".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget colorAndSize() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Colors",
              ),
              Row(
                children: [
                  ColorDots(
                    color: widget.products!.color!,
                    isSelected: true,
                  ),
                  ColorDots(
                    color: Color(0xFFF1D5C9),
                  ),
                  ColorDots(
                    color: Color(0xFFEDBA67),
                  )
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "Size\n",
                style: TextStyle(fontSize: 16, color: kTextColor)),
            TextSpan(
                text: "\$${widget.products!.size}",
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: kTextColor, fontWeight: FontWeight.bold)),
          ])),
        ),
      ],
    );
  }
}
