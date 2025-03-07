package com.app.sell.net.point_of_sell


import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.engine.FlutterEngine
// import androidx.core.content.Intent
import android.content.Intent
import android.net.Uri
import java.io.IOException


class MainActivity: FlutterActivity() {
    private var resultChannel: MethodChannel.Result? = null
    private val Channel = "com.Native.app/openStorage"
    private val REQUEST_CODE = 100
    private var list = listOf<Map<String,String>>()
// var list: List<Map<String, Any>> = listOf()
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // MethodChannel(flutterEngine.dartExecutor.binaryMessenger,
        //  Channel)
        //     .setMethodCallHandler { call, result ->
        //         if (call.method == "runJavaCode") {

                   
        //             resultChannel = result

        //             // list = call.argument("list")!!
        //             // Log.d("TAG", "configureFlutterEngine:1 ${list.get()} ")
                  
                    
        //                 val intent = Intent(Intent.ACTION_CREATE_DOCUMENT).apply {
        //                     addCategory(Intent.CATEGORY_OPENABLE)
        //                     type = "csv/write"
        //                     putExtra(Intent.EXTRA_TITLE, "my.csv")
        //                 }


        //                 startActivityForResult(intent, REQUEST_CODE)


                    
        //         }
        //     }


    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        if (requestCode == REQUEST_CODE) {
            if (resultCode == RESULT_OK) {
                val uri = data?.data // الحصول على Uri الملف المختار
                if (uri != null) {
                    //  val d = Uri.parse(uri.toString())
                val decode = Uri.decode(uri.path)
//                    exportData(uri)
                     resultChannel?.success(decode)
                }
                // إرساله إلى Flutter

            } else {
                resultChannel?.error(
                    "CANCELLED", "User cancelled the operation",
                    null
                )
            }
            resultChannel = null // إعادة الضبط
        }
    }

    //  @SuppressLint("NewApi")
    //  private fun exportData(uri: Uri): Unit = try {
    //      val outputStream: OutputStream = contentResolver.openOutputStream(uri)
    //          ?: throw IOException("Failed to open output stream")

    //      val keys = if (list.isNotEmpty()) list[0].keys else emptySet()

    //     //  كتابة الصف الأول (رؤوس الأعمدة)
    //      outputStream.write(keys.joinToString(",").toByteArray(Charsets.UTF_8))
    //      outputStream.write("\n".toByteArray(Charsets.UTF_8))

    //     //  كتابة البيانات (كل `Map` في القائمة يمثل صفًا جديدًا)
    //      for (map in list) {
    //          val row = keys.joinToString(",") { key -> map[key].toString() }
    //          outputStream.write(row.toByteArray(Charsets.UTF_8))
    //          outputStream.write("\n".toByteArray(Charsets.UTF_8))
    //      }
    //     for (i in list.indices) {

    //         for ((key, value) in list[i]){

    //            outputStream.write(value.toString().toByteArray(Charsets.UTF_8))
    //            outputStream.write(",".toString().toByteArray(Charsets.UTF_8))
    //            outputStream.write(value.toString().toByteArray(Charsets.UTF_8))
    //            outputStream.write(",".toString().toByteArray(Charsets.UTF_8))
    //            outputStream.write(value.toString().toByteArray(Charsets.UTF_8))
    //            outputStream.write(",".toString().toByteArray(Charsets.UTF_8))
    //            outputStream.write(value.toString().toByteArray(Charsets.UTF_8))
    //            outputStream.write(",".toString().toByteArray(Charsets.UTF_8))
    //            outputStream.write(value.toString().toByteArray(Charsets.UTF_8))
    //            outputStream.write(",".toString().toByteArray(Charsets.UTF_8))
    //            outputStream.write(value.toString().toByteArray(Charsets.UTF_8))
    //            outputStream.write(",".toString().toByteArray(Charsets.UTF_8))
    //            outputStream.write(value.toString().toByteArray(Charsets.UTF_8))
    //            outputStream.write(",".toString().toByteArray(Charsets.UTF_8))
    //            outputStream.write(value.toString().toByteArray(Charsets.UTF_8))
    //            outputStream.write("\n".toString().toByteArray(Charsets.UTF_8))
    //        }
    //     }
    //      outputStream.flush()
    //      outputStream.close()
    //  } catch (e: IOException) {
    //      throw RuntimeException(e)
    //  }
}
