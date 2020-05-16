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

    private lateinit var methodChannel: MethodChannel

    /**
     * 给改Activity承载的Flutter页面传递参数
     * 在main.dart中可以根据参数不同显示不同Flutter page
     */
    override fun getInitialRoute(): String {
        return "***** hello getInitialRoute *****"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(flutterEngine!!)
        methodChannel_Test()
    }

    private fun methodChannel_Test() {
        methodChannel = MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, methodChannel_name)
        // flutter call java
        methodChannel.setMethodCallHandler(object : MethodChannel.MethodCallHandler {
            override fun onMethodCall(methodCall: MethodCall, result: MethodChannel.Result) {
                Log.i("xxxxx", "MainActivity onMethodCall ${methodCall.method}")
                if (methodCall.method.contentEquals("test_dart_call_java")) {
                    showToast("test_dart_call_java")
                    result.success("test_dart_call_java success")
                }
            }
        })
    }

    override fun onResume() {
        super.onResume()
        Log.i("xxxxx", "MainActivity onResume")
        // java call flutter
        var str = "hello flutter"
        methodChannel.invokeMethod("java_call_flutter", str, object : MethodChannel.Result {
            override fun notImplemented() {
                Log.i("xxxxx", "MainActivity java_call_flutter notImplemented")
            }

            override fun error(p0: String?, p1: String?, p2: Any?) {
                Log.i("xxxxx", "MainActivity java_call_flutter error p0:$p0,p1:$p1,p2:$p2")
            }

            override fun success(p0: Any?) {
                Log.i("xxxxx", "MainActivity java_call_flutter success p0:$p0")
            }

        })
    }

    private fun eventChannel_Test() {

    }

    private fun showToast(msg: String) {
        runOnUiThread(Runnable {
            Toast.makeText(this@MainActivity, msg, Toast.LENGTH_SHORT).show()
        })
    }
}
