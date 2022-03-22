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
                      child: const Text(
                        '2022',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    TextButton(
                      child: const Text(
                        '2021',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    TextButton(
                      child: const Text(
                        '2020',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    TextButton(
                      child: const Text(
                        '2019',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    TextButton(
                      child: const Text(
                        '2018',
                        style: TextStyle(color: Colors.white),
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
                        child: const Text(
                          '1',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                        ),
                      ),
                      TextButton(
                        child: const Text(
                          '2',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                        ),
                      ),
                      TextButton(
                        child: const Text(
                          '3',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                        ),
                      ),
                      TextButton(
                        child: const Text(
                          '4',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                        ),
                      ),
                      TextButton(
                        child: const Text(
                          '5',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                        ),
                      ),
                      TextButton(
                        child: const Text(
                          '6',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                        ),
                      ),
                      TextButton(
                        child: const Text(
                          '7',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                        ),
                      ),
                      TextButton(
                        child: const Text(
                          '8',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                        ),
                      ),
                      TextButton(
                        child: const Text(
                          '9',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                        ),
                      ),
                      TextButton(
                        child: const Text(
                          '10',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                        ),
                      ),
                      TextButton(
                        child: const Text(
                          '11',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                        ),
                      ),
                      TextButton(
                        child: const Text(
                          '12',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 0),
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Expanded(
          flex: 8,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 100.0),
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
