import 'package:flutter/material.dart';

class FavoritosPage extends StatefulWidget {
  const FavoritosPage({super.key});

  @override
  State<FavoritosPage> createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage> {
  final TextEditingController animalCtrl = TextEditingController();
  final List<String> favoritos = [];

  void agregarFavorito() {
    final nombre = animalCtrl.text.trim();

    if (nombre.isNotEmpty) {
      setState(() {
        favoritos.add(nombre);
      });
      animalCtrl.clear();
    }
  }

  void eliminarFavorito(int index) {
    setState(() {
      favoritos.removeAt(index);
    });
  }

  @override
  void dispose() {
    animalCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos del zoológico"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: animalCtrl,
              decoration: const InputDecoration(
                labelText: "Nombre del animal",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

        
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: agregarFavorito,
                child: const Text("Agregar a favoritos"),
              ),
            ),

            const SizedBox(height: 20),

            
            Expanded(
              child: ListView.builder(
                itemCount: favoritos.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.pets),
                      title: Text(favoritos[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => eliminarFavorito(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
