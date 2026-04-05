import 'package:nonqueue_app/api/result/result.dart';
import 'package:nonqueue_app/models/company/faq.dart';

import '../../models/company/company_branch.dart';

abstract class CompanyRepository {
  Future<Result<List<CompanyBranch>>> getAllActiveBranch();
  Future<Result<int>> addQuestion(Map<String, dynamic> request);
  Future<Result<List<Faq>>> getAllFaqs();
}
