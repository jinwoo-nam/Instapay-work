import 'package:intl/intl.dart';

String currencyFormat(int price) {
  var format = NumberFormat('###,###,### KRW');
  return format.format(price);
}
