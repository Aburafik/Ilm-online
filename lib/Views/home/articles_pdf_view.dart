import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class ArticlesPDfVC extends StatefulWidget {
  ArticlesPDfVC({Key? key, this.url}) : super(key: key);
  String? url;

  @override
  State<ArticlesPDfVC> createState() => _ArticlesPDfVCState();
}

class _ArticlesPDfVCState extends State<ArticlesPDfVC> {
  int currentPageNumber = 0;

  int totalPages = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('$currentPageNumber/$totalPages'),
          Expanded(
            child: PDF(
              onPageChanged: (int? page, int? total) {
                setState(() {
                  currentPageNumber = page!;
                  totalPages = total!;
                });
              },
            ).cachedFromUrl(
              widget.url!,
              placeholder: (double progress) =>
                  Center(child: Text('$progress %')),
              errorWidget: (dynamic error) =>
                  Center(child: Text(error.toString())),
            ),
          ),
        ],
      ),
    );
  }
}
