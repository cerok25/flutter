import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore BaseDeDatos = FirebaseFirestore.instance;

Future<List>getDatos()async{
  List datos = [];
  CollectionReference collectionReferenceDatos= BaseDeDatos.collection('Datos');
  QuerySnapshot queryDatos = await collectionReferenceDatos.get();
  queryDatos.docs.forEach((documento){
      datos.add(documento.data());
  });
  return datos;
}


Future<void> addDatos(String email) async {
  await BaseDeDatos.collection('Datos').add({"email": email});
}

