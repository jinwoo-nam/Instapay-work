import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

enum LoginResult { email, pin, ok, none }

String currencyFormat(int price) {
  var format = NumberFormat('###,###,### KRW');
  return format.format(price);
}

void launchURL(String query) async {
  if (!await launchUrl(Uri.parse(query))) throw 'Could not launch $query';
}

