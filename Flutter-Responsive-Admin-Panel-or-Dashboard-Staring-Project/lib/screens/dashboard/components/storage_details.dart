import 'package:admin/constants.dart';
import 'package:admin/screens/dashboard/components/chart.dart';
import 'package:admin/screens/dashboard/components/storage_info_card.dart';
import 'package:flutter/material.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Storage Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Chart(),
          StorageInfoCard(
            amountOfFiles: '1.3GB',
            svgSrc: 'assets/icons/Documents.svg',
            numOfFiles: 1328,
            title: 'Documents Files',
          ),
          StorageInfoCard(
            amountOfFiles: '15.3GB',
            svgSrc: 'assets/icons/media.svg',
            numOfFiles: 1328,
            title: 'Media Files',
          ),
          StorageInfoCard(
            amountOfFiles: '1.3GB',
            svgSrc: 'assets/icons/folder.svg',
            numOfFiles: 1328,
            title: 'Other Files',
          ),
          StorageInfoCard(
            amountOfFiles: '15.3GB',
            svgSrc: 'assets/icons/unknown.svg',
            numOfFiles: 140,
            title: 'Unknown Files',
          ),
        ],
      ),
    );
  }
}
