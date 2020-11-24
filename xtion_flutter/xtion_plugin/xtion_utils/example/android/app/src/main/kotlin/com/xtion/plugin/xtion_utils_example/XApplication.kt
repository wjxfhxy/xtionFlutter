package com.xtion.plugin.xtion_utils_example

import com.xtion.plugin.xtion_utils.ApplicationContext
import com.xtion.plugin.xtion_utils.SPHelper

class XApplication: io.flutter.app.FlutterApplication() {

    override fun onCreate() {

        super.onCreate()

        ApplicationContext.context = this
    }
    
}