class Ad {
  final int id;
  final String title;
  final String description;
  final String price;
  final String status;
  final int userId;

  Ad({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.status,
    required this.userId,
  });

  // Método para criar um Ad a partir de um map (simulando a resposta da API)
  factory Ad.fromJson(Map<String, dynamic> json) {
    return Ad(
      id: json['id'] ?? 0, // Caso o id seja nulo, usa 0 como padrão
      title: json['title'] ?? 'Sem título', // Valor padrão se title for nulo
      description: json['description'] ?? 'Sem descrição', // Valor padrão para description
      price: json['price'] ?? '0', // Valor padrão para price
      status: json['status'] ?? 'unknown', // Valor padrão para status
      userId: json['userId'] ?? 0, // Valor padrão para userId
    );
  }
}
