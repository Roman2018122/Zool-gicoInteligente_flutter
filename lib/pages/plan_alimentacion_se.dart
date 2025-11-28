import 'package:flutter/material.dart';

class PlanAlimentacionSemanalPage extends StatefulWidget {
  const PlanAlimentacionSemanalPage({super.key});

  @override
  State<PlanAlimentacionSemanalPage> createState() =>
      _PlanAlimentacionSemanalPageState();
}

class _PlanAlimentacionSemanalPageState
    extends State<PlanAlimentacionSemanalPage> {
  final TextEditingController nombreCtrl = TextEditingController();
  final TextEditingController gramosCtrl = TextEditingController();

 
  final List<Map<String, dynamic>> animales = [];

  double totalDiario = 0.0;
  double totalSemanal = 0.0;

  void agregarAnimal() {
    final String nombre = nombreCtrl.text.trim();
    final double gramos = double.tryParse(gramosCtrl.text.trim()) ?? 0;

    if (nombre.isNotEmpty && gramos > 0) {
      setState(() {
        animales.add({
          "nombre": nombre,
          "gramos": gramos,
        });
      });
      nombreCtrl.clear();
      gramosCtrl.clear();
    }
  }

  void calcularResumen() {
    double suma = 0.0;

    for (var animal in animales) {
      suma += animal["gramos"];
    }

    setState(() {
      totalDiario = suma;
      totalSemanal = suma * 7;
    });
  }

  void eliminarAnimal(int index) {
    setState(() {
      animales.removeAt(index);
    });
  }

  @override
  void dispose() {
    nombreCtrl.dispose();
    gramosCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Plan de alimentación semanal"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Agregar animal al plan:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: nombreCtrl,
              decoration: const InputDecoration(
                labelText: "Nombre del animal",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: gramosCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Gramos de alimento por día",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: agregarAnimal,
                child: const Text("Agregar animal"),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Lista del plan:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: animales.length,
                itemBuilder: (context, index) {
                  final animal = animales[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: const Icon(Icons.pets),
                      title: Text(animal["nombre"]),
                      subtitle:
                          Text("Ración diaria: ${animal["gramos"]} g / día"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => eliminarAnimal(index),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: calcularResumen,
                child: const Text("Calcular resumen"),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Total diario: ${totalDiario.toStringAsFixed(2)} g",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "Total semanal: ${totalSemanal.toStringAsFixed(2)} g",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
