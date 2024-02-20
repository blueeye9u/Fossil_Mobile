import 'package:fossil_mobile/app/provider/app_start_provider.dart';
import 'package:fossil_mobile/features/home/repository/company_repository.dart';
import 'package:fossil_mobile/features/home/state/company_state.dart';
import 'package:fossil_mobile/shared/http/app_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'company_provider.g.dart';

@riverpod
class CompanyNotifier extends _$CompanyNotifier {
  late final CompanyRepository _repository =
      ref.read(companyRepositoryProvider);

  @override
  CompanyState build() {
    final appStartState = ref.watch(appStartNotifierProvider);

    appStartState.when(
      data: (data) {
        data.maybeWhen(
          authenticated: () {
            _fetchCompany();
          },
          orElse: () {},
        );
      },
      loading: () {
        const CompanyState.loading();
      },
      error: (error, stackTrace) {
        const CompanyState.error(AppException.error());
      },
    );
    return const CompanyState.loading();
  }

  Future<void> _fetchCompany() async {
    final response = await _repository.fetchCompany();
    state = response;
  }
}
