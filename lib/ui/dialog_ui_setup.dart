import 'package:stacked_services/stacked_services.dart';

import 'package:wookie_movies_app/app.locator.dart';

import 'package:wookie_movies_app/core/enums/dialog_type.dart';

import 'package:wookie_movies_app/ui/widgets/dialogs/alert_dialog_widgets.dart';
import 'package:wookie_movies_app/ui/widgets/dialogs/confirmation_dialog_widget.dart';

void setupDialogUi() {
  DialogService _dialogService = locator<DialogService>();

  final dialogBuilders = {
    DialogType.Ok: (context, request, completer) => OkDialog(
          request: request,
          completer: completer,
        ),
    DialogType.Ko: (context, request, completer) => KoDialog(
          request: request,
          completer: completer,
        ),
    DialogType.Confirmation: (context, request, completer) => ConfirmationDialog(
          request: request,
          completer: completer,
        )
  };

  _dialogService.registerCustomDialogBuilders(dialogBuilders);
}
