import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:walkdown/data/configuration/gap_sizes.dart';

class ModalService {
  void shadToast(
    BuildContext context, {
    Widget? title,
    Widget? child,
    Function()? onPressed,
  }) => ShadToaster.of(context).show(
    ShadToast(
      title: title,
      action: child == null
          ? null
          : ShadButton.outline(onPressed: onPressed, child: child),
    ),
  );

  void shadToastDestructive(
    BuildContext context, {
    Widget? title,
    Widget? description,
    Widget? child,
    Function()? onPressed,
  }) => ShadToaster.of(context).show(
    ShadToast.destructive(
      title: title,
      description: description,
      action: ShadButton.outline(
        decoration: ShadDecoration(
          border: ShadBorder.all(
            color: Theme.of(context).colorScheme.error,
            width: 1,
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    ),
  );

  Future<bool?> shadConfirmationDialog(
    BuildContext context, {
    Widget? title,
    Widget? description,
    Widget? child,
  }) => showShadDialog(
    context: context,
    builder: (context) => Padding(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: GapSizes.xlGap.mainAxisExtent,
      ),
      child: ShadDialog.alert(
        title: title,
        description: description,
        actions: [
          ShadButton.outline(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          ShadButton(
            child: const Text('Continue'),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
        child: child,
      ),
    ),
  );
}
