import 'package:flutter/material.dart';
import 'package:instapay_clone/ui/color.dart';

class PaymentInfoCard extends StatelessWidget {
  const PaymentInfoCard({
    Key? key,
    required this.title,
    required this.imgSrc,
    required this.accountNumber,
    required this.price,
  }) : super(key: key);

  final String title, imgSrc, accountNumber;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: defaultPadding),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultPadding),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: Image.asset(
              imgSrc,
              color: mainSelectColor,
              height: 16,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    accountNumber,
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
          Text('$price')
        ],
      ),
    );
  }
}
