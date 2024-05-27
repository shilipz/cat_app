import 'package:cat_app/features/home/presentation/pages/image_screen.dart';
import 'package:flutter/material.dart';

class BreedCard extends StatelessWidget {
  final String otherDetail;
  final String breedImage;
  final String breedName;
  final String description;
  final String origin;
  final String lifespan;
  const BreedCard(
      {super.key,
      required this.breedImage,
      required this.breedName,
      required this.description,
      required this.origin,
      required this.lifespan,
      required this.otherDetail});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BreedImagesScreen(
                otherDetail: otherDetail,
                breedName: breedName,
                breedImage: breedImage,
                description: description,
                origin: origin,
                lifeSpan: lifespan,
              ),
            ),
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              breedImage,
              width: 150,
              height: 150,
              fit: BoxFit.fill,
            ),
            const SizedBox(width: 8.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                      width: 170,
                      child: Column(
                        children: [
                          Text(
                            "$breedName ",
                            style: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "$origin ",
                            style: const TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w400),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
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
