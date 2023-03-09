import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({super.key, required this.restaurantElement});

  static const routeName = '/restaurant-detail';

  final RestaurantElement restaurantElement;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: restaurantElement.id,
                child: Image.network(
                  restaurantElement.pictureId,
                   errorBuilder: (ctx, error, _) => const Image(image: AssetImage('images/logo.jpg'))
                   ),
              ),
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(children: [
                    Text(
                      restaurantElement.name,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.titleLarge,
                    )
                  ]),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        restaurantElement.city,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star_outline_rounded,
                        color: Colors.orangeAccent,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        restaurantElement.rating.toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  padding: const EdgeInsets.all(2.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    restaurantElement.description,
                    textAlign: TextAlign.justify,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Menus',
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Foods',
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height * 0.08),
                  width: (MediaQuery.of(context).size.width * 0.94),
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: restaurantElement.menus.foods.map((foods) {
                        return Row(children: [
                          _buildChipForMenu(foods.name),
                          const SizedBox(width: 5)
                        ]);
                      }).toList()),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Drinks',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height * 0.08),
                  width: (MediaQuery.of(context).size.width * 0.92),
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: restaurantElement.menus.drinks.map((drinks) {
                        return Row(children: [
                          _buildChipForMenu(drinks.name),
                          const SizedBox(width: 5)
                        ]);
                      }).toList()),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

Widget _buildChipForMenu(String label) {
  return Chip(
    labelPadding: const EdgeInsets.all(3.0),
    label: Text(
      label,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: Colors.grey,
    elevation: 5.0,
    shadowColor: Colors.grey,
    padding: const EdgeInsets.all(8.0),
  );
}
