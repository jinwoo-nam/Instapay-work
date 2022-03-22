import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/history_search/components/payment_detail_widget.dart';
import 'package:instapay_clone/presentation/history_search/components/payment_list_widget.dart';
import 'package:instapay_clone/responsive/responsive.dart';
import 'package:instapay_clone/ui/color.dart';

class RecentlyScreen extends StatefulWidget {
  const RecentlyScreen({Key? key}) : super(key: key);

  @override
  State<RecentlyScreen> createState() => _RecentlyScreenState();
}

class _RecentlyScreenState extends State<RecentlyScreen> {
  final controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    const PaymentListWidget(),
                    const SizedBox(height: defaultPadding),
                    if (Responsive.isMobile(context))
                      const Padding(
                        padding: EdgeInsets.only(bottom: defaultPadding*3),
                        child: PaymentDetailWidget(),
                      ),
                  ],
                ),
              ),
              if (!Responsive.isMobile(context))
                const SizedBox(height: defaultPadding),
              if (!Responsive.isMobile(context))
                const Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: PaymentDetailWidget(),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
