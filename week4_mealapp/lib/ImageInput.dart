import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart' as sysPath;
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  Function onSelectImage;
  ImageInput(this.onSelectImage);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 600,
      maxWidth: 600,
    );
    setState(() {
      _storedImage = File(imageFile!.path);
    });
    final appDir = await sysPath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile!.path);
    final savedImage =
        await File(imageFile.path).copy('${appDir.path}/$fileName');
    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              border: Border.all(
            width: 1,
            color: Colors.grey,
          )),
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Text('No image yet'),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: ElevatedButton(
          child: const Icon(Icons.camera),
          onPressed: _takePicture,
        ))
      ],
    );
  }
}
