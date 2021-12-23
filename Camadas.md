omain
  Entity
  Repository Interface
  UseCase

Infra
  Repository Implementation
  DataSource Interface

External
  DataSource Implementation
    Service(Local, Firebase, Http, Drivers)


    


Service
  Local
    ILocalStorage Interface
    HiveLocalStorage impl
    SharedPreferencesLocalStorage impl
    SQFliteLocalStorage impl

  Http
    ICustomHttpClient Interface
    DioHttpClient impl
    UnoHttpClient impl



Domain  
  IGetCarsUsecase
    call() -> logic

  GetCarsLocalUsecase implements IGetCarsUsecase
    call() -> super()

  GetCarsRemoteUsecase implements IGetCarsUsecase
    call() -> super()

Store
  IGetCarsUsecase _getCarsUsecase;








Domain  
  IGetCarsUsecase
    call() -> logic

  IGetCarsLocalUsecase
    call() -> IGetCarsUsecase()

  IGetCarsRemoteUsecase
    call() -> IGetCarsUsecase()


  GetCarsLocalUsecase implements IGetCarsLocalUsecase
    call() -> super()

  GetCarsRemoteUsecase implements IGetCarsRemoteUsecase
    call() -> super()

Store
  IGetCarsUsecase _getCarsUsecase;


result = handleConnectivity(_getCarsLocalUsecase, _getCarsRemoteUsecase)

Store
  Future<T> handleConnectivity<T>( Function local, Function remote, Map data){
    if(hasConnection) return await remote(data)
    else return await local(data)
  }
