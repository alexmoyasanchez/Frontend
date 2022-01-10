import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_auth/SideBar.dart';
import 'package:flutter_auth/generated/l10n.dart';
import 'package:flutter_auth/models/user_model.dart';
import 'package:flutter_auth/constants.dart';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:imagebutton/imagebutton.dart';
import 'package:flutter_auth/Screens/SignUp/components/background.dart';

const appId = "069b353ebf464a92b92accd413b58fb7";
const token =
    "006069b353ebf464a92b92accd413b58fb7IABLyJObkoa6JFWyZA2JS40t0f8ExvwtFPWMCBaXYRVFXtzDPrsAAAAAEADDRZkOCA7cYQEAAQAGDtxh";

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _remoteUid;
  RtcEngine _engine;
  bool _joined = false;
  bool _switch = false;

  @override
  void initState() {
    super.initState();
    initForAgora();
  }

  Future<void> initForAgora() async {
    await [Permission.microphone, Permission.camera].request();

    RtcEngineContext context = RtcEngineContext(appId);
    _engine = await RtcEngine.create(appId);

    await _engine.enableVideo();
    

    _engine.setEventHandler(
      RtcEngineEventHandler(
          joinChannelSuccess: (channel, uid, elapsed) {
        print("Local user $uid joined");
        setState(() {
          _joined = true;
        });
      }, userJoined: (uid, elapsed) {
        print("Remote user $uid joined");
        setState(() {
          _remoteUid = uid;
        });
      }, userOffline: (int uid, UserOfflineReason reason) {
        print("Remote user $uid left channel");
        setState(() {
          _remoteUid = null;
        });
      }),
    );

    await _engine.enableWebSdkInteroperability(true);

    
    VideoEncoderConfiguration configuration = VideoEncoderConfiguration();
    configuration.dimensions = VideoDimensions(width: 1920, height: 1080);
    await _engine.setVideoEncoderConfiguration(configuration);
    

    await _engine.joinChannel(token, "firstchannel", null, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: _switch ? _renderRemoteVideo() : _renderLocalPreview(),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 100,
              height: 100,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _switch = !_switch;
                  });
                },
                child: Center(
                  child: _switch ? _renderLocalPreview() : _renderRemoteVideo(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderLocalPreview() {
    if (_joined) {
      return RtcLocalView.SurfaceView();
    } else {
      return Text(
        'Please join channel first',
        textAlign: TextAlign.center,
      );
    }
  }

  Widget _renderRemoteVideo() {
    if (_remoteUid != null) {
      return RtcRemoteView.SurfaceView(uid: _remoteUid);
    } else
      return Text(
        "Please wait remote user to join",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      );
  }


}


