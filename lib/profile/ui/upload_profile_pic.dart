import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FileUploadWidget extends StatefulWidget {
  String userId;
  FileUploadWidget(this.userId, {super.key});
  @override
  _FileUploadWidgetState createState() => _FileUploadWidgetState();
}

class _FileUploadWidgetState extends State<FileUploadWidget> {
  String? fileName;
  Uint8List? fileBytes;

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        fileName = result.files.single.name;
        fileBytes = result.files.single.bytes;
      });
    }
  }

  void _uploadFile() async {
    if (fileBytes != null) {
      // Upload the file to Firebase Storage
      final storageRef =
          FirebaseStorage.instance.ref().child('profile_pictures/$fileName');
      await storageRef.putData(fileBytes!);

      // Get the download URL of the uploaded file
      String downloadUrl = await storageRef.getDownloadURL();

      await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userId)
          .update({
        'profilePicture': downloadUrl,
      });

      // Use the download URL as the user's profile picture
      // Update the user's profile picture URL in Firestore or Firebase Authentication
      // Here you can update the user's profile picture URL in Firestore or Firebase Authentication as per your implementation.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _pickFile,
          child: Text('Select Image'),
        ),
        const SizedBox(
          height: 10,
        ),
        if (fileName != null) Text('Selected Image: $fileName'),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: _uploadFile,
          child: Text('Upload Image'),
        ),
      ],
    );
  }
}
