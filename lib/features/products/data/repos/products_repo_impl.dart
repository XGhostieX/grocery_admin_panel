import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'products_repo.dart';

class ProductsRepoImpl implements ProductsRepo {}

final productsRepoProvider = Provider((ref) => ProductsRepoImpl());
