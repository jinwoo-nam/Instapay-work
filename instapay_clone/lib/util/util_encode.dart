import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';

String zLibInflate(String json) {
  ZLibCodec myZlib = ZLibCodec(
    raw: true,
  );

  List<int> ZEncode = myZlib.encode(utf8.encode(json));

  return base64.encode(ZEncode);
}

String sha1HmacEncode(String message,String key) {
  final hmacSha1 = Hmac(sha1,utf8.encode(key));
  final res = hmacSha1.convert(utf8.encode(message));

  return base64.encode(res.bytes);
}

