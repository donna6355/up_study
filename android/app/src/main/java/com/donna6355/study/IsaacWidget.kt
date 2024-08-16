package com.donna6355.study

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.widget.RemoteViews

/**
 * Implementation of App Widget functionality.
 */

// New import.
import es.antonborri.home_widget.HomeWidgetPlugin

class IsaacWidget : AppWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        // There may be multiple widgets active, so update all of them
        for (appWidgetId in appWidgetIds) {           // Get reference to SharedPreferences
            val widgetData = HomeWidgetPlugin.getData(context)
            val views = RemoteViews(context.packageName, R.layout.isaac_widget).apply {

                val title = widgetData.getString("title", null)
                setTextViewText(R.id.title, title ?: "No title set")
            }

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }

        
    }

}
