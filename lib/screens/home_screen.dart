import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets Section'),
        centerTitle: true,   // indicando que centre el title
        backgroundColor: Colors.redAccent,  // agregando color al appbar
      ),
      body: Padding(    // con control. agrego un pading al column, 
        padding: EdgeInsets.all(15.0),
        child: Column(   // aplilando 
          children: <Widget>[
            GestureDetector (    // encapsulo el contenedor con este widget que lo que hace es para hacer el ontap para navegar a otra pantalla
              onTap: () {
                Navigator.pushNamed(context, 'my_canine_age');   // aqui le estoy diciendo que navegue hacia la ruta de my canine age
              },
              child: Container(
                width: double.infinity,  // aqui ajusto el card al tamaño de la pantalla, tomar en cuenta que deja libre el padding
                height: 275,
                child: Card(   // este widget de una vez agrega un card
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),  // agregando border circular al card
                  elevation: 5,   // para que resalte el card
                  margin: EdgeInsets.zero,   // quitando el padding del card
                  child: Column(    // agregando otro column para poder apilar la imagen y el texto
                    children: <Widget> [
                      Hero(
                        tag: 'my_canine_age_image',
                        child: ClipRRect(  // para poder  realizar el corte del topleft y topright
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20), // agregando border del lado izquierdo
                            topRight: Radius.circular(20),  // agregando border del lado derecho
                          ),
                          child: Image.asset('assets/images/computerDog.jpg',
                            width: double.infinity, 
                            height: 225, 
                            fit: BoxFit.cover
                          )// ajusto la imagen de ancho altura y pie del card
                          ),
                      ),
                        SizedBox(
                          height: 15,
                        ),
                      Text('Mi edad Canina', style: TextStyle(fontSize: 20)),
                    ],
            
                  ),
                ),
              ),
            )
          ],
        ),
      ) 

    );
  }
}