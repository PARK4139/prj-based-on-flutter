
// pubspec.yaml
//   dependencies:
// /*1*/ firebase_core:
// /*1*/ cloud_firestore:



// main.dart
// void main() {
// /*2*/ FirebaseApp.initializeApp();
//   runApp(MyApp());
// }



/*Firebase Realtime Database 사용*/
// main.dart
// void main() {
//   FirebaseApp.initializeApp();
//   runApp(MyApp());
// ____________________________________________ Firebase Realtime Database 사용 s
//   final database = FirebaseDatabase.instance;
//   final ref = database.ref('users/me');
//   ref.set({
//   'name': 'John Doe',
//   'email': 'johndoe@example.com',
//   });
// }