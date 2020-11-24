package com.xtion.plugin.xtion_utils

import android.content.SharedPreferences
import android.content.SharedPreferences.Editor

object SPHelper {

    @JvmStatic
    private fun getSP(name: String): SharedPreferences {

        return ApplicationContext.context.getSharedPreferences(name, 0)
    }

    @JvmStatic
    private fun edit(name: String): Editor {
        return getSP(name).edit()
    }

    @JvmStatic
    fun putString(name: String, key: String, value: String) {

        edit(name).putString(key, value).commit()
    }

    @JvmStatic
    fun getString(name: String, key: String, defValue: String?): String? {

        return getSP(name).getString(key, defValue)
    }

    @JvmStatic
    fun getString(name: String, key: String): String? {

        return getString(name, key, null)
    }

    @JvmStatic
    fun putInt(name: String, key: String, value: Int): Boolean {

        return edit(name).putInt(key, value).commit()
    }

    @JvmStatic
    fun getInt(name: String, key: String, defValue: Int): Int {

        return getSP(name).getInt(key, defValue)
    }

    @JvmStatic
    fun putMap(name: String, values: Map<String, Any>) {

        val edit = edit(name)

        values.forEach {

            val key = it.key
            val value = it.value
            if(value is String) {
                edit.putString(key, value)
            }
            else if(value is Int) {
                edit.putInt(key, value)
            }
        }

        edit.commit()
    }

    @JvmStatic
    fun getMap(name: String): Map<String, Any?> {

        val sp = getSP(name)
        return sp.all.toMap()
    }

    @JvmStatic
    fun getInt(name: String, key: String): Int {

        return getInt(name, key, 0)
    }

    object Default {

        const val name = "default"

        @JvmStatic
        fun putString(key: String, value: String): Boolean {

            return edit(name).putString(key, value).commit()
        }

        @JvmStatic
        fun getString(key: String, defValue: String?): String? {

            return getSP(name).getString(key, defValue)
        }

        @JvmStatic
        fun putInt(key: String, value: Int): Boolean {

            return edit(name).putInt(key, value).commit()
        }

        @JvmStatic
        fun getInt(key: String, defValue: Int): Int {

            return getSP(name).getInt(key, defValue)
        }

        @JvmStatic
        fun putMap(values: Map<String, Any>) {

            return putMap(name, values)
        }

        @JvmStatic
        fun getMap(name: String): Map<String, Any?> {

            return getMap(name)
        }
    }
}