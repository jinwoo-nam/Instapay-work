import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:instapay_clone/data/data_source/app_setting/app_setting_db.dart';
import 'package:instapay_clone/data/data_source/local/key_result_data_source.dart';
import 'package:instapay_clone/data/data_source/local/local_db_data_source.dart';
import 'package:instapay_clone/data/data_source/local/login_info_data_source.dart';
import 'package:instapay_clone/data/data_source/local/pin_code_data_source.dart';
import 'package:instapay_clone/data/data_source/setting/get_notice_data_source.dart';
import 'package:instapay_clone/data/data_source/signup/signup_api.dart';
import 'package:instapay_clone/data/repository/app_setting/app_setting_repository_impl.dart';
import 'package:instapay_clone/data/repository/juso/jip_zip_repository_impl.dart';
import 'package:instapay_clone/data/repository/juso/juso_repository_impl.dart';
import 'package:instapay_clone/data/repository/kfc/kfc_repository_impl.dart';
import 'package:instapay_clone/data/repository/local/key_result_repository_impl.dart';
import 'package:instapay_clone/data/repository/local/login_info_repository_impl.dart';
import 'package:instapay_clone/data/repository/local/login_pack_repository_impl.dart';
import 'package:instapay_clone/data/repository/local/pin_code_repository_impl.dart';
import 'package:instapay_clone/data/repository/means/means_repository_impl.dart';
import 'package:instapay_clone/data/repository/my_wallet/add_bank_account_repository_impl.dart';
import 'package:instapay_clone/data/repository/my_wallet/delete_bank_account_repository_impl.dart';
import 'package:instapay_clone/data/repository/my_wallet/get_bank_account_repository_impl.dart';
import 'package:instapay_clone/data/repository/qr_pay/search_isbn_repository_impl.dart';
import 'package:instapay_clone/data/repository/quest/question_repository_impl.dart';
import 'package:instapay_clone/data/repository/setting/delete_address_repository_impl.dart';
import 'package:instapay_clone/data/repository/setting/get_address_repository_impl.dart';
import 'package:instapay_clone/data/repository/setting/register_address_repository_impl.dart';
import 'package:instapay_clone/data/repository/setting/search_address_repository_impl.dart';
import 'package:instapay_clone/data/repository/setting/setting_repository_impl.dart';
import 'package:instapay_clone/data/repository/signup/key_repository_impl.dart';
import 'package:instapay_clone/data/repository/signup/signup_repository_impl.dart';
import 'package:instapay_clone/domain/use_case/app_setting/app_setting_use_case.dart';
import 'package:instapay_clone/domain/use_case/juso/create_juso_use_case.dart';
import 'package:instapay_clone/domain/use_case/juso/delete_juso_use_case.dart';
import 'package:instapay_clone/domain/use_case/juso/get_jip_zip_use_case.dart';
import 'package:instapay_clone/domain/use_case/juso/get_juso_use_case.dart';
import 'package:instapay_clone/domain/use_case/juso/update_juso_use_case.dart';
import 'package:instapay_clone/domain/use_case/kfc/kfc_use_case.dart';
import 'package:instapay_clone/domain/use_case/local/login_info_use_case.dart';
import 'package:instapay_clone/domain/use_case/local/login_pack_use_case.dart';
import 'package:instapay_clone/domain/use_case/local/pin_code_use_case.dart';
import 'package:instapay_clone/domain/use_case/means/delete_means_use_cacse.dart';
import 'package:instapay_clone/domain/use_case/means/get_default_means_use_case.dart';
import 'package:instapay_clone/domain/use_case/means/get_means_use_case.dart';
import 'package:instapay_clone/domain/use_case/means/update_means_use_case.dart';
import 'package:instapay_clone/domain/use_case/my_wallet/add_bank_account_use_case.dart';
import 'package:instapay_clone/domain/use_case/my_wallet/delete_bank_account_use_case.dart';
import 'package:instapay_clone/domain/use_case/my_wallet/get_bank_account_use_case.dart';
import 'package:instapay_clone/domain/use_case/qr_pay/search_isbn_use_case.dart';
import 'package:instapay_clone/domain/use_case/quest/question_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/delete_address_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/get_address_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/get_notice_data_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/get_setting_data_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/register_address_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/search_address_use_case.dart';
import 'package:instapay_clone/domain/use_case/signup/key_use_case.dart';
import 'package:instapay_clone/domain/use_case/signup/login_use_case.dart';
import 'package:instapay_clone/presentation/kfc/kfc_view_model.dart';
import 'package:instapay_clone/presentation/main_page/main_screen_view_model.dart';
import 'package:instapay_clone/presentation/my_wallet/my_wallet_view_model.dart';
import 'package:instapay_clone/presentation/qr_pay/qr_pay_view_model.dart';
import 'package:instapay_clone/presentation/root_page/root_view_model.dart';
import 'package:instapay_clone/presentation/setting/setting_view_model.dart';
import 'package:instapay_clone/presentation/sign_in/sign_in_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sqflite/sqflite.dart';

