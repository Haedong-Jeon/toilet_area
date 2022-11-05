import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:toilet_area/di/ad/ad_setup.dart';
import 'package:toilet_area/di/map/map_setup.dart';
import 'package:toilet_area/di/text/text_setup.dart';
import 'package:toilet_area/di/toilet/toilet_setup.dart';
import 'package:toilet_area/di/user/user_setup.dart';
import 'package:toilet_area/domain/model/toilet/toilet.dart';
import 'package:toilet_area/presentation/text/view_model/text_view_model.dart';
import 'package:toilet_area/presentation/toilet_list/view_model/toilet_list_view_model.dart';
import 'package:toilet_area/presentation/user/view_model/user_view_model.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MapWidget extends ConsumerStatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends ConsumerState<MapWidget> {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? googleMapController;
  late Future getPos;
  late BannerAd adBanner;
  double userZoom = 16;
  BitmapDescriptor toiletMarkerIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    // TODO: implement initState
    adBanner = BannerAd(
      size: AdSize.banner,
      adUnitId: ref.read(adViewModelProvider).bannerTestKey,
      listener: AdManagerBannerAdListener(),
      request: const AdRequest(),
    )..load();

    ref
        .read(userViewModelProvider.notifier)
        .getPositionStreamUseCase()
        .listen((position) {
      ref.read(userViewModelProvider.notifier).saveUserPosition(
            latitude: position.latitude,
            longitude: position.longitude,
          );
    });
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(10, 10)),
            'assets/images/toilet_marker_icon.png')
        .then((d) {
      toiletMarkerIcon = d;
    });

    super.initState();
  }

  void setMapController() async {
    googleMapController = await _controller.future;
  }

  List<Marker> setToiletMarkers(List<Toilet> toilets) {
    List<Marker> toiletMarkers = [];
    for (var element in toilets) {
      double? longitude = double.tryParse(element.longitude ?? "");
      double? latitude = double.tryParse(element.latitude ?? "");
      if (longitude == null || latitude == null) {
        continue;
      }
      Marker marker = Marker(
        markerId: MarkerId(element.lnmadr ?? ""),
        position: LatLng(latitude, longitude),
        icon: BitmapDescriptor.defaultMarker,
      );
      toiletMarkers.add(marker);
    }

    return toiletMarkers;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    UserViewModel userViewModel = ref.watch(userViewModelProvider.notifier);
    TextViewModel textViewModel = ref.watch(textViewModelProvider.notifier);
    setMapController();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  SizedBox(
                    width: size.width,
                    child: Builder(builder: (context) {
                      return GoogleMap(
                        markers: Set.from(
                          setToiletMarkers(
                            ref.watch(toiletListViewModelProvider),
                          ),
                        ),
                        myLocationEnabled: true,
                        zoomControlsEnabled: true,
                        zoomGesturesEnabled: true,
                        onMapCreated: (mapController) {
                          _controller.complete(mapController);
                          mapController.setMapStyle(mapStyle);
                        },
                        initialCameraPosition: CameraPosition(
                          zoom: 10,
                          target: LatLng(
                            userViewModel.getUserLatitude(),
                            userViewModel.getUserLongitude(),
                          ),
                        ),
                      );
                    }),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 35),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 30,
                          width: 300,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/images/siren.png"),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  textViewModel.findToiletInOneKilo(),
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/images/siren.png"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 50,
                child: AdWidget(
                  ad: adBanner,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
