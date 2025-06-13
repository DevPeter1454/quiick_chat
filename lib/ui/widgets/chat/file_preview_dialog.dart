import 'package:flutter/material.dart';
import 'package:quiick_chat/ui/common/export.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path/path.dart' as path;

class FilePreviewDialog extends StatelessWidget {
  final String fileUrl;
  final String fileName;

  const FilePreviewDialog({
    Key? key,
    required this.fileUrl,
    required this.fileName,
  }) : super(key: key);

  String _getFileExtension() {
    return path.extension(fileName).toLowerCase();
  }

  Widget _buildPreviewContent() {
    final extension = _getFileExtension();

    // Handle different file types
    switch (extension) {
      case '.pdf':
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.picture_as_pdf,
                size: 60, color: AppColors.kcPrimaryColor),
            const SizedBox(height: 16),
            Text('PDF Document', style: AppTextstyles.mediumBold),
            Text(fileName, style: AppTextstyles.small),
          ],
        );
      case '.jpg':
      case '.jpeg':
      case '.png':
      case '.gif':
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                fileUrl,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    height: 200,
                    width: 200,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    width: 200,
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image, size: 50),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(fileName, style: AppTextstyles.small),
          ],
        );
      case '.doc':
      case '.docx':
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.description, size: 60, color: Colors.blue),
            const SizedBox(height: 16),
            Text('Word Document', style: AppTextstyles.mediumBold),
            Text(fileName, style: AppTextstyles.small),
          ],
        );
      case '.xls':
      case '.xlsx':
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.table_chart, size: 60, color: Colors.green),
            const SizedBox(height: 16),
            Text('Excel Spreadsheet', style: AppTextstyles.mediumBold),
            Text(fileName, style: AppTextstyles.small),
          ],
        );
      case '.ppt':
      case '.pptx':
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.slideshow, size: 60, color: Colors.orange),
            const SizedBox(height: 16),
            Text('PowerPoint Presentation', style: AppTextstyles.mediumBold),
            Text(fileName, style: AppTextstyles.small),
          ],
        );
      default:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.insert_drive_file,
                size: 60, color: AppColors.kcPrimaryColor),
            const SizedBox(height: 16),
            Text('File', style: AppTextstyles.mediumBold),
            Text(fileName, style: AppTextstyles.small),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildPreviewContent(),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.download),
                  label: const Text('Download'),
                  onPressed: () async {
                    try {
                      final uri = Uri.parse(fileUrl);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri);
                      }
                    } catch (e) {
                      debugPrint('Error launching URL: $e');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.kcPrimaryColor,
                    foregroundColor: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Close'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
