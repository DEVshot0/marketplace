import 'ad.dart';  // Importando a classe Ad

class AdData {
  // Método que retorna uma lista de anúncios simulados
  static List<Ad> getAds() {
    return [
      Ad(
        id: 1,
        title: 'Test Ad',
        description: 'This is a test ad.',
        price: '100',
        status: 'available',
        userId: 2,
      ),
      Ad(
        id: 2,
        title: 'Special Offer',
        description: 'Amazing discount on this product.',
        price: '150',
        status: 'available',
        userId: 3,
      ),
      Ad(
        id: 3,
        title: 'Luxury Item',
        description: 'A luxury product at an affordable price.',
        price: '500',
        status: 'available',
        userId: 1,
      ),
      // Adicione mais anúncios conforme necessário
    ];
  }
}
