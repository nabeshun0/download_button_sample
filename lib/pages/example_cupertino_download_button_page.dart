import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:download_buttton_sample/widgets/demo_icon.dart';
import 'package:download_buttton_sample/widgets/donwload_button.dart';

import './simulated_download_controller.dart';

class ExampleCupertinoDownloadButtonPage extends StatefulWidget {
  @override
  _ExampleCupertinoDownloadButtonPageState createState() =>
      _ExampleCupertinoDownloadButtonPageState();
}

class _ExampleCupertinoDownloadButtonPageState
    extends State<ExampleCupertinoDownloadButtonPage> {
  late final List<DownloadController> _downloadControllers;

  @override
  void initState() {
    super.initState();
    _downloadControllers = List<DownloadController>.generate(
      20,
      (index) => SimulatedDownloadController(onOpenDownload: () {
        _openDownload(index);
      }),
    );
  }

  void _openDownload(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Open App ${index + 1}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apps'),
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return ListView.separated(
      itemCount: _downloadControllers.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: _buildListItem,
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    final theme = Theme.of(context);
    final downloadController = _downloadControllers[index];

    return ListTile(
      leading: const DemoAppIcon(),
      title: Text(
        'App ${index + 1}',
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.headline6,
      ),
      subtitle: Text(
        'Lorem ipsum dolor #${index + 1}',
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.caption,
      ),
      trailing: SizedBox(
        width: 96.0,
        child: AnimatedBuilder(
          animation: downloadController,
          builder: (context, child) {
            return DownloadButton(
              status: downloadController.downloadStatus,
              downloadProgress: downloadController.progress,
              onDownload: downloadController.startDownload,
              onCancel: downloadController.stopDownload,
              onOpen: downloadController.openDownload,
            );
          },
        ),
      ),
    );
  }
}
