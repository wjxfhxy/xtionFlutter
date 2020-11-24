import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xtion_common_component/ent_login/widget/enterprise_text_input_controller.dart';

class EnterpriseTextInput extends StatefulWidget {

 // void Function(String, void Function) _onPress;

  EnterpriseTextInputController _enterpriseTextInputController;

 // EnterpriseTextInput(this._onPress);

  EnterpriseTextInput(this._enterpriseTextInputController);

  @override
  State<StatefulWidget> createState() {
    return _EnterpriseTextInputState();
  }
}

class _EnterpriseTextInputState extends State<EnterpriseTextInput> with TickerProviderStateMixin {

  AnimationController _rotationAnimationController;
  AnimationController _compressAnimationController;
  Animation _compressAnimation;

  TextEditingController _textEditingController;

  bool _isClickable = true;

  @override
  void initState() {
    super.initState();
    _rotationAnimationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _compressAnimationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _compressAnimation = Tween<double>(begin: 300, end: 48).animate(_compressAnimationController)
      ..addListener(_listenCompressAnimation)..addStatusListener(_listenCompressAnimationStatus);

    _textEditingController = widget._enterpriseTextInputController.entNameController;
  }

  @override
  void dispose() {

    _compressAnimation.removeListener(_listenCompressAnimation);
    _compressAnimation.removeStatusListener(_listenCompressAnimationStatus);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _compressAnimation.value,//48
        height: 50,
        decoration: BoxDecoration(
            color: const Color(0xFFF1F3FF), borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Container(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(border: InputBorder.none),
                textAlign: TextAlign.center,
              ),
            )),
            _RotationButton(_rotationAnimationController, () {

              if(!_isClickable)
                return;
              _isClickable = false;

              //  _animationController.forward();
              _rotationAnimationController.repeat();

              _compressAnimationController.forward();

          //    widget._onPress(_textEditingController.text, _stopAnimation);

              var startAnimation = widget._enterpriseTextInputController.startAnimation;
              if(startAnimation != null) {
                startAnimation(_textEditingController.text);
                widget._enterpriseTextInputController.stopAnimation = _stopAnimation;
              }

            })
          ],
        ));
  }

  void _listenCompressAnimation() {

    setState(() {

    });
  }

  void _listenCompressAnimationStatus(status) {

    if(status == AnimationStatus.completed || status == AnimationStatus.dismissed) {
      _isClickable = true;
    }
  }

  void _stopAnimation() {

    _rotationAnimationController.reset();

    _compressAnimationController.reverse();
  }
}

class _RotationButton extends StatefulWidget {
  final AnimationController _animationController;

  final VoidCallback _onPressed;

  _RotationButton(this._animationController, this._onPressed);

  @override
  State<StatefulWidget> createState() {
    return _RotationButtonState();
  }
}

class _RotationButtonState extends State<_RotationButton> {
  var imagePath = "images/login/ent_login_btn_go.png";

  @override
  void initState() {
    super.initState();

    widget._animationController.addStatusListener(listenAnimateionStatus);
  }

  @override
  void dispose() {
    super.dispose();

    widget._animationController.removeStatusListener(listenAnimateionStatus);
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: widget._animationController,
      child: IconButton(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        icon: Image.asset(imagePath, package: "xtion_common_component"),
        onPressed: () {
          widget._onPressed();
        },
      ),
    );
  }

  void listenAnimateionStatus(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.forward:
        imagePath = "images/login/ent_login_btn_loading.png";
        break;
      case AnimationStatus.completed:
      case AnimationStatus.dismissed:
        imagePath = "images/login/ent_login_btn_go.png";
        break;
    }
    setState(() {});
  }
}
