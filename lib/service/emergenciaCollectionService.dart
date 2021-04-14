import 'package:cloud_firestore/cloud_firestore.dart';

class EmergenciaCollectionService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<DocumentSnapshot> getEmergencia(String pinCode) {
    return firestore.collection('emergencia').doc(pinCode).snapshots();
  }
   Stream<QuerySnapshot> getEmergenciaPoints(String pinCode) {
    return firestore.collection('emergencia').doc(pinCode).collection('positions').snapshots();
  }
}
