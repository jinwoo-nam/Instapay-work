import 'package:instapay_clone/domain/model/setting/notice_list_data.dart';
import 'package:instapay_clone/domain/repository/setting/setting_repository.dart';

import '../../../core/result.dart';

class GetNoticeDataUseCase {
  SettingRepository repository;

  GetNoticeDataUseCase(this.repository);

  Future<Result<List<NoticeListData>>> getNoticeListData() async {
    final noticeList = await repository.getNoticeListData();

    return noticeList.when(success: (noticeList) {
      return Result.success(noticeList);
    }, error: (message) {
      return Result.error(message);
    });
  }
}