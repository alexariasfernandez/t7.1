import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

bool isWide = true;
Color colorLetra = const Color.fromARGB(255, 63, 36, 0);
Color colorCabeceraOscuro = const Color.fromARGB(255, 255, 214, 180);
Color colorFondo = const Color(0xFFF8F4F0);
var imagen = '';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV de Alex Arias Fernández',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Arial',
        primaryColor: colorLetra,
        scaffoldBackgroundColor: colorFondo,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(87, 83, 76, 67),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      home: const CV(),
    );
  }
}

class CV extends StatefulWidget {
  const CV({super.key});

  @override
  State<CV> createState() => _CVState();
}

class _CVState extends State<CV> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          isWide = constraints.maxWidth >= 700;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  isWide ? headerAncho() : MovilHeader(),
                  const SizedBox(height: 25),
                  Divider(color: colorLetra.withOpacity(0.4)),
                  const SizedBox(height: 20),
                  isWide ? infoAncha() : infoMovil(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget MovilHeader() {
    isWide = false;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [colorCabeceraOscuro, Colors.white]),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: colorLetra.withOpacity(0.4), width: 3),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.network(
                imagen,
                fit: BoxFit.cover,
                //reemplazo en caso de no encontrar Imagen
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.person, size: 40),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Alex Arias Fernández',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 63, 36, 0),
                  ),
                ),
                SizedBox(height: 6),
                btnInformacion(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget headerAncho() {
    isWide = true;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorCabeceraOscuro, Colors.white],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: colorLetra.withOpacity(0.4),
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 8,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.network(
                      imagen,
                      fit: BoxFit.cover,
                      //reemplazo en caso de no encontrar Imagen
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.person, size: 40),
                    ),
                  ),
                ),

                const SizedBox(height: 12),
                const Text(
                  'Alex Arias Fernández',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 63, 36, 0),
                  ),
                ),
                const SizedBox(height: 5),
                btnInformacion(),
              ],
            ),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}

Widget infoAncha() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch, // Usar todo el ancho
    children: [
      // Experiencia Laboral
      Container(
        color: colorFondo,
        padding: const EdgeInsets.all(30),
        margin: const EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.work, color: colorLetra, size: 30),
            Text(
              'Experiencia Laboral',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: colorLetra,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Operador de producción, MANPOWER (Octubre 2022 - Agosto 2023): Manejo de maquinaria y control de calidad.',
              style: TextStyle(color: colorLetra),
            ),
          ],
        ),
      ),

      // Educación
      Container(
        color: colorFondo,
        padding: const EdgeInsets.all(30),
        margin: const EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.school, color: colorLetra, size: 30),
            Text(
              'Educación',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: colorLetra,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Grado Medio en Sistemas Microinformáticos y Redes (I.E.S Cosme López Rosriguez, 2019-2021)',
              style: TextStyle(color: colorLetra),
            ),
            Text(
              'Grado Superior Desarrollo de Aplicaciones Multiplataforma (Actualmente Cursando)',
              style: TextStyle(color: colorLetra),
            ),
          ],
        ),
      ),
      Container(
        color: colorFondo,
        padding: const EdgeInsets.all(30),
        margin: const EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.star, color: colorLetra, size: 30),
            Text(
              'Habilidades',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: colorLetra,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Procedimientos de Seguridad',
              style: TextStyle(color: colorLetra),
            ),
            Text('Perseverancia', style: TextStyle(color: colorLetra)),
            Text('Trabajo en equipo', style: TextStyle(color: colorLetra)),
            Text('Entusiasmo', style: TextStyle(color: colorLetra)),
            Text('Comunicacion efica', style: TextStyle(color: colorLetra)),
            Text('Supervision', style: TextStyle(color: colorLetra)),
            Text(
              'Facilidad de aprendizaje',
              style: TextStyle(color: colorLetra),
            ),
            Text('Iniciativa', style: TextStyle(color: colorLetra)),
            Text('Colaboracion', style: TextStyle(color: colorLetra)),
          ],
        ),
      ),
    ],
  );
}

