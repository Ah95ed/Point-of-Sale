package com.app.sell.net.point_of_sell


import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.engine.FlutterEngine
// import androidx.core.content.Intent
import android.content.Intent
import android.net.Uri

class MainActivity: FlutterActivity() {
    private var resultChannel: MethodChannel.Result? = null
    private val Channel = "com.Native.app/openStorage"
    private val REQUEST_CODE = 100

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, Channel)
        .setMethodCallHandler { call, result ->
            if (call.method == "runJavaCode") {
                resultChannel = result
               
                val intent = Intent(Intent.ACTION_CREATE_DOCUMENT).apply {
                    type = "csv/write"
                    putExtra(Intent.EXTRA_TITLE, "my.csv")
                }
   
                startActivityForResult(intent, REQUEST_CODE)
            
           
        }
    }
  

}
 override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
    super.onActivityResult(requestCode, resultCode, data)

    if (requestCode == REQUEST_CODE) {
        if (resultCode == RESULT_OK) {
            val uri = data?.data // الحصول على Uri الملف المختار
            resultChannel?.success(uri.toString()) // إرساله إلى Flutter
        } else {
            resultChannel?.error("CANCELLED", "User cancelled the operation", null)
        }
        resultChannel = null // إعادة الضبط
    }
}

}