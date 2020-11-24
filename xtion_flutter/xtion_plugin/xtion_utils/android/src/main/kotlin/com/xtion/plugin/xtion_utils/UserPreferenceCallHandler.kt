package com.xtion.plugin.xtion_utils

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class UserPreferenceCallHandler: MethodChannel.MethodCallHandler {

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {

        val name = call.argument<String>("name") ?: SPHelper.Default.name

        when(call.method) {

            "putString" -> {
                SPHelper.putString(name, call.argument("key") ?: "", call.argument("value") ?: "")
            }
            "getString" -> {
                val r = SPHelper.getString(name, call.argument("key") ?: "", call.argument("value"))
                result.success(r)
            }
            "putMap" -> {
                SPHelper.putMap(name, call.argument("value") as? Map<String, Any> ?: emptyMap())
            }
            "getMap" -> {
                val r = SPHelper.getMap(name)
                result.success(r)
            }
        }
    }
}