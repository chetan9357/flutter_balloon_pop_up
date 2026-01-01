class BalloonPopupController {
  void Function()? _show;
  void Function()? _hide;

  void bind({
    required void Function() show,
    required void Function() hide,
  }) {
    _show = show;
    _hide = hide;
  }

  void show() => _show?.call();
  void hide() => _hide?.call();
}
