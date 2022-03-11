import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/setting/notice_list_data.dart';
import 'package:instapay_clone/domain/model/setting/service_termination_reason_data.dart';
import 'package:instapay_clone/domain/model/setting/setting_list_data.dart';
import 'package:instapay_clone/domain/model/setting/terms_of_use_list_data.dart';

abstract class SettingRepository {
  Future<Result<List<NoticeListData>>> getNoticeListData();
  Future<List<SettingListData>> getSettingListData();
  Future<List<TermsOfUseListData>> getTermsOfUseListData();
  Future<List<ServiceTerminationReasonData>> getServiceTerminationReasonData();
}