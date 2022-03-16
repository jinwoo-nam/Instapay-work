import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/setting/notice_list_data.dart';

class GetNoticeDataSource {
  Future<Result<List<NoticeListData>>> getNoticeList() async {
    try {
      return Result.success(noticeList);
    } on Exception catch (e) {
      return Result.error(e.toString());
    }
  }
}

final List<NoticeListData> noticeList = [
  NoticeListData(
    title: '합산 1만원 미만 구매 시 배송비 변경 안내(2021.10.1.)',
    date: '10월 19일 오후 5:51',
    content: '안녕하세요. 사용자님. \n인스타페이를 이용해 주셔서 감사합니다.\n\n'
        '저희 인스타북스에서는 새로운 재정가,연쇄판매 서비스의 도입으로 인해, 구간 도서 등에 다양한 할인율이 적용되었습니다.'
        '이에 따라 구매 가격에 따른 배송비 정책이 아래와 같이 변경되어 공지하오니 양해 바랍니다. \n\n'
        '배송비 부과 기준: 합산 구매가(할인율 적용 후 금액 1만원 미만 시 \n'
        '배송비 : 2,500원(단, 도서산간지역의 경우 추가요금 발생\n'
        '예: 정가 11,000원 도서에는 20% 할인율을 적용하는 경우 8,800원(80%)+2,500원 = 11,300원 결제\n\n'
        '한권의 구매가가 1만원 미만이라 하더라도 동일시점에 여러권을 구매하여 합산 금액이 1만원 이상인 경우에는 종전과 같이 배송비를 환불해 드립니다.\n\n'
        '늘 더 많은 독자 여러분들께서 적은 부담으로 좋은 책을 접하실 수 있도록 비용이나 서비스 측면에서 모두 최선을 다하여 발전하는 인스타페이가 되겠습니다. 감사합니다.',
  ),
  NoticeListData(
      title: '추석 연휴 전후 배송안내 공지(2021.9.6.)',
      date: '9월 6일 오후 11:24',
      content: '안녕하세요. 사용자님. \n인스타페이를 이용해 주셔서 감사합니다.\n\n'
          '추석 연휴 배송 휴무로 인하여 주문하신 도서가 9월 16일 까지 인스타페이 물류에 입고되는 경우에는 추석 연휴 이전 정상적으로 배송될 예정입니다.'
          '다만 추석 연휴를 앞두고 택배 물량이 증가하여 배송지연이 발생할 수 있는 점 양해 부탁드립니다.'
          '9월 16일 까지 물류에 입고되지 못한 도서와 이후 주문된 도서는 추석 연휴 택배사 휴무로 인해 9월 23일부터 순차적으로 배송될 예정이니 주문에 참고해주시길 바랍니다.\n\n '
          '즐겁고 행복한 명절연휴 보내시길 기원합니다. 감사합니다.'),
  NoticeListData(
      title: '하계 휴가철 및 임시 공휴일 배송 안내(2021.8.5.)',
      date: '8월 2일 오후 5:58',
      content: '안녕하세요. 사용자님. \n인스타페이를 이용해 주셔서 감사합니다.\n\n'
          '1. 2021년 출판사 및 배본사 하계휴가(8/5~8)의 영향으로 일부 도서에 대해 배송 지연이 발생할 수 있습니다.\n'
          '재고가 있는 도서는 정상 출고 되며, 배송 지연 사유가 발생하는 주문 건에대해서는 신속히 개별 안내를 드리겠습니다.\n\n'
          '2. 8월 16일(월)은 임시 공휴일로 인한 휴무입니다. 이에따라 16일(월) 주문 건은 주말 주문 건과 취합 하여 다음날 17일(화) 오전에 발주 됩니다.\n\n'
          '안전하고 빠른 배송을 위해 항상 최선을 다하겠습니다.\n '
          '감사합니다.'),
];