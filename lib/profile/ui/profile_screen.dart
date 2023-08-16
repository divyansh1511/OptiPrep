import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:optiprep/authentication/ui/used_widget/text_form_widget.dart';
import 'package:optiprep/core/Inherited_Widget_uid.dart';
import 'package:optiprep/profile/api/profile_services.dart';
import 'package:optiprep/profile/ui/upload_profile_pic.dart';
import 'package:optiprep/welcome_page/welcome_page.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget _dialog(BuildContext context, String uid) {
    TextEditingController old_password_controller = TextEditingController();
    TextEditingController new_password_controller = TextEditingController();
    TextEditingController email_controller = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Update Your Password",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                labelText: "Email Address",
                controller_: email_controller,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: "Current Password",
                controller_: old_password_controller,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: "New Password",
                controller_: new_password_controller,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        FireStoreProfileServices.changeAuthPassword(
                            email: email_controller.text,
                            password: old_password_controller.text,
                            newpassword: new_password_controller.text,
                            uid: uid);
                        // Perform password update here
                        Navigator.of(context).pop();
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: const Text(
                      "Update It",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _scaleDialog(BuildContext context, String uid) {
    showGeneralDialog(
      context: context,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: _dialog(ctx, uid),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  Widget _editProfileDialogue(BuildContext context, String uid) {
    TextEditingController name_controller = TextEditingController();
    TextEditingController phone_number_controller = TextEditingController();
    final _editProfileKey = GlobalKey<FormState>();

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _editProfileKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Update Your Password",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                labelText: "Name",
                controller_: name_controller,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: "Phone Number",
                controller_: phone_number_controller,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      if (_editProfileKey.currentState!.validate()) {
                        // Perform password update here
                        FireStoreProfileServices.UpdateUserValue(
                            name: name_controller.text,
                            phone_number: phone_number_controller.text,
                            uid: uid);
                        Navigator.of(context).pop();
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: const Text(
                      "Update It",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _scaleEditProfileDialog(BuildContext context, String? uid) {
    showGeneralDialog(
      context: context,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: _editProfileDialogue(context, uid!),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    MyInheritedWidget? userData = MyInheritedWidget.of(context);
    String? userId = userData?.uid.toString();
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.black,
        // elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Hey User!",
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomePage()),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromRGBO(0, 128, 128, 1), Colors.black],
            stops: [0.0, 1.0],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder(
                stream: FireStoreProfileServices.getUser(userId),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    var Profiledata = snapshot.data!.docs[0];
                    return Container(
                      // decoration: const BoxDecoration(
                      //   gradient: LinearGradient(
                      //     begin: Alignment.topLeft,
                      //     end: Alignment.bottomRight,
                      //     colors: [Color.fromRGBO(0, 128, 128, 1), Colors.black],
                      //     stops: [0.0, 1.0],
                      //   ),
                      // ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.45,
                              width: MediaQuery.of(context).size.width * 0.9,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Colors.grey, Colors.black],
                                  stops: [0.0, 1.0],
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        AnimatedButton(
                                          width: 150,
                                          height: 40,
                                          text: "Edit Profile",
                                          // "Get Your Account ${String.fromCharCode(myIcon.codePoint)}",
                                          backgroundColor: const Color.fromRGBO(
                                              0, 128, 128, 1),
                                          selectedBackgroundColor: Colors.black,
                                          animatedOn: AnimatedOn.onHover,
                                          selectedTextColor: Colors.white,
                                          transitionType:
                                              TransitionType.LEFT_TO_RIGHT,
                                          textStyle: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                          borderWidth: 2,
                                          borderRadius: 20,
                                          borderColor: Colors.white,
                                          // borderColor: const Color.fromRGBO(0, 128, 128, 1),
                                          onPress: () {
                                            _scaleEditProfileDialog(
                                                context, userId);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                radius: 90,
                                                // backgroundImage: const
                                                backgroundColor:
                                                    Colors.transparent,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    image: Profiledata[
                                                                'profilePicture'] ==
                                                            ""
                                                        ? const DecorationImage(
                                                            image: AssetImage(
                                                                "assets/user_img.png"),
                                                          )
                                                        : DecorationImage(
                                                            image: NetworkImage(
                                                                Profiledata[
                                                                    'profilePicture']),
                                                            fit: BoxFit.cover,
                                                          ),
                                                  ),
                                                ),
                                              ),
                                              FileUploadWidget(userId!),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${Profiledata['name']}',
                                                style: const TextStyle(
                                                  fontSize: 36,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white70,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 12),
                                              Text(
                                                '${Profiledata['email']}',
                                                style: const TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.grey,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 16),
                                              Text(
                                                '${Profiledata['phone_number']}',
                                                style: const TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.grey,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              AnimatedButton(
                                                width: 300,
                                                height: 40,
                                                text: "Reset Password",
                                                // "Get Your Account ${String.fromCharCode(myIcon.codePoint)}",
                                                backgroundColor:
                                                    const Color.fromRGBO(
                                                        0, 128, 128, 1),
                                                selectedBackgroundColor:
                                                    Colors.black,
                                                animatedOn: AnimatedOn.onHover,
                                                selectedTextColor: Colors.white,
                                                transitionType: TransitionType
                                                    .LEFT_TO_RIGHT,
                                                textStyle: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                ),
                                                borderWidth: 2,
                                                borderRadius: 50,
                                                borderColor: Colors.white,
                                                // borderColor: const Color.fromRGBO(0, 128, 128, 1),
                                                onPress: () {
                                                  _scaleDialog(context, userId);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 50,
              ),
              const Center(
                  child: Text(
                "Recently Attemeted Tests",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )),
              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(userId)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  final DocumentSnapshot<Object?> docSnapshot =
                      snapshot.data as DocumentSnapshot<Object?>;
                  final ud = docSnapshot.data() as Map<String, dynamic>;

                  if (ud == null || ud['quiz_scores'] == null) {
                    return Text('No quiz scores found');
                  }

                  final quizScores = (ud['quiz_scores'] as List<dynamic>)
                      .cast<Map<String, dynamic>>();
                  print(quizScores.length);

                  return Container(
                    // height: MediaQuery.of(context).size.height * 0.7,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: quizScores.length,
                      itemBuilder: (context, index) {
                        final quizName = quizScores[index]['quiz_name'];
                        final score = quizScores[index]['score'];
                        final total_pr = quizScores[index]['total_problem'];

                        return ListTile(
                          title: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 32,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Colors.black, Colors.grey],
                                  stops: [1.0, 0.0],
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "${index + 1}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    quizName ?? 'Quiz Name not available',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Score: ${score ?? 0} / ${total_pr ?? 0}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
