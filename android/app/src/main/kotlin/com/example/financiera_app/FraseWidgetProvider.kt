package com.example.financiera_app

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.graphics.Color
import android.widget.RemoteViews
import java.util.Calendar

class FraseWidgetProvider : AppWidgetProvider() {

    private data class Frase(val emoji: String, val texto: String, val autora: String, val color: String)

    companion object {
        private val frases = listOf(
            Frase("🌟", "Tu libertad financiera no es un sueño, es un destino al que llegas un paso a la vez.", "Liderazgo Sin Fronteras", "#B47FFF"),
            Frase("💎", "El dinero no te da felicidad, pero la libertad que compra, sí.", "LSF Finanzas", "#4ECDC4"),
            Frase("💰", "No trabajas para el dinero. Haces que el dinero trabaje para ti.", "Robert Kiyosaki", "#00FFB2"),
            Frase("🔥", "Cada 'no' que escuchas te acerca más al 'sí' que cambiará tu vida.", "LSF", "#FF8C61"),
            Frase("📈", "Si no encuentras la manera de ganar mientras duermes, trabajarás para siempre.", "Warren Buffett", "#FFD166"),
            Frase("🤝", "Tu red de contactos es tu patrimonio neto. Construye relaciones, no solo ventas.", "Porter Gale", "#FF6BA8"),
            Frase("👑", "El éxito no es el destino; es la persona en que te conviertes durante el viaje.", "LSF", "#B47FFF"),
            Frase("✨", "Una mujer con visión no pide permiso para brillar. Simplemente lo hace.", "LSF", "#4ECDC4"),
            Frase("🚀", "La diferencia entre donde estás y donde quieres estar es lo que haces hoy.", "LSF", "#00FFB2"),
            Frase("⏰", "No esperes el momento perfecto. Toma el momento y hazlo perfecto.", "LSF", "#FF8C61"),
            Frase("📖", "Tu historia financiera puede cambiar hoy. Tú escribes el siguiente capítulo.", "LSF", "#FFD166"),
            Frase("💡", "Las grandes oportunidades llegan disfrazadas de trabajo duro.", "Thomas Edison", "#FF6BA8"),
            Frase("🕐", "No se trata de tener tiempo. Se trata de crear tiempo para lo que de verdad importa.", "LSF", "#B47FFF"),
            Frase("⚡", "Una mujer emprendedora no teme al fracaso; lo usa como combustible.", "LSF", "#4ECDC4"),
            Frase("🧠", "Tu mentalidad es tu activo más valioso. Cuídala y aliméntala cada mañana.", "LSF", "#00FFB2"),
            Frase("🌉", "La disciplina es el puente entre tus metas y tus logros.", "Jim Rohn", "#FF8C61"),
            Frase("👯", "Rodéate de mujeres que ya tienen lo que tú quieres lograr.", "LSF Comunidad", "#FFD166"),
            Frase("🐷", "Cada peso que ahorras hoy es un paso de libertad hacia tu futuro.", "LSF", "#FF6BA8"),
            Frase("🏆", "El éxito es la suma de pequeños esfuerzos repetidos día tras día.", "Robert Collier", "#B47FFF"),
            Frase("🛤", "No te compares con nadie. Tu camino es único; tu ritmo, tuyo.", "LSF", "#4ECDC4"),
            Frase("🌴", "La riqueza verdadera es tener tiempo para vivir como tú quieres.", "LSF", "#00FFB2"),
            Frase("📚", "Invierte en ti primero. Tu aprendizaje es el motor de todo lo demás.", "LSF", "#FF8C61"),
            Frase("💪", "Haz hoy lo que los demás no quieren hacer. Mañana tendrás lo que ellos no pueden tener.", "LSF", "#FFD166"),
            Frase("🌱", "Tu negocio crece exactamente en la medida en que tú creces.", "LSF", "#FF6BA8"),
            Frase("🌻", "Una venta es una semilla. Planta muchas y cosecha tu jardín de libertad.", "LSF Ventas", "#B47FFF"),
            Frase("🎯", "La consistencia supera al talento cuando el talento no es consistente.", "Tim Notke", "#4ECDC4"),
            Frase("❤", "Tu familia merece la mejor versión de ti: libre, próspera y llena de propósito.", "LSF", "#00FFB2"),
            Frase("🦁", "No eres demasiado grande para empezar pequeño. Eres demasiado poderosa para no empezar.", "LSF", "#FF8C61"),
            Frase("🙏", "La gratitud abre las puertas que el esfuerzo construye. Ambas son necesarias.", "LSF", "#FFD166"),
            Frase("🏰", "Cada mañana tienes una nueva oportunidad de construir el Imperio que mereces.", "LSF", "#FF6BA8"),
        )
    }

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        for (appWidgetId in appWidgetIds) {
            updateAppWidget(context, appWidgetManager, appWidgetId)
        }
    }

    private fun updateAppWidget(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetId: Int
    ) {
        val dayOfYear = Calendar.getInstance().get(Calendar.DAY_OF_YEAR)
        val frase = frases[dayOfYear % frases.size]

        val views = RemoteViews(context.packageName, R.layout.frase_widget)

        views.setTextViewText(R.id.widget_emoji, frase.emoji)
        views.setTextViewText(R.id.widget_quote, "“${frase.texto}”")
        views.setTextViewText(R.id.widget_author, "— ${frase.autora}")
        views.setTextColor(R.id.widget_author, Color.parseColor(frase.color))

        // Toque → abre la app
        val intent = Intent(context, MainActivity::class.java).apply {
            flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
        }
        val pendingIntent = PendingIntent.getActivity(
            context, appWidgetId, intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
        views.setOnClickPendingIntent(R.id.widget_root, pendingIntent)

        appWidgetManager.updateAppWidget(appWidgetId, views)
    }
}
