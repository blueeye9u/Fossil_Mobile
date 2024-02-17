// ignore_for_file: prefer_const_constructors

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fossil_mobile/features/home/model/company.dart';
import 'package:fossil_mobile/features/home/state/company_state.dart';
import 'package:fossil_mobile/shared/http/api_provider.dart';
import 'package:fossil_mobile/shared/http/api_response.dart';
import 'package:fossil_mobile/shared/http/app_exception.dart';

abstract class CompanyRepositoryProtocol {
  Future<CompanyState> fetchCompany();
}

final companyRepositoryProvider = Provider(CompanyRepository.new);

class CompanyRepository implements CompanyRepositoryProtocol {
  CompanyRepository(this._ref);

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;

  @override
  Future<CompanyState> fetchCompany() async {
    final response = await _api.get('/companies');

    response.when(
        success: (success) {},
        error: (error) {
          return CompanyState.error(error);
        });

    if (response is APISuccess) {
      final value = response.value;

      try {
        // print(value as List<dynamic>);

        final companies = companiesFromJson(value as List<dynamic>);
        return CompanyState.companyLoaded(companies);
      } catch (e) {
        return CompanyState.error(AppException.errorWithMessage(e.toString()));
      }
    } else if (response is APIError) {
      return CompanyState.error(response.exception);
    } else {
      return const CompanyState.loading();
    }
  }
}
