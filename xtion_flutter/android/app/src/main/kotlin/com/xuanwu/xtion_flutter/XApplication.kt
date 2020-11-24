package com.xuanwu.xtion_flutter

import com.xtion.plugin.xtion_utils.ApplicationContext

class XApplication: io.flutter.app.FlutterApplication() {

    override fun onCreate() {

        super.onCreate()

        ApplicationContext.context = this
    }
    
}