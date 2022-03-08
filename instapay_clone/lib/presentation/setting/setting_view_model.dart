import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/notice_list_data.dart';
import 'package:instapay_clone/domain/model/service_termination_reason_data.dart';
import 'package:instapay_clone/domain/model/setting_list_data.dart';
import 'package:instapay_clone/domain/model/terms_of_use_list_data.dart';

class SettingViewModel with ChangeNotifier {
  final settingList = [
    SettingListData(
        title: '결제코드 변경',
        isTrailing: true,
        type: SettingType.paymentCodeChange),
    SettingListData(
        title: '주소지',
        isTrailing: true,
        type: SettingType.address,
        subTitle: '등록된 주소지가 없습니다.'),
    SettingListData(
        title: '앱 정보',
        isTrailing: false,
        type: SettingType.appVersion,
        subTitle: '1.1.93-relase'),
    SettingListData(title: '공지 사항', isTrailing: true, type: SettingType.notice),
    SettingListData(
        title: '이용 약관', isTrailing: true, type: SettingType.termsOfUse),
    SettingListData(title: '문의하기', isTrailing: true, type: SettingType.inquiry),
    SettingListData(
        title: '서비스 해지',
        isTrailing: true,
        type: SettingType.serviceTermination),
  ];

  final noticeList = [
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

  final termsOfUseList = [
    TermsOfUseListData(
      title: '인스타페이 서비스 이용약관',
      content:
          '제1조(목적)\n\n본 약관은 주식회사 인스타페이(이하 회사)가 제공하는 인스타페이 전자 금융거래 서비스를 이용함에 있어서'
          ' 회사와 회원간의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.\n\n\n\n'
          '제2조(정의)\n\n'
          '본 약관에서 사용하는 용어의 정의는 다음과 같습니다.'
          '1. "인스타페이 전자금융거래 서비스"(이하 "인스타페이 서비스")라 함은 가맹점이 판매하는 상품 또는 서비스(이하 "상품 등")'
          '을 회원이 구입 및 이용 할 수 있도록 회사가 제공하는 전자지급결제대행서비스 및 에스크로 서비스를 총칭합니다.\n\n'
          '2. 회원이라 합은 본 약관에 따라 회사와 인스타페이 서비스 이용계약을 체결하고 '
          '인스타페이 서비스를 이용하여 가맹점의 상품 등을 구매하는 자를 말합니다.',
    ),
    TermsOfUseListData(
      title: '개인정보 취급방침',
      content: '제1조(수집하는 개인정보의 항목 및 수집방법)\n\n\n\n'
          '회사는 서비스 제공에 필요한 최소한의 정보를 수집하며, 회사가 수집하는 개인정보의 항목은 다음과 같습니다.\n\n\n\n'
          '1. 회원가입\n\n'
          '가. 필수 수집항목: 성명, 생년월일, 성별, 휴대폰 번호, 가입통신사, 단말기ID\n'
          '나. 선택 수집항목: 없음\n\n\n\n'
          '2. 결제'
          '가. 필수 수집항목\n\n'
          ' - 은행계좌정보: 은행명, 예금주명, 후단 4자리가 마스킹된 계좌번호\n'
          ' - 신용카드 정보: 카드번호, 유효기간, CVC,비밀번호 2자리 (이 정보는 회사 서버에 저장되지 않으며, 암호화되어 회사가 확인할 수 없습니다.)\n\n'
          '나. 선택 수집항목: 없음'
          ' - 결제한 상품의 배송이 필요한 경우: 배송지 정보',
    ),
    TermsOfUseListData(
      title: '전자금융거래 이용약관',
      content: '제1장 총칙\n\n\n\n'
          '제1조 (목적)\n\n\n\n'
          '본 약관은 회원이 주식회사 인스타페이(이하 "회사"라 함)가 제공하는 전자지급결제대행서비스를 이용함에 있어, '
          '회원과 회사간의 전자금융 거래에 관한 기본적인 사항을 규정함을 목적으로 한다.\n\n\n\n'
          '제2조 (정의)\n\n\n\n'
          '본 약관에서 사용하는 용어의 정의는 다음과 같다.\n'
          '1. "전자금융거래"라 함은 회사가 전자적 장치를 통하여 전자금융업무를 제공하고, 회원이 회사의 종사자와 직접 대면하거나'
          ' 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는 거래를 말한다.\n\n'
          '2. "전자지금거래"라 함은 자금을 주는 자(이하 "지급인"이라 함)가 회사로 하여금 전자지급수단을 이용하여 자금을 받는 자'
        '(이하 "수취인"이라 함)에게 자금을 이동하게 하는 전자금융거래를 말한다.',
    ),
  ];

  final reasonList = [
    ServiceTerminationReasonData(title: '필요없음 (유용하지 않음)',type: ServiceTerminationReasonType.Useless),
    ServiceTerminationReasonData(title: '이용이 불편함',type: ServiceTerminationReasonType.UnComfortable),
    ServiceTerminationReasonData(title: '잦은 소프트웨어 오류',type: ServiceTerminationReasonType.SoftwareIssues),
    ServiceTerminationReasonData(title: '개인정보 유출 등 보안 우려',type: ServiceTerminationReasonType.SecurityIssues),
    ServiceTerminationReasonData(title: '사용 가능한 은행계좌나 신용카드가 없음',type: ServiceTerminationReasonType.NoAccount),
    ServiceTerminationReasonData(title: '시험삼아 사용해봄',type: ServiceTerminationReasonType.Testing),
    ServiceTerminationReasonData(title: '기타',type: ServiceTerminationReasonType.Etc),
  ];


}
