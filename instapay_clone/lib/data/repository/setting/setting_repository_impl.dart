import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/data/data_source/setting/get_notice_data_source.dart';
import 'package:instapay_clone/domain/model/setting/notice_list_data.dart';
import 'package:instapay_clone/domain/model/setting/service_termination_reason_data.dart';
import 'package:instapay_clone/domain/model/setting/setting_list_data.dart';
import 'package:instapay_clone/domain/model/setting/terms_of_use_list_data.dart';
import 'package:instapay_clone/domain/repository/setting/setting_repository.dart';

class SettingRepositoryImpl implements SettingRepository {
  final _dataSource = GetNoticeDataSource();

  @override
  Future<Result<List<NoticeListData>>> getNoticeListData() async {
    return await _dataSource.getNoticeList();
  }


  @override
  Future<List<SettingListData>> getSettingListData() async {
    return settingList;
  }

  @override
  Future<List<TermsOfUseListData>> getTermsOfUseListData() async {
    return termsOfUseList;
  }

  @override
  Future<List<ServiceTerminationReasonData>> getServiceTerminationReasonData() async {
    return reasonList;
  }
}


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

final List<ServiceTerminationReasonData> reasonList = [
  ServiceTerminationReasonData(title: '필요없음 (유용하지 않음)',type: ServiceTerminationReasonType.Useless),
  ServiceTerminationReasonData(title: '이용이 불편함',type: ServiceTerminationReasonType.UnComfortable),
  ServiceTerminationReasonData(title: '잦은 소프트웨어 오류',type: ServiceTerminationReasonType.SoftwareIssues),
  ServiceTerminationReasonData(title: '개인정보 유출 등 보안 우려',type: ServiceTerminationReasonType.SecurityIssues),
  ServiceTerminationReasonData(title: '사용 가능한 은행계좌나 신용카드가 없음',type: ServiceTerminationReasonType.NoAccount),
  ServiceTerminationReasonData(title: '시험삼아 사용해봄',type: ServiceTerminationReasonType.Testing),
  ServiceTerminationReasonData(title: '기타',type: ServiceTerminationReasonType.Etc),
];
