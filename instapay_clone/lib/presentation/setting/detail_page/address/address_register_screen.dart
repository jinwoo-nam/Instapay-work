import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/setting/address_data.dart';
import 'package:instapay_clone/presentation/setting/setting_view_model.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:provider/provider.dart';

class AddressRegisterScreen extends StatefulWidget {
  final AddressData data;

  const AddressRegisterScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<AddressRegisterScreen> createState() => _AddressRegisterScreenState();
}

class _AddressRegisterScreenState extends State<AddressRegisterScreen> {
  final nameController = TextEditingController();
  final detailController = TextEditingController();
  final contactController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    detailController.dispose();
    contactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SettingViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('주소지 등록'),
        backgroundColor: color.mainNavy,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 30.0),
                      child: Text(
                        '이름 ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                        onChanged: (text) {
                          setState(() {});
                        },
                        controller: nameController,
                        decoration: const InputDecoration(
                          isDense: true,
                          hintText: '이름',
                          hintStyle:
                              TextStyle(color: Colors.black38, fontSize: 13),
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 30.0),
                      child: Text(
                        '주소 ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text('${widget.data.postCode}'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(widget.data.address),
                          ),
                          TextField(
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                            onChanged: (text) {
                              setState(() {});
                            },
                            controller: detailController,
                            decoration: const InputDecoration(
                              isDense: true,
                              hintText: '상세주소',
                              hintStyle: TextStyle(
                                  color: Colors.black38, fontSize: 13),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 30.0),
                      child: Text(
                        '연락처',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                        onChanged: (text) {
                          setState(() {});
                        },
                        controller: contactController,
                        decoration: const InputDecoration(
                          isDense: true,
                          hintText: '연락처',
                          hintStyle:
                              TextStyle(color: Colors.black38, fontSize: 13),
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed: (nameController.text.trim().isEmpty ||
                      contactController.text.trim().isEmpty ||
                      detailController.text.trim().isEmpty)
                  ? null
                  : () {
                      viewModel.registerAddress(AddressData(
                        address: widget.data.address,
                        postCode: widget.data.postCode,
                        detailAddress: detailController.text.trim(),
                        contact: contactController.text.trim(),
                        name: nameController.text.trim(),
                      ));
                      Navigator.pop(context, AddressData(
                        address: widget.data.address,
                        postCode: widget.data.postCode,
                        detailAddress: detailController.text.trim(),
                        contact: contactController.text.trim(),
                        name: nameController.text.trim(),
                      ));
                    },
              child: const Text(
                '확인',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(350, 50),
                primary: color.mainSelectColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
