package com.xtion.plugin.xtion_utils

import android.content.Context

object ApplicationContext {

    private lateinit var _context: Context

    var context: Context
        set(value) {
            _context = value
        }
        get() {
            return _context
        }

}