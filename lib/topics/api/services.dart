import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // This service returns all the specific problem for the given category
  // By providing the category
  // p_category is type of string in database

  static Stream<QuerySnapshot> getProblems(String category) {
    return firestore
        .collection("DataStructures")
        .where('p_category', isEqualTo: category)
        .snapshots();
  }

  // This service returns all the specific problem for the given Company
  // By providing the Company name
  // p_company is of array type
  // the complete array is checked for every name

  static Stream<QuerySnapshot> getCompanyWiseProblems(String companyName) {
    return firestore
        .collection('DataStructures')
        .where('p_company', arrayContains: companyName)
        .snapshots();
  }
}
