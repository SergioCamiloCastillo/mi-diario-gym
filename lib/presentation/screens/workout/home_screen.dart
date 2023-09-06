import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<Map<String, dynamic>> _categoriesExercises = [
    {
      "name": "Pierna",
      "imageUrl": "https://example.com/image1.jpg",
    },
    {
      "name": "Pecho",
      "imageUrl": "https://example.com/image2.jpg",
    },
    {
      "name": "Espalda",
      "imageUrl": "https://example.com/image3.jpg",
    },
    {
      "name": "Triceps",
      "imageUrl": "https://example.com/image3.jpg",
    },
    {
      "name": "Biceps",
      "imageUrl": "https://example.com/image3.jpg",
    },
    {
      "name": "Cardio",
      "imageUrl": "https://example.com/image3.jpg",
    },
    // Agrega más categorías según tus necesidades
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFEFF3F4),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hola, Sergio',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF323237)),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'Revisemos tu actividad',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF323237)),
              )
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Container(
                decoration: BoxDecoration(
                  shape:
                      BoxShape.circle, // Forma del borde (círculo en este caso)
                  color: Colors.blue, // Color de fondo del borde
                  border: Border.all(
                    color: Color(0xFFCAC7F5), // Color del borde
                    width: 3.0, // Ancho del borde
                  ),
                ),
                child: ClipOval(
                  child: Image.network(
                    'https://avatars.githubusercontent.com/u/26844982?s=96&v=4', // URL de la imagen
                    width: 28, // Ancho de la imagen
                    height: 28, // Alto de la imagen
                  ),
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Card(
                color: Color(0XFFF76E37),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                child: SizedBox(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Resumen de actividad',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('16 maquinas',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                            SizedBox(
                              height: 4,
                            ),
                            Text('Alrededor de 4 rep por maquina',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12))
                          ],
                        ),
                        Image.asset(
                          'lib/images/exercise.png',
                          width: 50,
                          height: 50,
                        )
                      ],
                    ),
                  ),
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
