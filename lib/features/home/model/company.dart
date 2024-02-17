// user.dart
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'company.freezed.dart';
// part 'company.g.dart';

List<Company> companiesFromJson(List<dynamic> data) => List<Company>.from(
    data.map((x) => Company.fromJson(x as Map<String, dynamic>)));

Company companyFromJson(String str) =>
    Company.fromJson(json.decode(str) as Map<String, dynamic>);

@freezed
class Company with _$Company {
  const Company._();

  const factory Company({
    @JsonKey(name: 'company_id') required int companyId,
    @JsonKey(name: 'company_name') required String companyName,
    @JsonKey(name: 'company_number') required String companyNumber,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      companyId: json['company_id'] as int,
      companyName: json['company_name'] as String,
      companyNumber: json['company_number'] as String,
    );
  }
}
