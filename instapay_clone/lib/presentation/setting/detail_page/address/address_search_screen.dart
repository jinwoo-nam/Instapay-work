import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/setting/detail_page/address/address_register_screen.dart';
import 'package:instapay_clone/presentation/setting/detail_page/address/address_search_result_widget.dart';
import 'package:instapay_clone/presentation/setting/setting_state.dart';
import 'package:instapay_clone/presentation/setting/setting_view_model.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:provider/provider.dart';

class AddressSearchScreen extends StatefulWidget {
  const AddressSearchScreen({Key? key}) : super(key: key);

  @override
  State<AddressSearchScreen> createState() => _AddressSearchScreenState();
}

class _AddressSearchScreenState extends State<AddressSearchScreen> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final viewModel = context.read<SettingViewModel>();
      viewModel.clearSearchAddressList();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SettingViewModel>();
    final state = viewModel.state;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('주소 검색'),
        backgroundColor: color.lightGrey,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: '도로명주소: 도로명과 건물번호',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: color.key),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: color.key),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      viewModel.searchAddress(_controller.text.trim());
                    },
                    icon: Image.asset(
                      'imgs/address-search@2x.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  ...(state.isAddressSearchClicked == false)
                      ? [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                '도로명 주소: 도로명과 건물 번호',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('       예) 테헤란로 520, 거북골로 23길'),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                '지번 주소: 지번과 번지수',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('       예) 대치동 945, 북가좌동 348'),
                            ],
                          )
                        ]
                      : buildSearchResult(state),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildSearchResult(SettingState state) {
    return [];
    // if (state.searchAddressList.isEmpty) {
    //   return [
    //     const Center(
    //       child: Text('검색 결과가 없습니다.'),
    //     )
    //   ];
    // } else {
    //   return state.searchAddressList.map((e) {
    //     return GestureDetector(
    //       onTap: () async{
    //         final result = await Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //             builder: (context) => AddressRegisterScreen(
    //               data: e,
    //             ),
    //           ),
    //         );
    //
    //         if(result != null) {
    //           Navigator.pop(context,result);
    //         }
    //       },
    //       child: AddressSearchResultWidget(data: e),
    //     );
    //   }).toList();
    // }
  }
}
