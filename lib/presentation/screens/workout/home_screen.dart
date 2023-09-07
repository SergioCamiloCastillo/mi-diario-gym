import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<Map<String, dynamic>> _activitiesToday = [
    {
      "exerciseName": "Press de banca",
      "category": "Pecho",
      "imageUrl": "lib/images/chest.png",
      "activity": "20 repeticiones 4 series"
    },
    {
      "exerciseName": "Extensión de rodillas",
      "category": "Pierna",
      "imageUrl": "lib/images/leg.png",
      "activity": "12 repeticiones 4 series"
    },
    {
      "exerciseName": "Caminadora",
      "category": "Cardio",
      "imageUrl": "lib/images/cardio.png",
      "activity": "30 minutos"
    }
  ];
  final List<Map<String, dynamic>> _categoriesExercises = [
    {
      "name": "Pierna",
      "imageUrl": "lib/images/leg.png",
      "backgroundColor": "#A2CEFF"
    },
    {
      "name": "Pecho",
      "imageUrl": "lib/images/chest.png",
      "backgroundColor": "#FCBF94"
    },

    {
      "name": "Triceps",
      "imageUrl": "lib/images/triceps.png",
      "backgroundColor": "#F3A4D2"
    },
    {
      "name": "Espalda",
      "imageUrl": "lib/images/back.png",
      "backgroundColor": "#A2CEFF"
    },
    {
      "name": "Biceps",
      "imageUrl": "lib/images/arm.png",
      "backgroundColor": "#FCBF94"
    },
    {
      "name": "Cardio",
      "imageUrl": "lib/images/cardio.png",
      "backgroundColor": "#F3A4D2"
    },
    {
      "name": "Hombro",
      "imageUrl": "lib/images/shoulder.png",
      "backgroundColor": "#A2CEFF"
    },
    // Agrega más categorías según tus necesidades
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          backgroundColor: Color(0XFF0066CC),
        ),
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
              _Card(),
              _CardsCategoriesExercises(
                  categoriesExercises: _categoriesExercises),
              Expanded(child: _ActivityToday(activitiesToday: _activitiesToday))
            ],
          ),
        ),
      ),
    );
  }
}

class _ActivityToday extends StatelessWidget {
  const _ActivityToday({
    super.key,
    required List<Map<String, dynamic>> activitiesToday,
  }) : _activitiesToday = activitiesToday;

  final List<Map<String, dynamic>> _activitiesToday;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Actividad de hoy',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _activitiesToday.length,
              itemBuilder: (context, index) {
                final category = _activitiesToday[index];
                final exerciseName = category["exerciseName"];
                final categoryName = category["category"];
                return ListTile(
                  title: Text(exerciseName),
                  subtitle: Column(
                    children: [Text(categoryName)],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _CardsCategoriesExercises extends StatelessWidget {
  const _CardsCategoriesExercises({
    super.key,
    required List<Map<String, dynamic>> categoriesExercises,
  }) : _categoriesExercises = categoriesExercises;

  final List<Map<String, dynamic>> _categoriesExercises;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categorias',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 115,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _categoriesExercises.length,
              separatorBuilder: (context, index) => SizedBox(
                width: 20,
              ),
              itemBuilder: (context, index) {
                final category = _categoriesExercises[index];
                final categoryName = category["name"];
                final categoryImageUrl = category["imageUrl"];
                final categoryBackgroundColor = category["backgroundColor"];
                return Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Image.asset(
                              categoryImageUrl,
                              fit: BoxFit.contain,
                            )
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color(int.parse(categoryBackgroundColor
                                .replaceAll("#", "0xFF")))
                            .withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    SizedBox(
                        height: 8), // Add some space between the image and text
                    Container(
                      width: 80,
                      child: Text(
                        categoryName,
                        textAlign: TextAlign.center, // Center the text
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                  SizedBox(
                    height: 4,
                  ),
                  Text('Alrededor de 4 rep por maquina',
                      style: TextStyle(color: Colors.white, fontSize: 12))
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
    );
  }
}
