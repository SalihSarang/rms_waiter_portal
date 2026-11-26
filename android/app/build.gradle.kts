import java.io.FileInputStream
import java.util.Properties

plugins {
    id("com.android.application")
    id("com.google.gms.google-services")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.rms.waiterportal"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    
    val keystorePropertiesFile = rootProject.file("key.properties")
    val keystoreProperties = Properties()
    var isSigningConfigured = false
    if (keystorePropertiesFile.exists()) {
        try {
            keystoreProperties.load(FileInputStream(keystorePropertiesFile))
            val storeFileVal = keystoreProperties.getProperty("storeFile")
            val storePassVal = keystoreProperties.getProperty("storePassword")
            val keyAliasVal = keystoreProperties.getProperty("keyAlias")
            val keyPassVal = keystoreProperties.getProperty("keyPassword")
            
            if (!storeFileVal.isNullOrBlank() && 
                file(storeFileVal).exists() &&
                !storePassVal.isNullOrBlank() && 
                !keyAliasVal.isNullOrBlank() && 
                !keyPassVal.isNullOrBlank()) {
                isSigningConfigured = true
            }
        } catch (e: Exception) {
            isSigningConfigured = false
        }
    }

    signingConfigs {
        create("release") {
            if (isSigningConfigured) {
                keyAlias = keystoreProperties.getProperty("keyAlias")
                keyPassword = keystoreProperties.getProperty("keyPassword")
                storeFile = file(keystoreProperties.getProperty("storeFile"))
                storePassword = keystoreProperties.getProperty("storePassword")
            }
        }
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.rms.waiterportal"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = if (isSigningConfigured) {
                signingConfigs.getByName("release")
            } else {
                signingConfigs.getByName("debug")
            }
        }
    }
}




kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}
