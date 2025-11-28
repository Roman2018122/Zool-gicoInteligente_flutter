import 'package:flutter/material.dart';

class AnimalesPorHabitatPage extends StatefulWidget {
  const AnimalesPorHabitatPage({super.key});

  @override
  State<AnimalesPorHabitatPage> createState() => _AnimalesPorHabitatPageState();
}

class _AnimalesPorHabitatPageState extends State<AnimalesPorHabitatPage> {
  String habitatSeleccionado = "Selva";

  final Map<String, List<String>> animalesPorHabitat = {
    "Selva": ["Jaguar", "Mono aullador", "Tucán", "Serpiente boa"],
    "Sabana": ["León", "Elefante", "Cebra", "Guepardo"],
    "Acuático": ["Delfín", "Tiburón", "Pulpo", "Mantaraya"],
    "Aviario": ["Águila", "Guacamaya", "Búho", "Flamenco"]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animales por hábitat"),
      ),
      body: Column(
        children: [
        
          SizedBox(
            height: 180,
            width: double.infinity,
            child: Image.asset(
              "assets/imagenes/zoo.jpg", 
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 20),

          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "Selecciona un hábitat",
                border: OutlineInputBorder(),
              ),
              value: habitatSeleccionado,
              items: const [
                DropdownMenuItem(value: "Selva", child: Text("Selva")),
                DropdownMenuItem(value: "Sabana", child: Text("Sabana")),
                DropdownMenuItem(value: "Acuático", child: Text("Acuático")),
                DropdownMenuItem(value: "Aviario", child: Text("Aviario")),
              ],
              onChanged: (valor) {
                setState(() {
                  habitatSeleccionado = valor!;
                });
              },
            ),
          ),

          const SizedBox(height: 20),

         
          Expanded(
            child: ListView.builder(
              itemCount: animalesPorHabitat[habitatSeleccionado]!.length,
              itemBuilder: (context, index) {
                final animal = animalesPorHabitat[habitatSeleccionado]![index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.pets),
                    title: Text(animal),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
