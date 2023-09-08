import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const name = "home-screen";
  HomeScreen({super.key});
  final List<Map<String, dynamic>> _activitiesToday = [
    {
      "exerciseName": "Press de banca",
      "activity": "20 repeticiones 4 series",
      "idCategory": 2
    },
    {
      "exerciseName": "Extensión de rodillas",
      "activity": "12 repeticiones 4 series",
      "idCategory": 1
    },
    {"exerciseName": "Caminadora", "activity": "30 minutos", "idCategory": 6}
  ];
  final List<Map<String, dynamic>> _categoriesExercises = [
    {
      "id": 1,
      "name": "Pierna",
      "imageUrl": "lib/images/leg.png",
      "backgroundColor": "#A2CEFF"
    },
    {
      "id": 2,
      "name": "Pecho",
      "imageUrl": "lib/images/chest.png",
      "backgroundColor": "#FCBF94"
    },

    {
      "id": 3,
      "name": "Triceps",
      "imageUrl": "lib/images/triceps.png",
      "backgroundColor": "#F3A4D2"
    },
    {
      "id": 4,
      "name": "Espalda",
      "imageUrl": "lib/images/back.png",
      "backgroundColor": "#A2CEFF"
    },
    {
      "id": 5,
      "name": "Biceps",
      "imageUrl": "lib/images/arm.png",
      "backgroundColor": "#FCBF94"
    },
    {
      "id": 6,
      "name": "Cardio",
      "imageUrl": "lib/images/cardio.png",
      "backgroundColor": "#F3A4D2"
    },
    {
      "id": 7,
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
              Expanded(
                  child: _ActivityToday(
                      activitiesToday: _activitiesToday,
                      categoriesExercises: _categoriesExercises))
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
    required List<Map<String, dynamic>> categoriesExercises,
  })  : _activitiesToday = activitiesToday,
        _categoriesExercises = categoriesExercises;

  final List<Map<String, dynamic>> _activitiesToday;
  final List<Map<String, dynamic>> _categoriesExercises;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Actividad de hoy',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 15,
          ),
          if (_activitiesToday.isNotEmpty)
            Expanded(
              child: ListView.separated(
                itemCount: _activitiesToday.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  final activity = _activitiesToday[index];
                  final exerciseName = activity["exerciseName"];
                  final categoryId = activity["idCategory"];
                  final activityDetail = activity["activity"];
                  final category = _categoriesExercises.firstWhere(
                      (categoryData) => categoryData["id"] == categoryId);
                  final categoryName = category["name"];
                  final categoryImage = category["imageUrl"];
                  return ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          categoryImage,
                          width: 35,
                          height: 35,
                        ),
                      ],
                    ),
                    title: Text(exerciseName),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text(categoryName)],
                        ),
                        Text(activityDetail)
                      ],
                    ),
                  );
                },
              ),
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'No hay actividades para mostrar',
                  style: TextStyle(fontSize: 16),
                ),
              ],
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
    final navigate = GoRouter.of(context);
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
                return GestureDetector(
                  onTap: () {
                    navigate.go('/exercises-summary-screen');
                  },
                  child: Container(
                    child: Column(
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
                            height:
                                8), // Add some space between the image and text
                        Container(
                          width: 80,
                          child: Text(
                            categoryName,
                            textAlign: TextAlign.center, // Center the text
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
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
