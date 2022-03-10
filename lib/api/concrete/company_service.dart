import 'package:nonqueue_app/api/abstract/api_repository.dart';
import 'package:nonqueue_app/api/result/result.dart';
import 'package:nonqueue_app/models/user/token_response.dart';
import 'package:nonqueue_app/utils/shared.dart';

import '../../models/company/company_branch.dart';
import '../abstract/company_repository.dart';

//SERVICE METODLARI ALINAN OBYEKLERI JSON SERIALIZE EDIB
// DIO METODLARINA GONDER VE GERI DONEN CAVABI
// JSON DESERIALIZE EDIB OBYEKT QAYTARIR

class CompanyService implements CompanyRepository {
  final ApiRepository _dio;
  final String _baseUrl = 'http://161.97.137.220:5002';
  CompanyService(this._dio);

  @override
  Future<Result<List<CompanyBranch>>> getAllActiveBranch() async {
    var res = await _dio.get(
      '$_baseUrl/product/CompanyBranch/GetAllActiveBranch',
      token: TokenResponse.fromJson(await SharedHelper.readJson('token'))
          .accessToken,
    );

    if (res.success) {
      if (res.data['success']) {
        List<dynamic> parsed =
        res.data['value'].map((e) => CompanyBranch.fromJson(e)).toList();
        List<CompanyBranch> list = List<CompanyBranch>.from(parsed);
        return Result.succes(list);
      } else {
        return Result.error(message: res.data['message']);
      }
    } else {
      return Result.error(message: res.message);
    }
  }
}
