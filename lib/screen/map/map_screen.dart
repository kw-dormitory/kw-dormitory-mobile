import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:kw_dormitory/constants.dart';
import 'package:kw_dormitory/model/building.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

final webViewKey = GlobalKey<_WebViewMapContainerState>();

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Building> buildings = [
    Building(name: "새빛관", lat: 37.619774, lng: 127.060926),
    Building(name: "참빛관", lat: 37.619207, lng: 127.061013)
  ];
  Building selected = Building(name: "새빛관", lat: 37.619774, lng: 127.060926);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "학교지도",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.circular(12)),
                      width: size.width - 32,
                      child: DropdownButton(
                        underline: Container(),
                        icon: Container(),
                        value: selected,
                        items: buildings
                            .map((e) => DropdownMenuItem<Building>(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: Text("${e.name}"),
                                  ),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (Building? value) {
                          setState(() {
                            selected = value!;
                            webViewKey.currentState?.reloadWebView();
                          });
                        },
                      ),
                    ),
                  ),
                  Positioned(
                      right: 16,
                      top: 0,
                      bottom: 0,
                      child: Icon(
                        Icons.expand_more,
                        color: kGreyColor,
                      ))
                ],
              ),
            ),
            SizedBox(height: 16),
            WebViewMapContainer(lat: selected.lat, lng: selected.lng)
          ],
        ),
      ),
    );
  }
}

class WebViewMapContainer extends StatefulWidget {
  const WebViewMapContainer({Key? key, required this.lat, required this.lng})
      : super(key: key);

  final double lat;
  final double lng;

  @override
  State<WebViewMapContainer> createState() => _WebViewMapContainerState();
}

class _WebViewMapContainerState extends State<WebViewMapContainer> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return KakaoMapView(
      width: size.width - 32,
      height: size.height - 225,
      kakaoMapKey: "f2f5a7dba70d2c2462ebea60a1877083",
      lat: widget.lat,
      lng: widget.lng,
      showMapTypeControl: true,
      showZoomControl: true,
      mapWidgetKey: webViewKey,
      mapController: (p0) {
        controller = p0;
      },
    );
  }

  void reloadWebView() {
    controller.reload();
  }
}
