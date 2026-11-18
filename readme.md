# How to install Android SDK and use it without admin privileges:

### WARNING: 
JDK in this is 21, android-36 is android 16, 36.0.0 is also android 16. 
If you are not using this android version CHANGE THEM to your required ones.

### Preparation:
1. Download required files: 
`https://developer.android.com/studio#command-line-tools-only`
`https://adoptium.net/temurin/releases/`
2. Throw the files into a local directory you own, such as `C:\Users\<YourUsername>\Dev\jdk-21`
3. Create the exact folder structure. Android's CLI tools are very strict about folder naming:
`C:\Users\<YourUsername>\Dev\AndroidSdk\cmdline-tools\latest`
- "latest" folder must contain your downloaded cmdline-tools contents. Throw this folder into newly created cmdline-tools folder. I know, it's stupid as fuck but you need to do that.

### Set User Environment Variables:
Configure your Windows account so Gradle knows where to find Java and the Android SDK.
1. Open User Variables. Press the Windows key, type Edit environment variables for your account, and press Enter.
2. Add `JAVA_HOME`. Click New under User variables, set the name to `JAVA_HOME`, and set the value to `C:\Users\<YourUsername>\Dev\jdk-21.`
3. Add `ANDROID_HOME`. Click New, set the name to `ANDROID_HOME`, and set the value to `C:\Users\<YourUsername>\Dev\AndroidSdk.`
4. Update your `Path`. Select your user `Path` variable, click Edit, and add two new entries: `%JAVA_HOME%\bin` and `%ANDROID_HOME%\cmdline-tools\latest\bin`

### Install the Build Tools:
1. Open a new Command Prompt or PowerShell window (so the new environment variables load) and install the compiler components.
2. Accept licenses and install SDK packages. Run the following commands to download the core compiler tools (adjust android-34 and 34.0.0 to match your project's compileSdk version):
`sdkmanager --licenses` 
`sdkmanager "platform-tools" "platforms;android-36" "build-tools;36.0.0"`

### Compiling Project to APK:
1. Go to your project directory: `cd C:\Path\To\YourProject`
2. Compile it: `.\gradlew.bat assembleDebug`
3. Find your APK: `app\build\outputs\apk\debug\app-debug.apk.`


