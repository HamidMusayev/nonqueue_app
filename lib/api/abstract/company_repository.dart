import 'package:nonqueue_app/api/result/result.dart';

import '../../models/company/company_branch.dart';

abstract class CompanyRepository {
  Future<Result<List<CompanyBranch>>> getAllActiveBranch();
}
