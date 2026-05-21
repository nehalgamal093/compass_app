package com.example.compass_app

import android.content.Context
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel

class MainActivity : FlutterActivity(), SensorEventListener, EventChannel.StreamHandler{
    private lateinit var  sensorManager: SensorManager
    private var magneticSensor : Sensor ?= null
    private var eventSink : EventChannel.EventSink?=null
    private val CHANNEL = "com.compass_app.event";
    private var accelerometerSensor: Sensor? = null
    private var magnetometerSensor: Sensor? = null
    private val accelerometerValues = FloatArray(3)
    private val magnetometerValues = FloatArray(3)
    private var hasAccelerometer = false
    private var hasMagnetometer = false
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        sensorManager = getSystemService(Context.SENSOR_SERVICE) as SensorManager
        magneticSensor = sensorManager.getDefaultSensor(Sensor.TYPE_MAGNETIC_FIELD)
        accelerometerSensor = sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER)
        magnetometerSensor = sensorManager.getDefaultSensor(Sensor.TYPE_MAGNETIC_FIELD)
        val event = EventChannel(flutterEngine.dartExecutor.binaryMessenger,CHANNEL)
        event.setStreamHandler(this)
    }

    override fun onSensorChanged(event: SensorEvent?) {
        if(event?.sensor?.type == Sensor.TYPE_MAGNETIC_FIELD){
            val values = listOf(event.values[0],event.values[1],event.values[2])
            eventSink?.success(values)
            android.util.Log.d("Compass", "Magnetometer: x=${event.values[0]}, y=${event.values[1]}, z=${event.values[2]}")

        }
    }
    override fun onAccuracyChanged(p0: Sensor?, p1: Int) {
        // do nothing
    }

    override fun onListen(p0: Any?, events: EventChannel.EventSink?) {
        eventSink = events
        registerSensor()

    }

    override fun onCancel(p0: Any?) {
        unRegisterSensor()
        eventSink = null
    }
    private fun registerSensor(){
        if(eventSink == null) return
        accelerometerSensor?.let {
            sensorManager.registerListener(this, it, SensorManager.SENSOR_DELAY_UI)
        }

        magnetometerSensor?.let {
            sensorManager.registerListener(this, it, SensorManager.SENSOR_DELAY_UI)
        }
    }

    private fun unRegisterSensor(){
        sensorManager.unregisterListener(this)
    }
}
