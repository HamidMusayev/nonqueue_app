import 'package:nonqueue_app/api/abstract/company_repository.dart';
import 'package:nonqueue_app/api/result/result.dart';
import 'package:nonqueue_app/models/company/company_branch.dart';
import 'package:nonqueue_app/models/company/faq.dart';

/// Offline demo data for partners, FAQ, and help submissions.
class MockCompanyRepository implements CompanyRepository {
  static final List<CompanyBranch> _branches = [
    CompanyBranch(
      id: 1,
      name: 'Gunna Coffee (demo)',
      companyId: 101,
      description: 'Cozy corner café — mock data',
      locationX: 49.81,
      locationY: 40.39,
      adress: '28 May St, Baku (demo)',
      stars: 4.7,
      status: 'Active',
    ),
    CompanyBranch(
      id: 2,
      name: 'Starbeans (demo)',
      companyId: 102,
      description: 'Quick coffee & snacks',
      locationX: 49.82,
      locationY: 40.40,
      adress: 'Nizami St, Baku (demo)',
      stars: 4.5,
      status: 'Active',
    ),
    CompanyBranch(
      id: 3,
      name: 'McCafé Corner (demo)',
      companyId: 103,
      description: 'Family friendly',
      locationX: 49.80,
      locationY: 40.38,
      adress: 'Port Baku (demo)',
      stars: 4.2,
      status: 'Active',
    ),
    CompanyBranch(
      id: 4,
      name: 'Local Bistro (demo)',
      companyId: 104,
      description: 'Lunch specials',
      locationX: 49.83,
      locationY: 40.37,
      adress: 'Old City (demo)',
      stars: 4.9,
      status: 'Active',
    ),
  ];

  static final List<Faq> _faqs = [
    Faq(
      id: 1,
      question: 'What is Non Queue?',
      answer:
          'This is demo copy. Non Queue lets you order ahead and skip the line.',
    ),
    Faq(
      id: 2,
      question: 'Is this real data?',
      answer:
          'No — the API is offline. This screen uses mock FAQs for demonstrations.',
    ),
    Faq(
      id: 3,
      question: 'How do I use bonuses?',
      answer:
          'Demo: open Bonuses, pick an offer, and follow the steps (UI only in mock mode).',
    ),
  ];

  @override
  Future<Result<List<CompanyBranch>>> getAllActiveBranch() async {
    return Success<List<CompanyBranch>>(List<CompanyBranch>.from(_branches));
  }

  @override
  Future<Result<int>> addQuestion(Map<String, dynamic> request) async {
    return const Success<int>(1, message: 'Question recorded (demo).');
  }

  @override
  Future<Result<List<Faq>>> getAllFaqs() async {
    return Success<List<Faq>>(List<Faq>.from(_faqs));
  }
}
