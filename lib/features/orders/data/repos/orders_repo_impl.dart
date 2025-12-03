import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {}

final ordersRepoProvider = Provider((ref) => OrdersRepoImpl());
