import 'package:fossil_mobile/features/home/model/company.dart';
import 'package:fossil_mobile/shared/http/app_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_state.freezed.dart';

@freezed
class CompanyState with _$CompanyState {
  const factory CompanyState.loading() = _Loading;

  const factory CompanyState.companyLoaded(List<Company> companies) = _Loaded;

  const factory CompanyState.error(AppException error) = _Error;
}
