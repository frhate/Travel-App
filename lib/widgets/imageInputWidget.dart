// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart' as file_picker;

class ImageInputWidget extends StatefulWidget {
  final Function(String) onImageSelected;

  const ImageInputWidget({Key? key, required this.onImageSelected}) : super(key: key);

  @override
  _ImageInputWidgetState createState() => _ImageInputWidgetState();
}

class _ImageInputWidgetState extends State<ImageInputWidget> {
  file_picker.PlatformFile? _image;

  Future<void> _getImage() async {
    final file_picker.FilePickerResult? result = await file_picker.FilePicker.platform.pickFiles(
      type: file_picker.FileType.image,
    );

    if (result != null) {
      setState(() {
        _image = result.files.first;
        widget.onImageSelected(_getImagePath());
      });
    }
  }

  String _getImagePath() {
    // For web, use a unique identifier as a pseudo-path.
    if (kIsWeb) {
      return 'web_${_image?.name ?? ''}';
    } else {
      // On mobile, use the actual file path.
      return _image?.path ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _getImage,
      child: _image == null
          ? Container(
              width: 100,
              height: 100,
              color: Colors.grey,
              child: const Icon(Icons.add_a_photo),
            )
          : Image.memory(
              _image!.bytes!,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
    );
  }
}
