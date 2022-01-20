import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  AddToCart({Key? key}) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int addToCart = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              height: 35,
              width: 45,
              child: OutlineButton(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  setState(() {
                    if (addToCart > 1) addToCart--;
                  });
                },
                child: Icon(Icons.remove),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                addToCart.toString().padLeft(2, "0"),
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SizedBox(
              height: 35,
              width: 45,
              child: OutlineButton(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  setState(() {
                    addToCart++;
                  });
                },
                child: Icon(Icons.add),
              ),
            )
          ],
        ),
        Container(
          height: 40,
          width: 40,
          decoration:
              BoxDecoration(color: Color(0xFFFF6464), shape: BoxShape.circle),
          child: Icon(
            Icons.favorite,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
