import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';


class FilePickerScreen extends StatefulWidget {
  const FilePickerScreen({Key? key}) : super(key: key);

  @override
  _FilePickerScreenState createState() => _FilePickerScreenState();
}

class _FilePickerScreenState extends State<FilePickerScreen> {
  String? _filePath;
  String? _fileContent;
  File? _selectedFile;

  Future<void> _pickFile() async {
    try {
      // Pick file
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any, // You can specify the type: FileType.image, FileType.video, etc.
        allowMultiple: false,
      );

      if (result != null) {
        setState(() {
          _filePath = result.files.single.path;
          _selectedFile = File(_filePath!);
        });

        // Read file content if it's a text file
        if (_filePath!.toLowerCase().endsWith('.txt')) {
          final content = await File(_filePath!).readAsString();
          setState(() {
            _fileContent = content;
          });
        }
      }
    } catch (e) {
      print('Error picking file: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking file: $e')),
      );
    }
  }

  Future<void> _pickImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result != null) {
        setState(() {
          _filePath = result.files.single.path;
          _selectedFile = File(_filePath!);
          _fileContent = null; // Clear text content when picking image
        });
      }
    } catch (e) {
      print('Error picking image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking image: $e')),
      );
    }
  }

  Future<void> _pickDocument() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
        allowMultiple: false,
      );

      if (result != null) {
        setState(() {
          _filePath = result.files.single.path;
          _selectedFile = File(_filePath!);
          _fileContent = null; // Clear text content when picking document
        });
      }
    } catch (e) {
      print('Error picking document: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking document: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Picker Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _pickFile,
              child: const Text('Pick Any File'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Pick Image'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _pickDocument,
              child: const Text('Pick Document'),
            ),
            const SizedBox(height: 24),
            if (_filePath != null) ...[
              Text(
                'Selected File:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(_filePath!),
              const SizedBox(height: 16),
              if (_selectedFile != null && _selectedFile!.path.toLowerCase().endsWith('.png') || 
                  _selectedFile!.path.toLowerCase().endsWith('.jpg') || 
                  _selectedFile!.path.toLowerCase().endsWith('.jpeg'))
                Image.file(
                  _selectedFile!,
                  height: 200,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text('Error loading image');
                  },
                ),
              if (_fileContent != null) ...[
                const SizedBox(height: 16),
                Text(
                  'File Content:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(_fileContent!),
                  ),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}