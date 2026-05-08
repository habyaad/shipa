import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shipa/core/configs/app_colors.dart';
import 'package:shipa/core/configs/app_text_styles.dart';
import 'package:shipa/features/ride/domain/entities/ride_tracking_entity.dart';
import 'package:shipa/features/ride/presentation/providers/ride_tracking_provider.dart';
import 'package:shipa/features/ride/presentation/widgets/courier_tracking_card.dart';

class RideTrackingScreen extends ConsumerStatefulWidget {
  const RideTrackingScreen({super.key});

  @override
  ConsumerState<RideTrackingScreen> createState() => _RideTrackingScreenState();
}

class _RideTrackingScreenState extends ConsumerState<RideTrackingScreen>
    with SingleTickerProviderStateMixin {
  final MapController _mapController = MapController();
  bool _isMapReady = false;

  late LatLng _currentCourierLocation;
  RideTrackingEntity? _latestRideTracking;

  late AnimationController _animationController;
  Animation<LatLng>? _latLngAnimation;

  @override
  void initState() {
    super.initState();
    // Default start position until provider loads
    _currentCourierLocation = const LatLng(6.5244, 3.3792);

    _animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
  }

  void _animateToNewLocation(LatLng newLocation) {
    final start = _currentCourierLocation;
    final end = newLocation;

    _latLngAnimation =
        LatLngTween(begin: start, end: end).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.linear),
        )..addListener(() {
          if (!mounted) return;
          setState(() {
            _currentCourierLocation = _latLngAnimation!.value;
          });

          if (_isMapReady) {
            _mapController.move(
              _currentCourierLocation,
              _mapController.camera.zoom,
            );
          }
        });

    _animationController.forward(from: 0);
  }

  void _restartSimulation() {
    // Invalidate the provider to restart the mock stream from the beginning
    ref.invalidate(rideTrackingProvider);

    setState(() {
      _currentCourierLocation = const LatLng(6.5244, 3.3792);
      _latestRideTracking = null;
    });

    if (_isMapReady) {
      _mapController.move(_currentCourierLocation, 15);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final routeAsync = ref.watch(rideRouteProvider);

    // Listen for live courier movement from the mock data source
    ref.listen(rideTrackingProvider, (previous, next) {
      next.whenData((rideTracking) {
        setState(() {
          _latestRideTracking = rideTracking;
        });
        _animateToNewLocation(rideTracking.currentLocation);
      });
    });

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: SvgPicture.asset('assets/svgs/arrow.svg'),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: Text("Live Tracking", style: AppTextStyles.titleMedium),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: _restartSimulation,
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: routeAsync.when(
        data: (routePoints) => Stack(
          children: [
            SafeArea(
              top: false,
              child: FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  initialCenter: routePoints.first,
                  initialZoom: 15,
                  onMapReady: () {
                    _isMapReady = true;
                  },
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.shipa',
                  ),
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: routePoints,
                        color: AppColors.orangeColor,
                        strokeWidth: 8.w,
                      ),
                    ],
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: routePoints.last,
                        width: 30,
                        height: 30,
                        child: SvgPicture.asset('assets/svgs/location.svg'),
                      ),
                      Marker(
                        point: _currentCourierLocation,
                        width: 40,
                        height: 40,
                        child: Image.asset('assets/images/tracker_image.png'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            if (_latestRideTracking != null)
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SafeArea(
                  top: false,
                  child: CourierTrackingCard(
                    rideTracking: _latestRideTracking!,
                  ),
                ),
              ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("Error: $err")),
      ),
    );
  }
}

class LatLngTween extends Tween<LatLng> {
  LatLngTween({required LatLng begin, required LatLng end})
    : super(begin: begin, end: end);

  @override
  LatLng lerp(double t) {
    return LatLng(
      begin!.latitude + (end!.latitude - begin!.latitude) * t,
      begin!.longitude + (end!.longitude - begin!.longitude) * t,
    );
  }
}
