import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:toilet_area/di/set_up.dart';
import 'package:toilet_area/presentation/toilet_list/view_model/toilet_list_view_model.dart';
import 'package:toilet_area/presentation/user/view_model/user_view_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends ConsumerStatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends ConsumerState<MapWidget> {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? googleMapController;
  double userZoom = 16;

  void setMapController() async {
    googleMapController = await _controller.future;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ToiletListViewModel toiletListViewModel =
        ref.watch(toiletListViewModelProvider.notifier);
    UserViewModel userViewModel = ref.watch(userViewModelProvider.notifier);
    setMapController();
    return StreamBuilder<Position?>(
        stream: userViewModel.getPositionStream(),
        builder: (context, snapshot) {
          double latitude = (snapshot.data?.latitude ?? -1);
          double longitude = (snapshot.data?.longitude ?? -1);

          return SizedBox(
            width: size.width,
            height: size.height - 300,
            child: GoogleMap(
              myLocationEnabled: true,
              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,
              onMapCreated: (mapController) {
                _controller.complete(mapController);
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  snapshot.data?.latitude ?? 0,
                  snapshot.data?.longitude ?? 0,
                ),
              ),
            ),
          );
        });
  }
}
