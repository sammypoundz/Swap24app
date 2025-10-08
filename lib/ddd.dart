import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color.dart';

class MyWebViewScreen extends StatefulWidget {
  const MyWebViewScreen({super.key});

  @override
  State<MyWebViewScreen> createState() => _MyWebViewScreenState();
}

class _MyWebViewScreenState extends State<MyWebViewScreen> {
  bool _isErrorPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isErrorPage ? _buildErrorPage(context) : _buildWebView(context),
    );
  }

  Widget _buildWebView(BuildContext context) {
    // your WebView logic here
    return Center(child: Text('WebView Content'));
  }

  Widget _buildErrorPage(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, size: 80, color: con),
          const SizedBox(height: 16),
          const Text(
            'Oops!',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Something went wrong.',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: h * 0.008),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: w * 0.95,
            child: const Text(
              'Please check your internet connection or try again later.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isErrorPage = false;
              });
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
