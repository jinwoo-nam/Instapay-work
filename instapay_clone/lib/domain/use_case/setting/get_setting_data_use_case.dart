import 'package:instapay_clone/domain/model/setting/service_termination_reason_data.dart';
import 'package:instapay_clone/domain/model/setting/setting_list_data.dart';
import 'package:instapay_clone/domain/model/setting/terms_of_use_list_data.dart';
import 'package:instapay_clone/domain/repository/setting/setting_repository.dart';

class GetSettingDataUseCase {
  SettingRepository repository;

  GetSettingDataUseCase(this.repository);

  Future<List<SettingListData>> getSettingListData() async {
    final settingData = await repository.getSettingListData();

    return settingData;
  }

  Future<List<TermsOfUseListData>> getTermsOfUseListData() async {
    final termsOfUseData = await repository.getTermsOfUseListData();

    return termsOfUseData;
  }

  Future<List<ServiceTerminationReasonData>> getServiceTerminationReasonData() async {
    final terminationReasonData =
        await repository.getServiceTerminationReasonData();

    return terminationReasonData;
  }
}
