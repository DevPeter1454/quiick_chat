# Flutter wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Agora Chat SDK
-keep class io.agora.** { *; }
-keep class com.hyphenate.** { *; }
-dontwarn com.hyphenate.**
-dontwarn io.agora.**

# NB Utils
-keep class com.nb.** { *; }
-dontwarn com.nb.**

# Image Picker
-keep class io.flutter.plugins.imagepicker.** { *; }

# Keep your custom classes
-keep class com.example.quiick_chat.** { *; }