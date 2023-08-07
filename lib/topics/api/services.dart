import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Stream<QuerySnapshot> getProblems(String category) {
    return firestore
        .collection("DataStructures")
        .where('p_category', isEqualTo: category)
        .snapshots();
  }

  static Stream<QuerySnapshot> getCompanyWiseProblems(String companyName) {
    return firestore
        .collection('DataStructures')
        .where('p_company', arrayContains: companyName)
        .snapshots();
  }
}
