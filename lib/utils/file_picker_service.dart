import 'dart:io';

import 'package:file_picker/file_picker.dart';

class FilePickerService {
  /// Constructs a new instance of [FilePickerService].
  FilePickerService();

  /// Instance of the FilePicker platform interface used for picking files.
  final _filePicker = FilePicker.platform;

  Future<File?> _pickFile({
    required FileType fileType,
    List<String>? allowedExtensions,
  }) async {
    try {
      // Pick file of specified type
      FilePickerResult? result = await _filePicker.pickFiles(
        type: fileType,
        allowedExtensions: allowedExtensions,
      );
      // Return the first file if available
      final platformFile = result?.files.first;
      if (platformFile == null) return null;
      final file = File(platformFile.path!);
      return file;
    } catch (e) {
      // Rethrow any caught exceptions
      rethrow;
    }
  }

  Future<List<File?>> _pickMultipleFile({
    required FileType fileType,
    List<String>? allowedExtensions,
  }) async {
    try {
      // Pick file of specified type
      FilePickerResult? result = await _filePicker.pickFiles(
        allowMultiple: true,
        type: fileType,
        allowedExtensions: allowedExtensions,
      );
      // Return the first file if available
      final platformFile = result?.files;
      if (platformFile == null) return [];
      List<File?> file = platformFile.map((path) => File(path.path!)).toList();
      return file;
    } catch (e) {
      // Rethrow any caught exceptions
      rethrow;
    }
  }

  /// Allows the user to pick an image file and returns the selected file.
  ///
  /// Returns a [File] representing the picked image file.
  /// If no file is picked, returns null.
  ///
  /// Throws an error if there's an issue during the file picking process.
  Future<File?> pickImage() async {
    try {
      // Call internal method to pick image file
      return await _pickFile(fileType: FileType.image);
    } catch (e) {
      // Rethrow any caught exceptions
      rethrow;
    }
  }

  /// Allows the user to pick an Multiple image file and returns the selected file.
  ///
  /// Returns a [File] representing the picked Multiple image file.
  /// If no file is picked, returns null.
  ///
  /// Throws an error if there's an issue during the file picking process.
  Future<List<File?>> pickMultiImage() async {
    try {
      // Call internal method to pick image file
      return await _pickMultipleFile(fileType: FileType.image);
    } catch (e) {
      // Rethrow any caught exceptions
      rethrow;
    }
  }

  Future<File?> pickAudio() async {
    try {
      // Call internal method to pick audio file
      return await _pickFile(fileType: FileType.audio);
    } catch (e) {
      // Rethrow any caught exceptions
      rethrow;
    }
  }

  Future<File?> pickVideo() async {
    try {
      // Call internal method to pick video file
      return await _pickFile(fileType: FileType.video);
    } catch (e) {
      // Rethrow any caught exceptions
      rethrow;
    }
  }

  Future<File?> pickFile() async {
    try {
      // Call internal method to pick file
      return await _pickFile(
        fileType: FileType.custom,
        allowedExtensions: ['pdf'],
      );
    } catch (e) {
      // Rethrow any caught exceptions
      rethrow;
    }
  }
}
