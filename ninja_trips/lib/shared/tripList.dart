import 'package:flutter/material.dart';
import 'package:ninja_trips/models/trip.dart';
import 'package:ninja_trips/screens/details.dart';
import 'package:ninja_trips/shared/trip_view.dart';

class TripList extends StatefulWidget {
  const TripList({super.key});

  @override
  State<TripList> createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  List<Trip> tripList = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  Tween<Offset> _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));

  void _addTrips() {
    List<Trip> trips = [
      Trip(title: 'Beach Paradise', price: '350', nights: '3', img: 'beach.png'),
      Trip(title: 'City Break', price: '400', nights: '5', img: 'city.png'),
      Trip(title: 'Ski Adventure', price: '750', nights: '2', img: 'ski.png'),
      Trip(title: 'Space Blast', price: '600', nights: '4', img: 'space.png'),
    ];

    tripList = trips;
  }

  @override
  void initState() {
    super.initState();
    _addTrips();
  }

  void _handleTap(Trip trip) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Details(trip: trip)));
  }

  // @override
  // Widget build(BuildContext context) {
  //   return AnimatedList(
  //     key: _listKey,
  //     initialItemCount: tripList.length,
  //     itemBuilder: (context, index, animation) {
  //       return SlideTransition(
  //         position: animation.drive(_offset),
  //         child: TripView(
  //             trip: tripList[index],
  //             onTap: () {
  //               _handleTap(tripList[index]);
  //             }
  //         ),
  //       );
  //     }
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: tripList
          .map((e) => TripView(
              trip: e,
              onTap: () {
                _handleTap(e);
              }))
          .toList(),
    );
  }
}
