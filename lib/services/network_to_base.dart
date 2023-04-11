import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:developer' as dev;

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class NetworkToBase {
  static Future<String> getBase64ImageFromNetwork(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    return base64Encode(response.bodyBytes);
  }

  static File fromBase64ToImage(String base64String) {
    Uint8List _bytes = base64.decode(base64String);
    File _myFile = File.fromRawPath(_bytes);
    return _myFile;
  }
  
}



