import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vacinaki/app/entities/unities.dart';
import 'package:vacinaki/app/services/call_service.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeStore store;

  final TextEditingController _searchTextEditingController =
      TextEditingController();
  final TextEditingController _addressTextEditingController =
      TextEditingController();
  bool value = false;
  late final Marker? _marker;
  @override
  void initState() {
    super.initState();
    store = Modular.get<HomeStore>();
    store.find("");
    getCurrentLocation();
  }

  @override
  void dispose() {
    Modular.dispose<HomeStore>();
    super.dispose();
    _addressTextEditingController.dispose();
    _searchTextEditingController.dispose();
  }

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vacinaki'),
      ),
      body: ScopedBuilder<HomeStore, Exception, List<Unities>>(
        store: store,
        onState: (_, data) {
          return Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  onChanged: _search,
                  controller: _searchTextEditingController,
                  decoration: const InputDecoration(
                      hintText: "Buscar", border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  onChanged: _search,
                  controller: _addressTextEditingController,
                  decoration: const InputDecoration(
                      hintText: "Endereço", border: OutlineInputBorder()),
                ),
                CheckboxListTile(value: store.visible, onChanged: _onChanged),
                Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 200,
                    child: (store.visible == true && store.center == null)
                        ? const Center(
                            child: Text(
                                "Não foi possível capturar sua Localização."),
                          )
                        : (store.visible == true && store.center != null)
                            ? buildGoogleMap(data)
                            : ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (_, index) => ListTile(
                                  title: Text(data[index]?.name ?? ""),
                                  subtitle: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(data[index]?.address ?? ""),
                                      Text(data[index]?.phone ?? ""),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                              onPressed: () async {},
                                              icon: const Icon(Icons.map)),
                                          IconButton(
                                              onPressed: () async {
                                                if (data[index]?.phone !=
                                                    null) {
                                                  await CallService().openTel(
                                                      data[index].phone!);
                                                }
                                              },
                                              icon: const Icon(Icons.phone)),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                  ),
                )
              ],
            ),
          );
        },
        onLoading: loading,
        onError: (context, error) => const Center(
          child: Text(
            'Too many clicks',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }

  GoogleMap buildGoogleMap(List<Unities> data) {
    loadData(data);
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: store.center!,
        zoom: 12.0,
      ),
      markers: Set<Marker>.of(store.markers),
    );
  }

  Future<void> loadData(List<Unities> unities) async {
    // makers added according to index
    store.markers.clear();
    if (unities.isNotEmpty) {
      unities.forEach((unity) {
        Marker marker = Marker(
          // given marker id
          markerId: MarkerId(unity.name!),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
          // given position
          position: LatLng(unity.latitude!, unity.longitude!),
          infoWindow: InfoWindow(
            // given title for marker
            title: 'Location: ${unity.name}' ?? "",
          ),
        );
        store.markers.add(marker);
      });
    }
  }

  void _search(String value) {
    if (value.trim().length >= 3) {
      store.find(value);
    }
  }

  Widget loading(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }

  void _onChanged(bool? value) {
    setState(() {
      store.setIsVisible(value!);
    });
  }

  Future<void> getCurrentLocation() async {
    Placemark? placemark = await store.location();
    if (placemark != null) {
      setState(() {
        _addressTextEditingController.text =
            "${placemark.street} ${placemark.name}, ${placemark.subLocality} - ${placemark.locality}, ${placemark.country}";
      });
    }
  }
}
