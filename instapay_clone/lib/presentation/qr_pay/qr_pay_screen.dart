import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/main_page/main_screen_view_model.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:developer';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

//import 'package:flutter/foundation.dart';

class QrPayScreen extends StatefulWidget {
  const QrPayScreen({Key? key}) : super(key: key);

  @override
  State<QrPayScreen> createState() => _QrPayScreenState();
}

class _QrPayScreenState extends State<QrPayScreen> {
  Barcode? result;
  final String _url = 'https://book.instapay.kr';
  QRViewController? controller;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    final mainViewModel = context.watch<MainScreenViewModel>();
    return Column(
      children: <Widget>[
        Expanded(
          child: Stack(
            children: [
              _buildQrView(context),
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
                    icon: const Icon(
                      Icons.flash_on,
                      color: Colors.white,
                      size: 40,
                    ),
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
                    onPressed: () async {
                      _launchURL();
                    },
                    icon: const Icon(
                      Icons.menu_book_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Insta',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                      ),
                    ),
                    Text(
                      'Pay',
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
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
                    selectedItemColor: Colors.teal,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.qr_code,
                          ),
                          label: ('QR 결제')),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.wallet_travel,
                          ),
                          label: ('내 지갑')),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.search,
                          ),
                          label: ('내역 조회')),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.settings,
                          ),
                          label: ('설정')),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // Expanded(
        //   flex: 1,
        //   child: FittedBox(
        //     fit: BoxFit.contain,
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: <Widget>[
        //         if (result != null)
        //           Text(
        //               'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
        //         else
        //           const Text('Scan a code'),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: <Widget>[
        //             Container(
        //               margin: const EdgeInsets.all(8),
        //               child: ElevatedButton(
        //                   onPressed: () async {
        //                     await controller?.toggleFlash();
        //                     setState(() {});
        //                   },
        //                   child: FutureBuilder(
        //                     future: controller?.getFlashStatus(),
        //                     builder: (context, snapshot) {
        //                       return Text('Flash: ${snapshot.data}');
        //                     },
        //                   )),
        //             ),
        //             Container(
        //               margin: const EdgeInsets.all(8),
        //               child: ElevatedButton(
        //                   onPressed: () async {
        //                     await controller?.flipCamera();
        //                     setState(() {});
        //                   },
        //                   child: FutureBuilder(
        //                     future: controller?.getCameraInfo(),
        //                     builder: (context, snapshot) {
        //                       if (snapshot.data != null) {
        //                         return Text(
        //                             'Camera facing ${describeEnum(snapshot.data!)}');
        //                       } else {
        //                         return const Text('loading');
        //                       }
        //                     },
        //                   )),
        //             )
        //           ],
        //         ),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: <Widget>[
        //             Container(
        //               margin: const EdgeInsets.all(8),
        //               child: ElevatedButton(
        //                 onPressed: () async {
        //                   await controller?.pauseCamera();
        //                 },
        //                 child:
        //                     const Text('pause', style: TextStyle(fontSize: 20)),
        //               ),
        //             ),
        //             Container(
        //               margin: const EdgeInsets.all(8),
        //               child: ElevatedButton(
        //                 onPressed: () async {
        //                   await controller?.resumeCamera();
        //                 },
        //                 child: const Text('resume',
        //                     style: TextStyle(fontSize: 20)),
        //               ),
        //             )
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        // )
      ],
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.white,
          borderLength: scanArea / 2,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