Widget infoMovil() {
  return SingleChildScrollView(
    //para desplazarse por el contenido
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Experiencia Laboral
        Container(
          color: colorFondo,
          padding: const EdgeInsets.all(25),
          margin: const EdgeInsets.only(bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.work, color: colorLetra, size: 30),
              const SizedBox(height: 8),
              Text(
                'Experiencia Laboral',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: colorLetra,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Operador de producción, MANPOWER (Octubre 2022 - Agosto 2023): Manejo de maquinaria y control de calidad.',
                style: TextStyle(color: colorLetra),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

        // Educación
        Container(
          color: colorFondo,
          padding: const EdgeInsets.all(25),
          margin: const EdgeInsets.only(bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.school, color: colorLetra, size: 30),
              const SizedBox(height: 8),
              Text(
                'Educación',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: colorLetra,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Grado Medio en Sistemas Microinformáticos y Redes (I.E.S Cosme López Rosriguez, 2019-2021)',
                style: TextStyle(color: colorLetra),
              ),
              Text(
                'Grado Superior Desarrollo de Aplicaciones Multiplataforma (Actualmente Cursando)',
                style: TextStyle(color: colorLetra),
              ),
            ],
          ),
        ),

        // Habilidades
        Container(
          color: colorFondo,
          padding: const EdgeInsets.all(25),
          margin: const EdgeInsets.only(bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.star, color: colorLetra, size: 30),
              const SizedBox(height: 8),

              const SizedBox(height: 10),
              Text(
                'Habilidades',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: colorLetra,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Procedimientos de Seguridad',
                style: TextStyle(color: colorLetra),
              ),
              Text('Perseverancia', style: TextStyle(color: colorLetra)),
              Text('Trabajo en equipo', style: TextStyle(color: colorLetra)),
              Text('Entusiasmo', style: TextStyle(color: colorLetra)),
              Text('Comunicacion efica', style: TextStyle(color: colorLetra)),
              Text('Supervision', style: TextStyle(color: colorLetra)),
              Text(
                'Facilidad de aprendizaje',
                style: TextStyle(color: colorLetra),
              ),
              Text('Iniciativa', style: TextStyle(color: colorLetra)),
              Text('Colaboracion', style: TextStyle(color: colorLetra)),
            ],
          ),
        ),
      ],
    ),
  );
}

// BOTÓN DE CONTACTO
class btnInformacion extends StatefulWidget {
  const btnInformacion({super.key});
  @override
  State<btnInformacion> createState() => _estadoBotonContacto();
}

class _estadoBotonContacto extends State<btnInformacion> {
  bool _showContact = false;

  @override
  Widget build(BuildContext context) {
    if (isWide) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          ElevatedButton.icon(
            onPressed: () => setState(() => _showContact = !_showContact),
            icon: const Icon(Icons.person_outline, size: 13),
            label: const Text('Informacion Personal'),
          ),
          const SizedBox(height: 29),
          AnimatedCrossFade(
            alignment: AlignmentGeometry.center,
            duration: const Duration(milliseconds: 300),
            // Primer hijo obligatorio
            firstChild: Container(),
            secondChild: Container( 
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Row(
                    children: [
                      Icon(
                        Icons.email,
                        size: 12,
                        color: Color.fromARGB(255, 48, 27, 0),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'alex2000arias@gmail.com',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 12,
                        color: Color.fromARGB(255, 48, 27, 0),
                      ),
                      SizedBox(width: 5),
                      Text('A Coruña, España', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: 12,
                        color: Color.fromARGB(255, 48, 27, 0),
                      ),
                      SizedBox(width: 5),
                      Text('672900132', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.date_range,
                        size: 12,
                        color: Color.fromARGB(255, 48, 27, 0),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '27 de Marzo de 2000',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.flag,
                        size: 12,
                        color: Color.fromARGB(255, 48, 27, 0),
                      ),
                      SizedBox(width: 5),
                      Text('Española', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),

            crossFadeState: _showContact
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton.icon(
            onPressed: () => setState(() => _showContact = !_showContact),
            icon: const Icon(Icons.person_outline, size: 13),
            label: const Text('Informacion Personal'),
          ),
          const SizedBox(height: 8),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            firstChild: Container(),
            secondChild: Column(
              children: const [
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      size: 12,
                      color: Color.fromARGB(255, 48, 27, 0),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'alex2000arias@gmail.com',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 12,
                      color: Color.fromARGB(255, 48, 27, 0),
                    ),
                    SizedBox(width: 5),
                    Text('A Coruña, España', style: TextStyle(fontSize: 12)),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 12,
                      color: Color.fromARGB(255, 48, 27, 0),
                    ),
                    SizedBox(width: 5),
                    Text('672900132', style: TextStyle(fontSize: 12)),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.date_range,
                      size: 12,
                      color: Color.fromARGB(255, 48, 27, 0),
                    ),
                    SizedBox(width: 5),
                    Text('27 de Marzo de 2000', style: TextStyle(fontSize: 12)),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.flag,
                      size: 12,
                      color: Color.fromARGB(255, 48, 27, 0),
                    ),
                    SizedBox(width: 5),
                    Text('Española', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
            crossFadeState: _showContact
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
          ),
        ],
      );
    }
  }
}
