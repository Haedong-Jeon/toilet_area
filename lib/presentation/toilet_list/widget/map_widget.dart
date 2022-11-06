import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui';

import 'package:vibration/vibration.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:toilet_area/data/keys.dart';
import 'package:toilet_area/di/ad/ad_setup.dart';
import 'package:toilet_area/di/map/map_setup.dart';
import 'package:toilet_area/di/text/text_setup.dart';
import 'package:toilet_area/di/toilet/toilet_setup.dart';
import 'package:toilet_area/di/user/user_setup.dart';
import 'package:toilet_area/domain/model/toilet/toilet.dart';
import 'package:toilet_area/presentation/text/view_model/text_view_model.dart';
import 'package:toilet_area/presentation/toilet_list/view_model/toilet_list_view_model.dart';
import 'package:toilet_area/presentation/toilet_list/widget/map_detail_modal.dart';
import 'package:toilet_area/presentation/user/view_model/user_view_model.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MapWidget extends ConsumerStatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends ConsumerState<MapWidget> {
  final Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? googleMapController;
  late Future getPos;
  late BannerAd adBanner;
  double userZoom = 16;
  Set<Marker> markers = {};

  @override
  void initState() {
    // TODO: implement initState
    ToiletListViewModel toiletListViewModel =
        ref.read(toiletListViewModelProvider.notifier);

    UserViewModel userViewModel = ref.read(userViewModelProvider.notifier);
    adBanner = BannerAd(
      size: AdSize.banner,
      adUnitId: ref.read(adViewModelProvider).bannerTestKey,
      listener: AdManagerBannerAdListener(),
      request: const AdRequest(),
    )..load();

    toiletListViewModel.uiEventStream.listen((event) {
      event.when(
        onLoading: () {},
        onError: (_) {},
        onSuccess: () {
          setState(() {});
        },
      );
    });
    userViewModel.getPositionStreamUseCase().listen((userPos) {
      if (hasDestination()) {
        bool isNear = userViewModel.checkIsDestNear(
            curLat: userPos.latitude, curLng: userPos.longitude);
        if (isNear) {
          print("near");
          try {
            Vibration.vibrate();
          } catch (_) {
            //혹시 진동 못 하는 기계일 수도 있음.
          }
        } else {
          print("not near");
        }
      }
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
      bool destMarker = ref.watch(userViewModelProvider).destLat == latitude &&
          ref.watch(userViewModelProvider).destLng == longitude;
      Marker marker = Marker(
        markerId: MarkerId(element.lnmadr ?? ""),
        position: LatLng(latitude, longitude),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          (hasDestination() && destMarker)
              ? BitmapDescriptor.hueBlue
              : BitmapDescriptor.hueRed,
        ),
        infoWindow: InfoWindow(
            title: element.toiletNm ??
                ref.read(textViewModelProvider).noNameToilet,
            snippet: element.lnmadr ?? "",
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return MapDetailModal(toilet: element);
                  });
            }),
      );
      toiletMarkers.add(marker);
    }

    return toiletMarkers;
  }

  bool hasDestination() {
    return ref.watch(userViewModelProvider).destLat != null &&
        ref.watch(userViewModelProvider).destLat != 0 &&
        ref.watch(userViewModelProvider).destLat != null &&
        ref.watch(userViewModelProvider).destLat != 0;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    UserViewModel userViewModel = ref.watch(userViewModelProvider.notifier);
    TextViewModel textViewModel = ref.watch(textViewModelProvider.notifier);

    setMapController();
    markers = Set.from(
      setToiletMarkers(
        ref.read(
          toiletListViewModelProvider,
        ),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: AdWidget(
                ad: adBanner,
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  SizedBox(
                    width: size.width,
                    child: Builder(builder: (context) {
                      return GoogleMap(
                        markers: markers,
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
                      InkWell(
                        onTap: () {
                          if (!hasDestination()) {
                            return;
                          }
                          showCupertinoDialog(
                              context: context,
                              builder: (context) {
                                return CupertinoAlertDialog(
                                  title: Text(
                                    textViewModel.cancelDestinationAskText(),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        textViewModel.noText(),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        userViewModel.setDestination(
                                            destLng: 0, destLat: 0);
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        textViewModel.yesText(),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 30,
                            width: 300,
                            decoration: BoxDecoration(
                              color: hasDestination()
                                  ? Colors.white
                                  : Colors.grey.withOpacity(0.3),
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
                                    child:
                                        Image.asset("assets/images/siren.png"),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    hasDestination()
                                        ? "${textViewModel.destText()}: ${userViewModel.getDestName()}"
                                        : textViewModel.findToiletInRange(),
                                    style: TextStyle(
                                      color: hasDestination()
                                          ? Colors.blue
                                          : Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child:
                                        Image.asset("assets/images/siren.png"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
