import 'package:flutter/material.dart';

import '../../../util/util.dart';

class InstaCardWidget extends StatelessWidget {
  final int deposit;

  const InstaCardWidget({
    required this.deposit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      width: double.infinity,
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xff4CC2C2),
            Color(0xff50B5BE),
            Color(0xff5D94B3),
            Color(0xff725FA2),
            Color(0xff7F3F98),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'imgs/instacard.png',
                scale: 0.8,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
                decoration: BoxDecoration(
                  color: const Color(0xffE6E7E8),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(
                  'imgs/instacard_logo.png',
                  scale: 0.7,
                ),
              )
            ],
          ),
          Text(
            currencyFormat(deposit),
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
