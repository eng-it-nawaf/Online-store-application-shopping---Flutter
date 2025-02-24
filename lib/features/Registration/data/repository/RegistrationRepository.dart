import 'package:dartz/dartz.dart';
import 'package:shoppe_ui/dataProviders/error/failures.dart';
import 'package:shoppe_ui/dataProviders/local_data_provider.dart';
import 'package:shoppe_ui/dataProviders/network/Network_info.dart';
import 'package:shoppe_ui/dataProviders/network/data_source_url.dart';
import 'package:shoppe_ui/dataProviders/remote_data_provider.dart';
import 'package:shoppe_ui/dataProviders/repository.dart';
import 'package:shoppe_ui/features/Registration/data/model/RegistrationModel.dart';


class RegistrationRepository extends Repository {
  final RemoteDataProvider remoteDataProvider; //get the data from the internet
  final NetworkInfo networkInfo; //check if the device is connected to internet
  final LocalDataProvider localDataProvider;
  RegistrationRepository({
    required this.remoteDataProvider,
    required this.networkInfo,
    required this.localDataProvider
  });

  Future<Either<Failure, dynamic>> signUp(String username, String email, String password) async {
    return await sendRequest(
        checkConnection: networkInfo.isConnected,
        remoteFunction: () async {
          RegistrationModel remoteData =
          await remoteDataProvider.sendJsonData(
            url: DataSourceURL.signup,
            returnType: RegistrationModel.init(),
            retrievedDataType: RegistrationModel.init(),
            jsonData: {
              "username": username,
              "password": password,
              "email": email,
            },
          );

          print(remoteData);


          return remoteData;
        },
        getCacheDataFunction: () async {

        });
  }

  Future<Either<Failure, dynamic>> logIn( String username, String password) async {
    return await sendRequest(
        checkConnection: networkInfo.isConnected,
        remoteFunction: () async {
          RegistrationModel remoteData =
          await remoteDataProvider.sendJsonData(
            url: DataSourceURL.login,
            returnType: RegistrationModel.init(),
            retrievedDataType: RegistrationModel.init(),
            jsonData: {
              "username": username,
              "password": password,

            },
          );

          print(remoteData);


          return remoteData;
        },
        getCacheDataFunction: () async {

        });
  }
}
