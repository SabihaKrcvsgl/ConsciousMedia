plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    // NDK sürümünü manuel olarak belirtiyoruz.
    ndkVersion = "27.0.12077973"  // Firebase ile uyumlu NDK sürümü

    // Proje ad alanı
    namespace = "com.example.consciousmedia"

    // Flutter tarafından sağlanan compileSdkVersion'ı kullanıyoruz
    compileSdk = flutter.compileSdkVersion

    // Java ve Kotlin uyumluluk seçenekleri
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    // Default config ayarları
    defaultConfig {
        // Uygulama ID'si
        applicationId = "com.example.consciousmedia"

        // Minimum SDK sürümünü 23 olarak belirliyoruz
        minSdk = 23  // flutter.minSdkVersion yerine doğrudan 23 kullanıyoruz

        // Hedef SDK sürümünü Flutter'ın sağladığı versiyonla ayarlıyoruz
        targetSdk = flutter.targetSdkVersion

        // Uygulama sürüm bilgileri
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    // Yayınlama için gerekli yapılandırmalar
    buildTypes {
        release {
            // Debug anahtarlarıyla imzalama yapılıyor, üretim için kendi anahtarınızı eklemelisiniz
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    // Flutter kaynak yolunu belirtiyoruz
    source = "../.."
}
