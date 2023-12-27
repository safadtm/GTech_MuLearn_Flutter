import 'package:biodata_app/bio_data.dart';
import 'package:flutter/material.dart';

class BioDataPage extends StatelessWidget {
  final BioData bioData;

  const BioDataPage({
    Key? key,
    required this.bioData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Bio-Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${bioData.name}',
              style:const TextStyle(fontSize: 18),
            ),
            Text(
              'Age: ${bioData.age}',
              style:const TextStyle(fontSize: 18),
            ),
            Text(
              'Occupation: ${bioData.occupation}',
              style:const TextStyle(fontSize: 18),
            ),
            Text(
              'Address: ${bioData.address}',
              style:const TextStyle(fontSize: 18),
            ),
            Text(
              'Email: ${bioData.email}',
              style:const TextStyle(fontSize: 18),
            ),
            Text(
              'Phone Number: ${bioData.phoneNumber}',
              style:const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
