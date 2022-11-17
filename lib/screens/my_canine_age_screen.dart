import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyCanineAgeScreen extends StatefulWidget {

  @override
  State<MyCanineAgeScreen> createState() => _MyCanineAgeScreenState();
}

class _MyCanineAgeScreenState extends State<MyCanineAgeScreen> {

bool _showCanineAge = false;
int _dogAge = 0;

final TextEditingController ageInputController = TextEditingController(); 
 // Declarando lo que se necesita para el calculo de la edad canina

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My canine age'),
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: 'my_canine_age_image',
              child: Image.asset(
                'assets/images/computerDog.jpg',
                width: double.infinity, 
                height: 225, 
                fit: BoxFit.cover
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),// haciendo un padding al texto y afinando espacios
              child: Column(
                children: [
                Theme(    // envolvemos el text en un them para poder poner color a la letra 
                  data: ThemeData(
                    colorScheme: ThemeData().colorScheme.copyWith(
                      primary: Colors.brown
                    ) 
                  ),
                  child: TextField(
                    controller: ageInputController,
                    inputFormatters: [         // aqui le pongo regla para que solo acepte numeros no caracteres, etc
                      LengthLimitingTextInputFormatter(3),   // limitamos a que solo podamos ingresar 3 digitos
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.number,  // poniendo teclado numerico
                    decoration: InputDecoration(    // habilitando ingreso de texto
                      labelText: 'Ingrese su edad',  // colocando etiqueta
                      helperText: 'Sólo números',    // colocando un mensaje de ayuda
                      icon: Icon( Icons.person ),    // colocando icono
                      suffixIcon:  IconButton(     // creando un boton para limpiar al teclado
                        icon: Icon( Icons.clear),  
                        splashRadius: 25,     //ajustando el radio del boton clear 
                        onPressed: () {
                          ageInputController.clear();
                          setState(() { });
                          },
                        )
                      ),
                    ),
                  ),
                  SizedBox( height: 10 ),
                  if( _showCanineAge ) showCanineAge(),
                  MaterialButton(   // este tiene una forma rectangular
                    shape: StadiumBorder(), // redondeando el boton
                    minWidth: double.infinity,  // indicando que abarque el ancho de la pantalla 
                    color: Colors.brown,
                    child: Text('Calcular mi edad canina', style: TextStyle(color: Colors.white)),  // color del texto del boton
                    onPressed: () {
                      final canineAge = ageInputController.text; 
      
                      if( canineAge.isNotEmpty  && canineAge.length > 0) {   //asegurar que no venga vacio  isNotEmpty es un booleano que va a devolver sino esta vacio
                        FocusScope.of(context).requestFocus(FocusNode() );  // si hay algo digitado se va a esconder sino aparecera el mensaje del snackbar
                        _showCanineAge = true;   // que se muestre el widget
                        _dogAge = int.parse( canineAge ) * 7;  // ccalculando la edad canina
                        setState(() {});  // redibujar los cambios 
                      
                      } else {  
                        ScaffoldMessenger.of(context).showSnackBar(   // vevolvera un snackbar que dira el mensaje de error
                          SnackBar(
                            backgroundColor: Colors.redAccent,   // agregando color al snackbar
                            content: Text('Error, por favor ingrese su edad'),
                          )
                        );
                      }
                    },
                  )
                ],
              )
            )
          ],
        ),
      )
    );
  }
  
  Widget showCanineAge() {  // le decimos que retornara un widget para que no sea dinamico
    return Column(
      children: [
      Text('Tu edad canina es: $_dogAge años', style: TextStyle( fontSize: 16 )),      
      SizedBox(height: 10)
      ],
    );
  }
}