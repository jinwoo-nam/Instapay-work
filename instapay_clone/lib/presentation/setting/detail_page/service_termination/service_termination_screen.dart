import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/setting/service_termination_reason_data.dart';
import 'package:instapay_clone/presentation/setting/detail_page/payment_code_change/payment_code_widget.dart';
import 'package:instapay_clone/presentation/setting/setting_view_model.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:provider/provider.dart';

class ServiceTerminationScreen extends StatefulWidget {
  const ServiceTerminationScreen({Key? key}) : super(key: key);

  @override
  State<ServiceTerminationScreen> createState() =>
      _ServiceTerminationScreenState();
}

class _ServiceTerminationScreenState extends State<ServiceTerminationScreen> {
  ServiceTerminationReasonType _curType = ServiceTerminationReasonType.None;
  final _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SettingViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.mainNavy,
        title: const Text('서비스 해지'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                        '1. 해지안내\n수집된 개인정보 및 결제수단 관련 정보는 모두 삭제되며 모바일 지로는 모두 해지처리 됩니다.'
                        '\n\n단 일부 기록은 관련 법령에 의하여 일정기간 동안 보존됩니다.\n\n'
                        '2. 해지사유\n다음번에는 회원님께 보다 나은 서비스를 제공할 수 있도록 해지 이유를 알려주십시오.'),
                    const SizedBox(
                      height: 10,
                    ),
                    ...state.reasonList.map(
                      (e) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _curType = e.type;
                            _controller.text = '';
                            _focusNode.unfocus();
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 10, left: 25, right: 25),
                          child: Row(
                            children: [
                              Icon(
                                _curType == e.type
                                    ? Icons.circle
                                    : Icons.circle_outlined,
                                color: Colors.white,
                                size: 17,
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(e.title)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        enabled: _curType == ServiceTerminationReasonType.Etc
                            ? true
                            : false,
                        controller: _controller,
                        focusNode: _focusNode,
                        maxLines: 4,
                        onChanged: (text) {
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                          disabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: ElevatedButton(
                        onPressed: _curType == ServiceTerminationReasonType.None
                            ? null
                            : _curType == ServiceTerminationReasonType.Etc
                                ? _controller.text.trim() == ''
                                    ? null
                                    : () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const PaymentCodeWidget()),
                                        );
                                      }
                                : () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PaymentCodeWidget()),
                                    );
                                  },
                        child: const Text('다음'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(350, 50),
                          primary: color.mainSelectColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
