import 'package:flutter/material.dart';

void main() {
  runApp(const ViagensApp());
}

class ViagensApp extends StatelessWidget {
  const ViagensApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Viagens',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2196F3)),
        useMaterial3: true,
      ),
      home: const ViagensScreen(),
    );
  }
}

class ViagensScreen extends StatelessWidget {
  const ViagensScreen({super.key});

  static const azulPrincipal = Color(0xFF2196F3);
  static const azulTexto = Color(0xFF29A9F4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: azulPrincipal,
        foregroundColor: Colors.white,
        title: const Text(
          'Viagens',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CabecalhoDestino(),
            MenuAcoes(),
            TextoDescricao(),
            CabecalhoPessoas(),
            ListaPessoas(),
          ],
        ),
      ),
    );
  }
}

class CabecalhoDestino extends StatelessWidget {
  const CabecalhoDestino({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 215,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1552832230-c0197dd311b5?auto=format&fit=crop&w=900&q=80',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF0757A3), Color(0xFF101B2D)],
                ),
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.travel_explore,
                color: Colors.white70,
                size: 72,
              ),
            ),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Color(0xAA000000)],
              ),
            ),
          ),
          const Positioned(
            left: 6,
            bottom: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Roma',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Coliseu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    height: 0.95,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuAcoes extends StatelessWidget {
  const MenuAcoes({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ItemAcao(icon: Icons.place_outlined, label: 'Quero Ir'),
          ItemAcao(icon: Icons.camera_alt_outlined, label: 'Já Fui'),
          ItemAcao(icon: Icons.share, label: 'Compartilhar'),
          ItemAcao(icon: Icons.star, label: 'Avaliações'),
        ],
      ),
    );
  }
}

class ItemAcao extends StatelessWidget {
  const ItemAcao({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: ViagensScreen.azulTexto, size: 25),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            color: ViagensScreen.azulTexto,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class TextoDescricao extends StatelessWidget {
  const TextoDescricao({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(6, 0, 6, 14),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce id diam id ligula ultricies pulvinar. In neque lectus, sagittis eu libero et, venenatis lacinia nulla. Etiam eget purus leo. Nam consectetur ornare est eu lobortis. Morbi eu augue eu lectus condimentum vestibulum. Etiam id nibh luctus, porttitor arcu et, porttitor purus. Pellentesque vulputate nibh sit amet rutrum viverra. Nullam eget metus est. Integer condimentum, odio sed congue malesuada, ipsum nisi bibendum lectus, quis porttitor ante lacus in mi. Curabitur eget imperdiet ante. Aliquam magna tortor, volutpat sit amet mi a, cursus malesuada leo. Aenean dolor erat, gravida ut ultricies sed, convallis nec ipsum.',
        textAlign: TextAlign.justify,
        style: TextStyle(color: Color(0xFF444444), fontSize: 13, height: 1.08),
      ),
    );
  }
}

class CabecalhoPessoas extends StatelessWidget {
  const CabecalhoPessoas({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 0, right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              'Pessoas Encontradas',
              style: TextStyle(
                color: ViagensScreen.azulTexto,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Column(
            children: [
              Icon(Icons.filter_alt, color: ViagensScreen.azulTexto, size: 24),
              Text(
                'Filtrar',
                style: TextStyle(
                  color: ViagensScreen.azulTexto,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ListaPessoas extends StatelessWidget {
  const ListaPessoas({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AvatarPessoa(),
          AvatarPessoa(),
          AvatarPessoa(),
          AvatarPessoa(),
        ],
      ),
    );
  }
}

class AvatarPessoa extends StatelessWidget {
  const AvatarPessoa({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 28,
      backgroundColor: Color(0xFFE9E9E9),
      child: Icon(Icons.person, color: Color(0xFFBDBDBD), size: 46),
    );
  }
}
