import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../locator/locator.dart';
import 'base_view_model.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Function(T model)? onModelReady;
  final Function(T model)? onDispose;
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Widget? child;
  const BaseView({
    Key? key,
    this.onDispose,
    this.onModelReady,
    required this.builder,
    this.child,
  }) : super(key: key);

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  late T model;

  @override
  void initState() {
    super.initState();
    model = locator<T>();
    widget.onModelReady?.call(model);
  }

  @override
  void dispose() {
    widget.onDispose?.call(model);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => model,
      child: Consumer<T>(
         
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
