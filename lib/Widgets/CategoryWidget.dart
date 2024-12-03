import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Row(
          children: [
            //for (int i = 0; i < 10; i++)

            //single item
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ]),
                child: Image.asset(
                  "images/drinks.jpg",
                  width: 50,
                  height: 50,
                ),
              ),
            ),
            //single item
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ]),
                child: Image.asset(
                  "images/burger.jpg",
                  width: 50,
                  height: 50,
                ),
              ),
            ),
            //single item
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ]),
                child: Image.asset(
                  "images/pizza.jpg",
                  width: 50,
                  height: 50,
                ),
              ),
            ),
            //single item
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ]),
                child: Image.asset(
                  "images/food1.jpg",
                  width: 50,
                  height: 50,
                ),
              ),
            ),
            //single item
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ]),
                child: Image.asset(
                  "images/food2.jpg",
                  width: 50,
                  height: 50,
                ),
              ),
            ), //endof single item
          ],
        ),
      ),
    );
  }
}
