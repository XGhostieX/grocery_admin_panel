import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dashboard_repo.dart';

class HomeRepoImpl implements DashboardRepo {}

final homeRepoProvider = Provider((ref) => HomeRepoImpl());