Future<List<SingleChildWidget>> getProviders() async {
  final client = http.Client();

  final db = await openDatabase(
    'app_setting.db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE app_setting (isStartApp INTEGER, isAgreeTerms INTEGER)');
    },
  );

  final localDb = AppSettingDb(db);
  final appSettingRepository = AppSettingRepositoryImpl(localDb);

  final settingRepository =
      SettingRepositoryImpl(GetNoticeDataSource(client: client));
  final searchAddressRepository = SearchAddressRepositoryImpl();
  final getAddressRepository = GetAddressRepositoryImpl();
  final registerAddressRepository = RegisterAddressRepositoryImpl();
  final deleteAddressRepository = DeleteAddressRepositoryImpl();
  final getBankAccountRepository = GetBankAccountRepositoryImpl();
  final addBankAccountRepository = AddBankAccountRepositoryImpl();
  final deleteBankAccountRepository = DeleteBankAccountRepositoryImpl();

  final getBankAccountUseCase = GetBankAccountUseCase(getBankAccountRepository);
  final getAddressUseCase = GetAddressUseCase(getAddressRepository);
  final addBankAccountUseCase = AddBankAccountUseCase(addBankAccountRepository);
  final searchIsbnRepository = SearchISBNRepositoryImpl();

  const secyreLocalDB = FlutterSecureStorage();
  final localDbDataSource = LocalDbDataSource(secyreLocalDB);
  final loginInfoDataSource = LoginInfoDataSource(secyreLocalDB);
  final loginInfoRepository = LoginInfoRepositoryImpl(loginInfoDataSource);

  final pinCodeDataSource = PinCodeDataSource(secyreLocalDB);
  final pinCodeUseCase =
      PinCodeUseCase(PinCodeRepositoryImpl(pinCodeDataSource));
  final loginInfoUseCase = LoginInfoUseCase(loginInfoRepository);
  final keyUseCase = KeyUseCase(
    keyRepository: KeyRepositoryImpl(),
    keyResultRepository:
        KeyResultRepositoryImpl(KeyResultDataSource(secyreLocalDB)),
  );

  final meansRepository = MeansRepositoryImpl();

  final kfcRepository = KfcRepositoryImpl();
  final loginPackRepository = LoginPackRepositoryImpl(localDbDataSource);
  final loginUseCase = LoginUseCase(
    repository: SignupRepositoryImpl(SignupApi()),
    loginInfoRepository: loginInfoRepository,
    loginPackRepository: loginPackRepository,
  );

  final jusoRepository = JusoRepositoryImpl();

  return [
    ChangeNotifierProvider<RootViewModel>(
      create: (context) => RootViewModel(
        appSetting: AppSettingUseCase(appSettingRepository),
        pinCodeUseCase: pinCodeUseCase,
        loginPackUseCacse: LoginPackUseCase(loginPackRepository),
        loginUsecase: loginUseCase,
      ),
    ),
    ChangeNotifierProvider<MainScreenViewModel>(
      create: (context) => MainScreenViewModel(),
    ),
    ChangeNotifierProvider<MyWalletViewModel>(
      create: (context) => MyWalletViewModel(
        getBankAccountUseCase: getBankAccountUseCase,
        addBankAccountUseCase: addBankAccountUseCase,
        deleteBankAccountUseCase:
            DeleteBankAccountUseCase(deleteBankAccountRepository),
        getMeansUseCase: GetMeansUseCase(
          meansRepository: meansRepository,
          loginInfoRepository: loginInfoRepository,
        ),
        updateMeansUseCase: UpdateMeansUseCase(
          meansRepository: meansRepository,
          loginInfoRepository: loginInfoRepository,
        ),
        getDefaultMeansUseCase: GetDefaultMeansUseCase(
          meansRepository: meansRepository,
          loginInfoRepository: loginInfoRepository,
        ),
        deleteMeansUseCase: DeleteMeansUseCase(
          meansRepository: meansRepository,
          loginInfoRepository: loginInfoRepository,
        ),
      ),
    ),
    ChangeNotifierProvider<SettingViewModel>(
      create: (context) => SettingViewModel(
        getSettingDataUseCase: GetSettingDataUseCase(settingRepository),
        getNoticeDataUseCase: GetNoticeDataUseCase(settingRepository),
        searchAddressUseCase: SearchAddressUseCase(searchAddressRepository),
        getAddressUseCase: getAddressUseCase,
        registerAddressUseCase:
            RegisterAddressUseCase(registerAddressRepository),
        deleteAddressUseCase: DeleteAddressUseCase(deleteAddressRepository),
        pinCodeUseCase: pinCodeUseCase,
        loginInfoUseCase: loginInfoUseCase,
        keyUseCase: keyUseCase,
        questionUseCase: QuestionUseCase(
          loginInfoRepository: loginInfoRepository,
          questionRepository: QuestionRepositoryImpl(),
        ),
        getJusoUseCase: GetJusoUseCase(
          loginInfoRepository: loginInfoRepository,
          jusoRepository: jusoRepository,
        ),
        createJusoUseCase: CreateJusoUseCase(
          loginInfoRepository: loginInfoRepository,
          jusoRepository: jusoRepository,
        ),
        deleteJusoUseCase: DeleteJusoUseCase(
          loginInfoRepository: loginInfoRepository,
          jusoRepository: jusoRepository,
        ),
        updateJusoUseCase: UpdateJusoUseCase(
          loginInfoRepository: loginInfoRepository,
          jusoRepository: jusoRepository,
        ),
        getJipZipUseCase: GetJipZipUseCase(
          loginInfoRepository: loginInfoRepository,
          jipZipRepository: JipZipRepositoryImpl(),
        ),
      ),
    ),
    ChangeNotifierProvider<QrPayViewModel>(
      create: (context) => QrPayViewModel(
        getBankAccountUseCase: getBankAccountUseCase,
        getAddressUseCase: getAddressUseCase,
        addBankAccountUseCase: addBankAccountUseCase,
        searchIsbnUseCase: SearchIsbnUseCase(searchIsbnRepository),
      ),
    ),
    ChangeNotifierProvider<SignInViewModel>(
      create: (context) => SignInViewModel(
        loginUsecase: loginUseCase,
      ),
    ),
    ChangeNotifierProvider<KfcViewModel>(
      create: (context) => KfcViewModel(
        kfcUseCase: KfcUseCase(
          kfcRepository: kfcRepository,
          loginInfo: loginInfoRepository,
        ),
      ),
    ),
  ];
}
