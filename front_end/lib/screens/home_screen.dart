import 'package:flutter/material.dart';
import '../models/ad.dart'; // Importando a classe Ad
import '../models/ad_data.dart'; // Importando a classe AdData
import '../widgets/ad_item.dart'; // Importando o widget AdItem
import '../widgets/base_screen.dart'; // Importando o BaseScreen

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Ad> ads = AdData.getAds();

    return BaseScreen(
      title: 'Anúncios Disponíveis',
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = constraints.maxWidth > 1200
                ? 4
                : (constraints.maxWidth > 600 ? 2 : 1);

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 2.5,
              ),
              itemCount: ads.length,
              itemBuilder: (context, index) {
                return AdItem(ad: ads[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
