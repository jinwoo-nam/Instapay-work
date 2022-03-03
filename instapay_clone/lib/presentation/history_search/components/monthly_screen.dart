import 'package:flutter/material.dart';

class MonthlyScreen extends StatelessWidget {
  const MonthlyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      child: Text(
                        '2022',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    TextButton(
                      child: Text(
                        '2021',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    TextButton(
                      child: Text(
                        '2020',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    TextButton(
                      child: Text(
                        '2019',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    TextButton(
                      child: Text(
                        '2018',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      TextButton(
                        child: Text(
                          '1',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                        ),
                      ),
                      TextButton(
                        child: Text(
                          '2',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                        ),
                      ),
                      TextButton(
                        child: Text(
                          '3',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                        ),
                      ),
                      TextButton(
                        child: Text(
                          '4',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                        ),
                      ),
                      TextButton(
                        child: Text(
                          '5',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                        ),
                      ),
                      TextButton(
                        child: Text(
                          '6',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                        ),
                      ),
                      TextButton(
                        child: Text(
                          '7',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                        ),
                      ),
                      TextButton(
                        child: Text(
                          '8',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                        ),
                      ),
                      TextButton(
                        child: Text(
                          '9',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                        ),
                      ),
                      TextButton(
                        child: Text(
                          '10',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                        ),
                      ),
                      TextButton(
                        child: Text(
                          '11',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                        ),
                      ),
                      TextButton(
                        child: Text(
                          '12',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 0),
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Text('결제 내역이 없습니다.'),
            ),
          ),
          // child: Align(
          //   alignment: Alignment.topCenter,
          //   child: Text('결제 내역이 없습니다.'),
          // ),
        ),
      ],
    );
  }
}
