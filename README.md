Instalar Appium Server (Windows):

https://github.com/appium/appium-desktop/releases/tag/v1.22.3-4

Instalar Appium Inspector (Windows):

https://github.com/appium/appium-inspector/releases

Para saber el MAIN Activity descargar el programa jadx-gui de

https://github.com/skylot/jadx/releases/tag/v1.4.5 y luego:
    * Abrir el programa e importar el APK
    * Abrir el archivo AndroidManifest.xml y buscar 'android.intent.action.MAIN' y traer el valor de android:name


Configuración Appium Inspector:

- Remote Host: localhost
- Remote Port: 4723
- Remote Path: /wd/hub
- JSON Representation:
```
{
  "platformName": "Android",
  "deviceName": "emulator-5554",
  "appPackage": "com.booking",
  "appActivity": "com.booking.startup.HomeActivity",
  "automationName": "UIAutomator2"
}
```

Además, configurar el android sdk path y el jdk path abriendo el Appium Server y dando clic en Edit Configuration antes de iniciarlo.


Para las pruebas ejecutando el script de robot framework, es neesario tener levantado el Appium Server