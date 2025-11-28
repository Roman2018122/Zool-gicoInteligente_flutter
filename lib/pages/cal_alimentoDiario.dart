import 'package:flutter/material.dart';

class CalculadoraAlimentoPage extends StatefulWidget {
  const CalculadoraAlimentoPage({super.key});

  @override
  State<CalculadoraAlimentoPage> createState() => _CalculadoraAlimentoPageState();
}

class _CalculadoraAlimentoPageState extends State<CalculadoraAlimentoPage> {
  
  final TextEditingController peso1Ctrl = TextEditingController();
  final TextEditingController peso2Ctrl = TextEditingController();
  final TextEditingController peso3Ctrl = TextEditingController();
  final TextEditingController gramosPorKgCtrl = TextEditingController();

  double totalAlimento = 0.0;

  void calcularAlimento() {
    final double p1 = double.tryParse(peso1Ctrl.text) ?? 0;
    final double p2 = double.tryParse(peso2Ctrl.text) ?? 0;
    final double p3 = double.tryParse(peso3Ctrl.text) ?? 0;
    final double gramosPorKg = double.tryParse(gramosPorKgCtrl.text) ?? 0;

    
    setState(() {
      totalAlimento = (p1 + p2 + p3) * gramosPorKg;
    });
  }

  @override
  void dispose() {
    peso1Ctrl.dispose();
    peso2Ctrl.dispose();
    peso3Ctrl.dispose();
    gramosPorKgCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de alimento diario"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Ingrese los datos de los animales:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            
            TextField(
              controller: peso1Ctrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Peso del animal 1 (kg)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            
            TextField(
              controller: peso2Ctrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Peso del animal 2 (kg)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            
            TextField(
              controller: peso3Ctrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Peso del animal 3 (kg)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

           
            TextField(
              controller: gramosPorKgCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Gramos de alimento por kg",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),

            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: calcularAlimento,
                child: const Text("Calcular alimento total"),
              ),
            ),

            const SizedBox(height: 30),

           
            Text(
              "Alimento diario total requerido: ${totalAlimento.toStringAsFixed(2)} g",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
