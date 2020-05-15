package com.zw.flutterapp1

import android.os.Bundle
import android.util.Log
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    companion object {
        val methodChannel_name = "app.methodChannel.shared.data"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(flutterEngine!!)

        methodChannel_Test()
    }

    private fun methodChannel_Test() {
        var methodChannel = MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, methodChannel_name)
        methodChannel.setMethodCallHandler(object : MethodChannel.MethodCallHandler {
            override fun onMethodCall(methodCall: MethodCall, result: MethodChannel.Result) {
                Log.i("xxxxx", "MainActivity onMethodCall ${methodCall.method}")
                if (methodCall.method.contentEquals("test_dart_call_java")){
                    showToast("test_dart_call_java")
                    result.success("test_dart_call_java success")
                }

            }
        }
        )
    }

    private fun eventChannel_Test() {

    }

    private fun showToast(msg: String) {
        runOnUiThread(Runnable {
            Toast.makeText(this@MainActivity, msg, Toast.LENGTH_SHORT).show()
        })
    }
}
