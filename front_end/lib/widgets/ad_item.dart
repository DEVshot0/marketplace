import 'package:flutter/material.dart';
import '../models/ad.dart'; // Importando a classe Ad

class AdItem extends StatelessWidget {
  final Ad ad;
  final bool isOwner; // Variável para determinar se o usuário é o dono do anúncio

  const AdItem({
    Key? key,
    required this.ad,
    this.isOwner = false, // Por padrão, assumimos que o usuário é o dono
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calcula dinamicamente a altura do card
    double cardHeight = 180.0; // Altura aproximada do card para controle
    double imageHeight = cardHeight * 0.9; // 90% do card para a altura da imagem

    return Stack(
      children: [
        // Card principal do anúncio
        Container(
          padding: const EdgeInsets.all(8.0),
          height: cardHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.green[200], // Fundo verde para melhor visualização
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Coluna 1: Foto centralizada verticalmente
              Flexible(
                flex: 3,
                child: Center(
                  child: Container(
                    height: imageHeight, // Altura da imagem aumentada para 90% do card
                    color: Colors.blueGrey,
                    child: const Center(
                      child: Icon(
                        Icons.image,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
              
              // Coluna 2: Dados do anúncio (centralizado verticalmente)
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Centralizando o conteúdo verticalmente
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Título do anúncio
                      Text(
                        ad.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8), // Espaçamento aumentado entre título e descrição

                      // Descrição do anúncio
                      Text(
                        ad.description,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 12), // Espaçamento aumentado entre descrição e linha final

                      // Linha final: Preço e Botão Comprar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Preço
                          Text(
                            'R\$ ${ad.price}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Botão de comprar com margem à direita
                          ElevatedButton(
                            onPressed: () {
                              // Lógica para compra
                              print('Comprado!');
                            },
                            child: const Text('Comprar'),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        
        // Ícone de lixeira visível apenas para o dono do anúncio
        if (isOwner)
          Positioned(
            top: 8.0,
            right: 8.0,
            child: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                // Lógica para deletar o anúncio
                print('Anúncio deletado!');
              },
            ),
          ),
      ],
    );
  }
}
