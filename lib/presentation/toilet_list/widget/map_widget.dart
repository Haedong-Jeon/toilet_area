import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:toilet_area/di/ad/ad_setup.dart';
import 'package:toilet_area/di/text/text_setup.dart';
import 'package:toilet_area/di/toilet/toilet_setup.dart';
import 'package:toilet_area/di/user/user_setup.dart';
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
  BitmapDescriptor userMarker = BitmapDescriptor.defaultMarker;

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
    super.initState();
  }

  void setMapController() async {
    googleMapController = await _controller.future;
  }

  void makeUserMarker() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/images/crying.png")
        .then((icon) {
      setState(() {
        userMarker = icon;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ToiletListViewModel toiletListViewModel =
        ref.watch(toiletListViewModelProvider.notifier);
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
                    child: GoogleMap(
                      markers: {
                        Marker(
                          markerId: const MarkerId("me"),
                          icon: userMarker,
                          position: LatLng(
                            userViewModel.getUserLatitude(),
                            userViewModel.getUserLongitude(),
                          ),
                        ),
                        Marker(
                          markerId: const MarkerId("you"),
                          position: LatLng(
                            userViewModel.getUserLatitude() + 1,
                            userViewModel.getUserLongitude() + 5,
                          ),
                        ),
                      },
                      myLocationEnabled: true,
                      zoomControlsEnabled: true,
                      zoomGesturesEnabled: true,
                      onMapCreated: (mapController) {
                        _controller.complete(mapController);
                        makeUserMarker();
                      },
                      initialCameraPosition: CameraPosition(
                        zoom: 16.5,
                        target: LatLng(
                          userViewModel.getUserLatitude(),
                          userViewModel.getUserLongitude(),
                        ),
                      ),
                    ),
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
