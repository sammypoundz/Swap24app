// import 'package:data/preloader.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'color.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// // #docregion platform_imports
// // Import for Android features.
// import 'package:webview_flutter_android/webview_flutter_android.dart';
// // Import for iOS/macOS features.
// import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
//
// class WebViewExample extends StatefulWidget {
//   @override
//   _WebViewExampleState createState() => _WebViewExampleState();
// }
//
// class _WebViewExampleState extends State<WebViewExample> {
//   bool _isErrorPage = false;
//   bool _isLoading = true; // Initial loading state
//   late WebViewController _webViewController;
//
//   @override
//   void initState() {
//     // super.initState();
//     // requestContactPermission(); // Request permission on init
//     //
//     // // Initialize WebView debugging for better insight
//     // if (WebView.platform is SurfaceAndroidWebView) {
//     //   WebView.platform = SurfaceAndroidWebView();
//     // }
//   }
//
//   // Request permission for contacts
//   Future<void> requestContactPermission() async {
//     PermissionStatus status = await Permission.location.request();
//
//     if (status.isGranted) {
//       print('Contact permission granted.');
//       // You can proceed with contact-related operations here
//     } else if (status.isDenied) {
//       print('Contact permission denied.');
//       // Optionally, prompt the user or handle the denied state
//     } else if (status.isPermanentlyDenied) {
//       print('Contact permission permanently denied.');
//       openAppSettings(); // Prompt the user to open app settings
//     }
//   }
//
//   late double h;
//   late double w;
//   Future confirm() {
//     return showModalBottomSheet(
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(70)),
//       ),
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: h * 0.02),
//                 child: Text(
//                   'Confirm Payment',
//                   style: TextStyle(fontSize: h * 0.02),
//                 ),
//               ),
//               Padding(
//                   padding:
//                   EdgeInsets.symmetric(horizontal: h * 0.03, vertical: 0),
//                   child: Container(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: h * 0.015, vertical: w * 0.012),
//                     decoration: BoxDecoration(
//                         color: Color.fromRGBO(0, 149, 255, 0.2),
//                         borderRadius: BorderRadius.circular(h * 0.02)),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'DISCLAIMER',
//                           style: TextStyle(
//                               color: Color.fromRGBO(5, 72, 120, 1),
//                               fontSize: h * 0.016,
//                               fontWeight: FontWeight.w700),
//                         ),
//                         Text(
//                           'Confirm the payment details are correct before you proceed to avoid mistakes. Successful transfers can not be reversed',
//                           style: TextStyle(
//                               color: Color.fromRGBO(5, 72, 120, 1),
//                               fontSize: h * 0.015,
//                               fontWeight: FontWeight.w400),
//                         ),
//                       ],
//                     ),
//                   )),
//               SizedBox(
//                 height: h * 0.02,
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: w * 0.07,
//                   vertical: h * 0.003,
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'You are paying',
//                           style: TextStyle(
//                             fontSize: h * 0.017,
//                           ),
//                         ),
//                         SizedBox(
//                           width: w * 0.016,
//                         ),
//                         RichText(
//                             text: TextSpan(children: [
//                               TextSpan(
//                                 text: '20',
//                                 style: TextStyle(
//                                   fontSize: h * 0.017,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: '.00',
//                                 style: TextStyle(
//                                   fontSize: h * 0.014,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ]))
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: w * 0.07,
//                   vertical: h * 0.003,
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Customer ID',
//                           style: TextStyle(
//                             fontSize: h * 0.017,
//                           ),
//                         ),
//                         SizedBox(
//                           width: w * 0.016,
//                         ),
//                         RichText(
//                             text: TextSpan(children: [
//                               TextSpan(
//                                 text: '818 965 9926',
//                                 style: TextStyle(
//                                   fontSize: h * 0.015,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: '',
//                                 style: TextStyle(
//                                   fontSize: h * 0.015,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ]))
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: w * 0.07,
//                   vertical: h * 0.003,
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Service Provider',
//                           style: TextStyle(
//                             fontSize: h * 0.017,
//                           ),
//                         ),
//                         SizedBox(
//                           width: w * 0.016,
//                         ),
//                         RichText(
//                             text: TextSpan(children: [
//                               TextSpan(
//                                 text: 'DSTV',
//                                 style: TextStyle(
//                                   fontSize: h * 0.015,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: '',
//                                 style: TextStyle(
//                                   fontSize: h * 0.015,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ]))
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: w * 0.07,
//                   vertical: h * 0.003,
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Service',
//                           style: TextStyle(
//                             fontSize: h * 0.017,
//                           ),
//                         ),
//                         SizedBox(
//                           width: w * 0.016,
//                         ),
//                         RichText(
//                             text: TextSpan(children: [
//                               TextSpan(
//                                 text: 'Cable Subscription',
//                                 style: TextStyle(
//                                   fontSize: h * 0.015,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: '',
//                                 style: TextStyle(
//                                   fontSize: h * 0.015,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ]))
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: w * 0.07,
//                   vertical: h * 0.003,
//                 ),
//                 child: Divider(
//                   color: Color.fromRGBO(0, 0, 0, 0.15),
//                   thickness: 1,
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(
//                     horizontal: h * 0.03, vertical: h * 0.006),
//                 decoration: BoxDecoration(),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text('Payment Method',
//                         style: TextStyle(fontSize: h * 0.018)),
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(
//                   horizontal: h * 0.03,
//                 ),
//                 padding: EdgeInsets.symmetric(
//                     horizontal: w * 0.03, vertical: h * 0.003),
//                 decoration: BoxDecoration(
//                     color: Color.fromRGBO(209, 209, 209, 0.2),
//                     borderRadius: BorderRadius.circular(h * 0.02)),
//                 child: Column(
//                   children: [
//                     ListTile(
//                       minVerticalPadding: 0,
//                       contentPadding: EdgeInsets.all(0),
//                       leading: Container(
//                         height: h * 0.1,
//                         child: CircleAvatar(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Image(
//                               image: AssetImage('assets/wallet.png'),
//                             ),
//                           ),
//                           backgroundColor: Color.fromRGBO(0, 149, 255, 0.2),
//                         ),
//                       ),
//                       title: Text(
//                         'Balance (776.77)',
//                         style: TextStyle(fontSize: h * 0.019),
//                       ),
//                       trailing: Image(
//                         image: AssetImage('assets/xm.png'),
//                         height: h * 0.015,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(
//                     horizontal: h * 0.03, vertical: h * 0.006),
//                 padding: EdgeInsets.symmetric(
//                     horizontal: w * 0.03, vertical: h * 0.003),
//                 decoration: BoxDecoration(
//                     color: Color.fromRGBO(209, 209, 209, 0.2),
//                     borderRadius: BorderRadius.circular(h * 0.02)),
//                 child: Column(
//                   children: [
//                     ListTile(
//                         minVerticalPadding: 0,
//                         contentPadding: EdgeInsets.all(0),
//                         leading: Container(
//                           height: h * 0.1,
//                           child: CircleAvatar(
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Image(
//                                 image: AssetImage('assets/cb.png'),
//                               ),
//                             ),
//                             backgroundColor: Color.fromRGBO(0, 149, 255, 0.2),
//                           ),
//                         ),
//                         title: Text(
//                           'CashBack',
//                           style: TextStyle(fontSize: h * 0.019),
//                         ),
//                         // subtitle: Text(
//                         //   'CashBack',
//                         //   style: TextStyle(fontSize: h * 0.019),
//                         // ),
//                         trailing: Container(
//                           padding: EdgeInsets.all(h * 0.004),
//                           decoration: BoxDecoration(
//                               color: Colors.blue,
//                               shape: BoxShape.rectangle,
//                               borderRadius: BorderRadius.circular(h * 0.02)),
//                           child: Text(
//                             'Use now',
//                             style: TextStyle(
//                                 fontSize: h * 0.013, color: Colors.white),
//                           ),
//                         )),
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.pushNamed(context, '/shoptic');
//                 },
//                 child: Container(
//                   height: h * 0.05,
//                   width: w * 0.9,
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(8),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.blue.shade100,
//                         blurRadius: 8,
//                         offset: const Offset(0, 4),
//                         spreadRadius: 2,
//                       ),
//                     ],
//                   ),
//                   child: Center(
//                     child: Text(
//                       'Make Payment',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: h * 0.018,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     h = MediaQuery.of(context).size.height;
//     w = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           // WebView widget
//           _isErrorPage
//               ? _buildErrorPage()
//               : WillPopScope(
//             onWillPop: () async {
//               if (await _webViewController.canGoBack()) {
//                 _webViewController.goBack();
//                 return false;
//               }
//               return true; // Let the system handle the back button if we can't go back in the WebView
//             },
//             child: WebView(
//               initialUrl: 'https://alertpay.com.ng/index',
//               zoomEnabled: false,
//               navigationDelegate: (NavigationRequest request) {
//                 print('Navigating to: ${request.url}');
//                 if (request.url.startsWith(
//                     'https://alertpay.com.ng/index')) {
//                   // Allow navigation
//                   return NavigationDecision.navigate;
//                 }
//                 // Block navigation to other URLs
//                 return NavigationDecision.navigate;
//               },
//               onWebResourceError: (WebResourceError error) {
//                 print('Error loading page: ${error.description}');
//                 setState(() {
//                   _isErrorPage = true;
//                 });
//               },
//               onPageStarted: (String url) {
//                 setState(() {
//                   _isLoading =
//                   true; // Show loader when page starts loading
//                 });
//               },
//               onPageFinished: (String url) {
//                 setState(() {
//                   _isLoading =
//                   false; // Hide loader when page finishes loading
//                 });
//               },
//               // onWebViewCreated: (controller) {
//               //   _webViewController = controller;
//               //
//               //   // Set custom headers if needed
//               //   _webViewController.loadUrl(
//               //     'https://alertpay.com.ng/index',
//               //     headers: {
//               //       'Content-Type': 'application/x-www-form-urlencoded',
//               //       // Add other headers if needed
//               //     },
//               //   );
//               // },
//             ),
//           ),
//
//           // Show custom preloader if loading
//           if (_isLoading)
//             Center(
//               child:
//               PreLoader(), // Replace CircularProgressIndicator with your custom PreLoader
//             ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildErrorPage() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.error, size: 80, color: con),
//           const SizedBox(height: 16),
//           const Text(
//             'Oops!',
//             style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//           ),
//           const Text(
//             'Something went wrong.',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: h * 0.008),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             width: w * 0.95,
//             child: const Text(
//               'Please check your internet connection or try again later.',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 16),
//             ),
//           ),
//           const SizedBox(height: 24),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 _isErrorPage = false;
//               });
//             },
//             child: const Text('Retry'),
//           ),
//         ],
//       ),
//     );
//   }
// }
