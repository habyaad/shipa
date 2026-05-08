import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:shipa/features/ride/data/datasources/ride_remote_datasource.dart';
import 'package:shipa/features/ride/data/repositories/ride_repository_impl.dart';
import 'package:shipa/features/ride/domain/entities/ride_tracking_entity.dart';
import 'package:shipa/features/ride/domain/repositories/ride_repository.dart';

final rideRepositoryProvider = Provider<RideRepository>((ref) {
  return RideRepositoryImpl(
    remoteDataSource: MockRideRemoteDataSourceImpl(),
  );
});

final rideRouteProvider = FutureProvider<List<LatLng>>((ref) async {
  final repository = ref.watch(rideRepositoryProvider);
  return repository.getRoutePoints();
});

final rideTrackingProvider = StreamProvider<RideTrackingEntity>((ref) {
  final repository = ref.watch(rideRepositoryProvider);
  return repository.getRideTrackingStream();
});
