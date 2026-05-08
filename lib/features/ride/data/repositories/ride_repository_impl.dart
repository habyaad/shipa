import 'package:latlong2/latlong.dart';
import '../../domain/entities/ride_tracking_entity.dart';
import '../../domain/repositories/ride_repository.dart';
import '../datasources/ride_remote_datasource.dart';

class RideRepositoryImpl implements RideRepository {
  final RideRemoteDataSource remoteDataSource;

  RideRepositoryImpl({required this.remoteDataSource});

  @override
  Stream<RideTrackingEntity> getRideTrackingStream() {
    return remoteDataSource.watchRideTracking();
  }

  @override
  Future<List<LatLng>> getRoutePoints() {
    return remoteDataSource.getRoute();
  }
}
