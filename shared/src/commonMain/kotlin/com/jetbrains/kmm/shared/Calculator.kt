package com.jetbrains.kmm.shared

class Calculator {
    companion object {
        fun sum(a: Int, b: Int): Int = a + b

        fun getFormattedIban(ibanAsString: String): String = getFormattedString(ibanAsString, formatWith = " ", formatSpacing = 4)

        private fun getFormattedString(ibanAsString: String, formatWith: String, formatSpacing: Int): String {
            val formatterIban = StringBuilder()
            ibanAsString.replace("\\s".toRegex(), "").mapIndexed { index: Int, char: Char ->
                val newSequence: String = if (index % formatSpacing == 0) "$formatWith$char" else char.toString()
                formatterIban.append(newSequence)
            }
            return formatterIban.trim().toString()
        }
    }
}