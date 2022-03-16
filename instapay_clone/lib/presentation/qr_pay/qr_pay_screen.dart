import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/main_page/main_screen_view_model.dart';
import 'package:instapay_clone/presentation/qr_pay/components/order_screen.dart';
import 'package:instapay_clone/presentation/qr_pay/qr_pay_view_model.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:developer';
import 'dart:io';
import 'package:provider/provider.dart';

class QrPayScreen extends StatefulWidget {
  const QrPayScreen({Key? key}) : super(key: key);

  @override
  State<QrPayScreen> createState() => _QrPayScreenState();
}

class _QrPayScreenState extends State<QrPayScreen> {
  Barcode? result;
  QRViewController? controller;
  final String _instaPayHomepageUrl = 'https://book.instapay.kr';
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mainViewModel = context.watch<MainScreenViewModel>();
    final viewModel = context.watch<QrPayViewModel>();
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: [
                QRView(
                  key: qrKey,
                  onQRViewCreated: (controller) {
                    this.controller = controller;
                    controller.scannedDataStream.listen((scanData) async {
                      await controller.pauseCamera();
                      result = scanData;
                      if (result!.code != null) {
                        final bookData =
                            await viewModel.searchISBN(result!.code!);
                        if (bookData != null) {
                          final navEnd = Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderScreen(
                                      data: bookData,
                                    )),
                          );
                          navEnd.then((value) async {
                            await controller.resumeCamera();
                          });
                        }
                      }
                    });
                  },
                  overlay: QrScannerOverlayShape(
                      borderColor: Colors.white,
                      borderLength: scanArea / 2,
                      cutOutSize: scanArea),
                  onPermissionSet: (ctrl, p) =>
                      _onPermissionSet(context, ctrl, p),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                      image: AssetImage('imgs/home-logo@2x.png'),
                      width: 140,
                      height: 40,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 63.0,
                      bottom: 230,
                    ),
                    child: IconButton(
                      onPressed: () async {
                        await controller?.toggleFlash();
                      },
                      icon: Image.asset('imgs/home-flash@2x.png'),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 63.0,
                      top: 230,
                    ),
                    child: IconButton(
                      onPressed: () {
                        viewModel.launchURL(_instaPayHomepageUrl);
                      },
                      icon: Image.asset('imgs/booksearch-small@2x.png'),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 350),
                  child: Center(
                    child: Text(
                      'QR코드를 읽어서 결제하세요',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(canvasColor: Colors.transparent),
                    child: BottomNavigationBar(
                      currentIndex: mainViewModel.curIndex,
                      type: BottomNavigationBarType.fixed,
                      onTap: mainViewModel.onBottomNavTap,
                      unselectedItemColor: Colors.white,
                      selectedItemColor: color.mainSelectColor,
                      items: [
                        BottomNavigationBarItem(
                            icon: Image.asset(
                              'imgs/tab-qr@2x.png',
                              color: color.mainSelectColor,
                              width: 20,
                              height: 20,
                            ),
                            label: ('QR 결제')),
                        BottomNavigationBarItem(
                            icon: Image.asset(
                              'imgs/tab-wallet@2x.png',
                              color: Colors.white,
                              width: 20,
                              height: 20,
                            ),
                            label: ('내 지갑')),
                        BottomNavigationBarItem(
                            icon: Image.asset(
                              'imgs/tab-search@2x.png',
                              color: Colors.white,
                              width: 20,
                              height: 20,
                            ),
                            label: ('내역 조회')),
                        BottomNavigationBarItem(
                            icon: Image.asset(
                              'imgs/tab-setting@2x.png',
                              color: Colors.white,
                              width: 20,
                              height: 20,
                            ),
                            label: ('설정')),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }
}
