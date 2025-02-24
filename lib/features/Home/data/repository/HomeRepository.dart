import 'package:dartz/dartz.dart';
import 'package:shoppe_ui/dataProviders/error/failures.dart';
import 'package:shoppe_ui/dataProviders/local_data_provider.dart';
import 'package:shoppe_ui/dataProviders/network/Network_info.dart';
import 'package:shoppe_ui/dataProviders/network/data_source_url.dart';
import 'package:shoppe_ui/dataProviders/remote_data_provider.dart';
import 'package:shoppe_ui/dataProviders/repository.dart';
import 'package:shoppe_ui/features/Home/data/model/CarouselModel.dart';
import 'package:shoppe_ui/features/Home/data/model/CategoriesModel.dart';
import 'package:shoppe_ui/features/Product/data/model/ProductModel.dart';


class HomeRepository extends Repository {
  final RemoteDataProvider remoteDataProvider; //get the data from the internet
  final NetworkInfo networkInfo; //check if the device is connected to internet
  final LocalDataProvider localDataProvider;
  HomeRepository({
    required this.remoteDataProvider,
    required this.networkInfo,
    required this.localDataProvider
  });

  Future<Either<Failure, dynamic>> carousel() async {
    return await sendRequest(
        checkConnection: networkInfo.isConnected,
        remoteFunction: () async {
         List<CarouselModel> remoteData =
          await remoteDataProvider.getData(
            url: DataSourceURL.carousel,
            returnType: List,
            retrievedDataType: CarouselModel.init(),
          );

          print(remoteData);


          return remoteData;
        },
        getCacheDataFunction: () async {

        });
  }

  // ######################################################

  Future<Either<Failure, dynamic>> categories() async {
    return await sendRequest(
        checkConnection: networkInfo.isConnected,
        remoteFunction: () async {
          List<CategoriesModel> remoteData =
          await remoteDataProvider.getData(
            url: DataSourceURL.categories,
            returnType: List,
            retrievedDataType: CategoriesModel.init(),
          );

          print(remoteData);


          return remoteData;
        },
        getCacheDataFunction: () async {

        });
  }

// ######################################################

  Future<Either<Failure, dynamic>> featured() async {
    return await sendRequest(
        checkConnection: networkInfo.isConnected,
        remoteFunction: () async {
         List<ProductModel> remoteData =
          await remoteDataProvider.getData(
            url: DataSourceURL.featured,
            returnType: List,
            retrievedDataType: ProductModel.init(),
          );

          print(remoteData);


          return remoteData;
        },
        getCacheDataFunction: () async {

        });
  }
}
