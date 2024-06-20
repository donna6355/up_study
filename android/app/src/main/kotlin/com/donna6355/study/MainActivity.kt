package com.donna6355.study

import android.content.BroadcastReceiver
import io.flutter.embedding.android.FlutterFragmentActivity
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.nfc.NfcAdapter
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import android.util.Log
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodCodec

class MainActivity: FlutterFragmentActivity() {
    private val CHANNEL = "samples.flutter.dev/battery"
    private val NFCCHANNEL = "samples.flutter.dev/nfc"
    private val EVENTCHANNEL = "samples.flutter.dev/nfcevent"
    private val PAYCHANNEL = "samples.flutter.dev/pay"
    private var nfcAdapter: NfcAdapter? = null

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        nfcAdapter  = NfcAdapter.getDefaultAdapter(this@MainActivity)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
        // This method is invoked on the main thread.
        call, result ->
            if (call.method == "getBatteryLevel") {
                val batteryLevel = getBatteryLevel()

                if (batteryLevel != -1) {
                result.success(batteryLevel)
                } else {
                result.error("UNAVAILABLE", "Battery level not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, PAYCHANNEL).setMethodCallHandler {
        // This method is invoked on the main thread.
        call, result ->
            if (call.method == "openPayWeb") {
                val intent = Intent(this, WebViewActivity::class.java)
                startActivity(intent)
            } else {
                result.notImplemented()
            }
        }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, NFCCHANNEL).setMethodCallHandler {
        // This method is invoked on the main thread.
        call, result ->
            when(call.method){
                "isNfcAvailable"->result.success(nfcAdapter?.isEnabled == true)
                "initNfc"->init(call,result)
                "addRes"->addApduResponse(call,result)
                "removeRes"-> removeApduResponse(call,result)
                else->result.notImplemented()
            }
        }

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, EVENTCHANNEL).setStreamHandler(
            HCEHandler
        )
    }

    private fun getBatteryLevel(): Int {
        val batteryLevel: Int
        if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
        val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
        batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
        val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
        batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        }

        return batteryLevel
    }

    private fun init(call:MethodCall, result:MethodChannel.Result) {
        try {
            HceService.permanentApduResponses =
                call.argument<Boolean>("permanentApduResponses")!!;
            HceService.listenOnlyConfiguredPorts =
                call.argument<Boolean>("listenOnlyConfiguredPorts")!!;

            val aid = call.argument<ByteArray>("aid");
            if(aid != null) HceService.aid = aid;

            val cla = call.argument<Int>("cla")?.toByte();
            if(cla != null) HceService.cla = cla;

            val ins = call.argument<Int>("ins")?.toByte();
            if(ins != null) HceService.ins = ins;

            val AID = HceService.byteArrayToString(HceService.aid)
            Log.d("HCE", "HCE initialized. AID = $AID.")
        }
        catch(e : Exception) {
            result.error("invalid method parameters", "invalid parameters in 'init' method", null)
        }

        result.success("HCE INITIALIZED")
    }

    private fun addApduResponse(call: MethodCall, result: MethodChannel.Result) {
        try {
            val port = call.argument<Int>("port")!!
            val data = call.argument<ByteArray>("data")!!

            HceService.portData[port] = data

            val portData = HceService.byteArrayToString(HceService.portData[port]!!)
            Log.d("HCE", "Added $portData to port $port")
        }
        catch(e : Exception) {
            result.error("invalid method parameters", "invalid parameters in 'addApduResponse' method", null)
        }

        result.success("APDU RESPONSE ADDED")
    }

    private fun removeApduResponse(call: MethodCall, result: MethodChannel.Result) {
        try {
            val port = call.argument<Int>("port")!!
            HceService.portData.remove(port)

            Log.d("HCE", "Removed APDU response from port $port")
        }
        catch(e : Exception) {
            result.error("invalid method parameters", "invalid parameters in 'removeApduResponse' method", null)
        }

        result.success("APDU RESPONSE REMOVED")
    }


}