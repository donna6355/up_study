package com.donna6355.study

import android.nfc.cardemulation.HostApduService
import android.os.Bundle
import android.util.Log
import io.flutter.plugin.common.EventChannel

class HceService: HostApduService() {
    companion object {
        var permanentApduResponses = false
        var listenOnlyConfiguredPorts = false

        var aid = byteArrayOf(0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00)
        var cla : Byte = 0
        var ins : Byte = 0xA4.toByte()

        var portData = mutableMapOf<Int, ByteArray>()

        fun byteArrayToString(array: ByteArray) : String
        {
            var str = "["
            for(i in 0..array.size - 2)
                str += " ${array[i].toUByte().toString(16)},"
            str += " ${array[array.size - 1].toUByte().toString(16)} ]"

            return str
        }
    }

    val SUCCESS = byteArrayOf(0x90.toByte(), 0x00)
    val BAD_LENGTH = byteArrayOf(0x67, 0x00)
    val UNKNOWN_CLA = byteArrayOf(0x6E, 0x00)
    val UNKNOWN_INS = byteArrayOf(0x6D, 0x00)
    val UNSUPPORTED_CHANNEL = byteArrayOf(0x68, 0x81.toByte())
    val FAILURE = byteArrayOf(0x6F, 0x00)

   override fun processCommandApdu(commandApdu: ByteArray,
                                   extras: Bundle?): ByteArray {
        
        Log.d("HCE","THIS IS INCOMING ${byteArrayToString(commandApdu)}")

       if(commandApdu[0] != cla) return UNKNOWN_CLA
       if(commandApdu[1] != ins) return UNKNOWN_INS
       val port : Int = commandApdu[3].toUByte().toInt()

       if(commandApdu[4].toInt() != aid.size) return BAD_LENGTH
       for(i in 0..(aid.size - 1))
           if(commandApdu[i + 5] != aid[i])
               return UNSUPPORTED_CHANNEL
       val responseApdu = portData[port]

       if(responseApdu == null) return FAILURE

       if(permanentApduResponses == false) portData.remove(port)

       Log.d("HCE","send Response ${byteArrayToString(responseApdu + SUCCESS)}")

       HCEHandler.updateHCEResponse("success")

       return responseApdu + SUCCESS
   }

    override fun onDeactivated(reason: Int) {}
}

object HCEHandler : EventChannel.StreamHandler {
    private var eventSink: EventChannel.EventSink? = null

    fun updateHCEResponse(msg:String){
        Log.d("HCE","HANDLER POST")
        eventSink?.success(msg)
    }


    override fun onListen(arguments: Any?, sink: EventChannel.EventSink) {
        Log.d("HCE","HANDLER LISTEN")

        eventSink = sink
    }

    override fun onCancel(arguments: Any?) {
        Log.d("HCE","HANDLER CANCEL")
        eventSink = null
    }
}