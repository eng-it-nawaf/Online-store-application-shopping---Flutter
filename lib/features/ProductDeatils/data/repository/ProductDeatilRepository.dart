import 'package:dartz/dartz.dart';
import 'package:shoppe_ui/dataProviders/error/failures.dart';
import 'package:shoppe_ui/dataProviders/local_data_provider.dart';
import 'package:shoppe_ui/dataProviders/network/Network_info.dart';
import 'package:shoppe_ui/dataProviders/network/data_source_url.dart';
import 'package:shoppe_ui/dataProviders/remote_data_provider.dart';
import 'package:shoppe_ui/dataProviders/repository.dart';
import 'package:shoppe_ui/features/ProductDeatils/data/model/ProductDeatilModel.dart';



class ProductDetailRepository extends Repository {
  final RemoteDataProvider remoteDataProvider; //get the data from the internet
  final NetworkInfo networkInfo; //check if the device is connected to internet
  final LocalDataProvider localDataProvider;
  ProductDetailRepository({
    required this.remoteDataProvider,
    required this.networkInfo,
    required this.localDataProvider
  });

  Future<Either<Failure, dynamic>> getAllProductDeatils(String id) async {
    return await sendRequest(
        checkConnection: networkInfo.isConnected,
        remoteFunction: () async {
          ProductDetailsModel remoteData =
              await remoteDataProvider.getData(
            url: DataSourceURL.getAllproducts+"/"+id,
            returnType: ProductDetailsModel.init(),
            retrievedDataType: ProductDetailsModel.init(),
          );

          print(remoteData);


          return remoteData;
        },
        getCacheDataFunction: () async {

        });
  }
}
