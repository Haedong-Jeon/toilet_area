import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:toilet_area/di/set_up.dart';
import 'package:toilet_area/presentation/toilet_list/view_model/toilet_list_view_model.dart';

class MapWidget extends ConsumerStatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends ConsumerState<MapWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ToiletListViewModel toiletListViewModel = ref.watch(toiletListViewModelProvider.notifier);
    return  KakaoMapView(
        width: size.width,
        height:size.height-300,
        kakaoMapKey: toiletListViewModel.getKakaoKey(),
        lat: 33.450701,
        lng: 126.570667,
        showMapTypeControl:false,
        showZoomControl: false,
        markerImageURL: 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',
        onTapMarker: (message) {
          //event callback when the marker is tapped
        });
  }
}
