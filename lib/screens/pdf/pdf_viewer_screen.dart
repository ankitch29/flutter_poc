

import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewerScreen extends StatelessWidget {
   PDFViewerScreen({Key? key}) : super(key: key);
  // final pdfController = PdfController(
  //   document: PdfDocument.openAsset('images/cibil.pdf'),
  // );
  //
  // Widget pdfView() => PdfView(
  //   controller: pdfController,
  // );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfPdfViewer.network(
        'https://www.cibil.com/resources/docs/understand-your-cibil-company-credit-report.pdf',
      ),
    );
  }

}