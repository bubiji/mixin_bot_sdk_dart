import 'package:dio/dio.dart';

import '../../mixin_bot_sdk_dart.dart';
import '../vo/asset.dart';

class AssetApi {
  AssetApi({required this.dio});

  final Dio dio;

  Future<MixinResponse<List<Asset>>> getAssets() =>
      MixinResponse.request<List<Asset>>(dio.get('/assets'));

  Future<MixinResponse<Asset>> getAssetById(String id) =>
      MixinResponse.request<Asset>(dio.get('/assets/$id'));
}
