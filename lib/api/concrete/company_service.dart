import 'package:get/get_utils/get_utils.dart';
import 'package:nonqueue_app/api/abstract/api_repository.dart';
import 'package:nonqueue_app/api/abstract/company_repository.dart';
import 'package:nonqueue_app/api/api_response_parser.dart';
import 'package:nonqueue_app/api/result/result.dart';
import 'package:nonqueue_app/core/app_config.dart';
import 'package:nonqueue_app/models/company/faq.dart';
import 'package:nonqueue_app/models/user/token_response.dart';
import 'package:nonqueue_app/utils/shared.dart';

import '../../models/company/company_branch.dart';

class CompanyService implements CompanyRepository {
  CompanyService(this._api);

  final ApiRepository _api;
  final String _baseUrl = AppConfig.companyApiBase;

  Future<String?> _accessToken() async {
    final map = await SharedHelper.readJsonMap('token');
    if (map == null) return null;
    return TokenResponse.fromJson(map).accessToken;
  }

  @override
  Future<Result<List<CompanyBranch>>> getAllActiveBranch() async {
    final token = await _accessToken();
    if (token == null) {
      return Failure<List<CompanyBranch>>('eauthor'.tr);
    }
    final res = await _api.get(
      '$_baseUrl/product/CompanyBranch/GetAllActiveBranch',
      token: token,
    );
    return ApiResponseParser.parseMap(res, (v) {
      final list = (v as List<dynamic>)
          .map(
            (e) => CompanyBranch.fromJson(e as Map<String, dynamic>),
          )
          .toList();
      return list;
    });
  }

  @override
  Future<Result<int>> addQuestion(Map<String, dynamic> request) async {
    final token = await _accessToken();
    if (token == null) {
      return Failure<int>('eauthor'.tr);
    }
    final res = await _api.post(
      request,
      '$_baseUrl/product/Questions/Add',
      token: token,
    );
    return ApiResponseParser.parseMap(res, (v) => (v as num).toInt());
  }

  @override
  Future<Result<List<Faq>>> getAllFaqs() async {
    final token = await _accessToken();
    if (token == null) {
      return Failure<List<Faq>>('eauthor'.tr);
    }
    final res = await _api.get(
      '$_baseUrl/product/faq/getall',
      token: token,
    );
    return ApiResponseParser.parseMap(res, (v) {
      final list = (v as List<dynamic>)
          .map((e) => Faq.fromJson(e as Map<String, dynamic>))
          .toList();
      return list;
    });
  }
}
