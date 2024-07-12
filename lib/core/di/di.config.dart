// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/products/data/api/products_api_manager.dart' as _i5;
import '../../features/products/data/data_sources/products_data_source.dart'
    as _i6;
import '../../features/products/data/data_sources/products_data_source_impl.dart'
    as _i7;
import '../networking/api_consumer.dart' as _i3;
import '../networking/dio_consumer.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.ApiConsumer>(() => _i4.DioConsumer());
    gh.singleton<_i5.ProductsApiManager>(
        () => _i5.ProductsApiManager(gh<_i3.ApiConsumer>()));
    gh.factory<_i6.ProductsDataSource>(
        () => _i7.ProductsDataSourceImpl(gh<_i5.ProductsApiManager>()));
    return this;
  }
}
