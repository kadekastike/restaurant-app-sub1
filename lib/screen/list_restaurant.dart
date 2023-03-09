import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/screen/restaurant_detail.dart';

class RestaurantListScreen extends StatelessWidget {
  const RestaurantListScreen({super.key});

  static const routeName = '/restaurant-list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant'),
      ),
      body: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/local_restaurant.json'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<RestaurantElement> restaurant =
                  parseRestaurant(snapshot.data!);
              return ListView.builder(
                itemCount: restaurant.length,
                itemBuilder: (context, index) {
                  return _buildRestaurantCard(context, restaurant[index]);
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

Widget _buildRestaurantCard(
    BuildContext context, RestaurantElement restaurant) {
  return Card(
    child: InkWell(
        splashColor: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 80,
                minHeight: 80,
                maxWidth: 80,
                maxHeight: 80,
              ),
              child: Image.network(
                restaurant.pictureId, 
                fit: BoxFit.cover,
                errorBuilder: (ctx, error, _) => const Image(image: AssetImage('images/logo.jpg')),
                ),
            ),
            title: Text(restaurant.name,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.grey,
                      size: 20.0,
                    ),
                    Text(
                      restaurant.city,
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_outline_rounded,
                      color: Colors.orangeAccent,
                      size: 20.0,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(restaurant.rating.toString(),
                        style: Theme.of(context).textTheme.bodyMedium)
                  ],
                )
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, RestaurantDetailScreen.routeName,
              arguments: restaurant);
        }),
  );
}
