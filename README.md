# Flutter flavor example

![ios](/screenshots/ios-full.png?raw=true "ios")

![android](/screenshots/android-full.png?raw=true "android")

Flavors are typically used to build your app for different environments such as dev and prod.

A sample flutter project to showcase how to create 

- different flavor setup for flutter project.
- different app_name and app_icon launcher per flavour 

It works for both android and ios build

This example uses three flavors
- development
- staging
- production

## To run each flavor target with their customized app_name and app_icon
```You will add the --flavor flag. Note that there is an extra setup specifically for android and ios for this steps```

- flutter run --target lib/main_development.dart --flavor development
- flutter run --target lib/main_staging.dart --flavor staging
- flutter run --target lib/main_production.dart --flavor production


You can follow the guide in this ReadMe 
or
Click the link below to watch the tutorial 
![Flutter Flavors, App Icons, and Firebase Tutorial](https://youtu.be/Vhm1Cv2uPko?t=118 "Flutter Flavors, App Icons, and Firebase Tutorial")

## STEP 1: Create your flutter project
```flutter create app_name```

## STEP 2: Create different entry files for your flavor main.dart
- lib/main_development.dart
- lib/main_staging.dart
- lib/main_production.dart

Let each entry file initialize run app to setup the config per flavor. This example only pass different app name to a scaffold in *lib/app.dart*
See reference below

![main_development](/lib/main_development.dart?raw=true "main_development.dart")
![main_staging](/lib/main_staging.dart?raw=true "main_staging.dart")
![main_production](/lib/main_production.dart?raw=true "main_production.dart")
![app.dart](/lib/app.dart?raw=true "app.dart")

## STEP 3: Setup launch.json file in .vscode folder
To run a specific flavor, use the command below
```flutter run --target lib/main_development.dart```

But because this command might be long to type everytime. You need to setup a **launch.json** file in the **.vscode** folder of your project root.

See reference below
![launch.json](/.vscode/launch.json?raw=true "launch.json")

![launch.json image](/screenshots/1.launcherjson.png?raw=true "launch.json image")

### Select the specific flavor to run from the run tab in vscode
![launch option](/screenshots/2.launcherjson_selectoption.png?raw=true "launch option")

### You might notice the error below when trying to run the specific build from launch json
![launcher run error](/screenshots/3.launcherjson_error.png?raw=true "launch run error")

### ----- START SETTING UP FLAVOR/SCHEME FOR DYNAMIC APP_NAME  (ANDROID/IOS) --------

## STEP 4: Setup platform (Android/IOS) specific flavor to solve the error above
* IOS refer to flavor as scheme to represent different build target
* Android still make use of flavor to represent different build target

## STEP 4.1: ANDROID flavor setup
Android still make use of flavor to represent different build target

### STEP 4.1.1 (ANDROID flavor setup): Setup flavor in android/app/build.gradle
Add *flavorDimensions* and *productFlavors* in your **android/app/build.gradle** file.
Place the code snippet in the reference below inside the **android block** of the **android/app/build.gradle** file.

```
    flavorDimensions 'default'
    productFlavors {
        development {
            dimension 'default'
            resValue 'string', 'app_name', 'Dev Flavor Sample'
            applicationIdSuffix '.dev'
        }
        staging {
            dimension 'default'
            resValue 'string', 'app_name', 'Stg Flavor Sample'
            applicationIdSuffix '.stg'
        }
        production {
            dimension 'default'
            resValue 'string', 'app_name', 'Flavor Sample'
            applicationIdSuffix ''
        }
    }
```

See reference below
![build.gradle](/android/app/build.gradle?raw=true "build.gradle")

![build.gradle image](/screenshots/4.android_flavor_build.png?raw=true "build.gradle image")

### STEP 4.1.2 (ANDROID flavor setup): Update the android:label in the android/app/src/main/AndroidManifest.xml file
Update *android:label* to ```android:label="@string/app_name"```

See reference below
![AndroidManifest.xml](/android/app/src/main/AndroidManifest.xml?raw=true "AndroidManifest.xml")

![AndroidManifest.xml image](/screenshots/5.android_flavor_manifest.png?raw=true "AndroidManifest.xml image")

## STEP 4.2: IOS flavor setup
This IOS flavor setup setup requires Xcode. 
IOS refer to flavor as scheme to represent different build target

### STEP 4.2.1 (IOS flavor setup): Open the /ios folder using Xcode. Setup Runner Target Scheme
Right click on the **/ios** folder to open with Xcode. Then click on Runner (TARGETS) on the left side bar of Xcode IDE

![View in xcode](/screenshots/6.ios_flavor_build.png?raw=true "View in xcode")

### STEP 4.2.2 (IOS flavor setup): Proceed to add new scheme for each flavor
Click on the Runner option at the top menu bar. A dropdown option containing *Edit Scheme, New Scheme and Manage Schemes* will appear.
Then proceed by selecting **Manage Schemes** from the options

![Select manage scheme option](/screenshots/7.ios_flavor_runner_option_mng_scheme.png?raw=true "Select manage scheme option")

### STEP 4.2.3 (IOS flavor setup): Add new scheme
Click the plus icon to add new scheme

![Manage scheme popup view](/screenshots/8.ios_flavor_scheme_popup.png?raw=true "Manage scheme popup view")

### STEP 4.2.4 (IOS flavor setup): New scheme entry
Enter the name of the new scheme e.g development, staging etc.
This example create development, staging and production (Rename the current Runner to production while create development and staging afresh)

![New scheme entry](/screenshots/9.ios_new_scheme.png?raw=true "New scheme entry")

### STEP 4.2.5 (IOS flavor setup): Preview list of schemes after adding new scheme
You will notice the new added schemes are also listed here
![New scheme list](/screenshots/10.ios_new_scheme_preview.png?raw=true "[New scheme list")

### STEP 4.2.6 (IOS flavor setup): Rename the existing Runner scheme to production
![production scheme](/screenshots/11.ios_rename_scheme.png?raw=true "production scheme")

### STEP 4.2.7 (IOS flavor setup): Setup Runner Project Configuration
Click on Runner (PROJECT) on the left side bar of Xcode IDE to setup build configuration
- Debug
- Release
- Profile
Click on the plus icon to create duplicate of Debug, Release and Profile for each flavor scheme respectively

![Runner project config](/screenshots/12.ios_runner_project_config.png?raw=true "Runner project config")

### STEP 4.2.8 (IOS flavor setup): Preview after creating flavor copies of build config
Now you have the following list below in your preview
- Debug-development, Debug-staging, **Debug**
- Release-development, Release-staging, **Release**
- Profile-development, Profile-staging, **Profile**

![Preview Runner project config](/screenshots/13.ios_runner_copy_preview.png?raw=true "Preview Runner project config")

### STEP 4.2.9 (IOS flavor setup): Rename the main Debug, Release and Profile copy to production

- Debug-development, Debug-staging, **Debug-production**
- Release-development, Release-staging, **Release-production**
- Profile-development, Profile-staging, **Profile-production**

![Done Runner project config](/screenshots/14.ios_runner_config_renamed.png?raw=true "Done Runner project config")

### STEP 4.2.10 (IOS flavor setup): Edit each scheme configurations
Repeat *STEP 4.2.2 (IOS flavor setup)* to access the **manage schemes* popup. 
Select each scheme and click on edit action button to update info

![Edit scheme config](/screenshots/15.ios_select_and_edit_config_flavor.png?raw=true "Edit scheme config")

### STEP 4.2.11 (IOS flavor setup): 
On the edit scheme detial view, select each of the following options below from the left sidebar and point them to their appropriate **Build configuration** option on the popup menu at the right section.
- Run 
- Test
- Profile
- Analyze
- Archive 

![Dev scheme selection](/screenshots/16.ios_edit_scheme_detail.png?raw=true "Dev scheme selection")

For example, **development scheme** will use the following **Build configuration** option
- Run (Debug-development)
- Test (Debug-development)
- Profile (Debug-development)
- Analyze (Debug-development)
- Archive (Debug-development)

![Dev scheme config](/screenshots/17.ios_edit_scheme_dev.png?raw=true "Dev scheme config")


### STEP 4.2.12 (IOS flavor setup): Update Bundle Identifier
* Select Runner (TARGETS)
* Click on Build Settings
* Select *All* and *Combined* tab options.
* Then search for bundle identifier in the search box at the top right beside the tabs

![Search bundle identifier](/screenshots/18.ios_search_bundle_identifier.png?raw=true "Search bundle identifier")

Rename and update all bundle identifier for each scheme config by adding suffix to the identifier name
![Search bundle identifier](/screenshots/19.ios_update_bundle_identifier.png?raw=true "Search bundle identifier")

### STEP 4.2.13 (IOS flavor setup): Add APP_DISPLAY_NAME as a custom variable 
Add *APP_DISPLAY_NAME* as a custom environment variable to make each scheme (flavor) app name dynamic 
* Click on the plus icon beside the tab view
* Select *Add User-Defined Setting*

![Search bundle identifier](/screenshots/20.ios_user_defined_settings.png?raw=true "Search bundle identifier")

* Enter settings name i.e *APP_DISPLAY_NAME*. You can choose to call it whatever you want

![user defined settings variable](/screenshots/21.ios_enter_setting_name.png?raw=true "user defined settings variable")

* Specify value for each scheme (flavor) configuration

![app name value](/screenshots/22.ios_scheme_app_name_value.png?raw=true "app name value")

* Proceed to select *Info* under Runner (TARGETS) at the left side bar to use the newly created user defined varible name *APP_DISPLAY_NAME* to replace Bundle display name dynamically

BEFORE
![update bundel display name](/screenshots/22.iosn_before_bundle_dn.png?raw=true "update bundel display name")

AFTER
![update bundel display name](/screenshots/23.iosn_after_bundle_dn.png.png?raw=true "update bundel display name")

### ----- DONE WITH SETTING FLAVOR/SCHEME FOR DYNAMIC APP_NAME (ANDROID/IOS) ----------------


### ---- START SETUP FLAVOR/SCHEME FOR FOR DYNAMIC APP_ICON (ANDROID/IOS) ---------------------

## STEP 5: Setup app and launcher icon for Android and IOS respectively
To setup app and launcher icon for Android/IOS using flavor/scheme we use the **flutter_launcher_icons** package
Add the package to the **dev_dependencies** of your pubscpec.yaml
flutter_launcher_icons helps to dynamically generate all icons sets for the specific flavor target

```
dev_dependencies:
  flutter_launcher_icons: ^0.9.2
```

![flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons "flutter launcher icons")

### STEP 5.1: Add the specific launcher icon images for each flavor

![development icon](/assets/icons/development-icon.png?raw=true "development icon")
![staging icon](/assets/icons/staging-icon.png?raw=true "staging icon")
![production icon](/assets/icons/production-icon.png?raw=true "production icon")

### STEP 5.2: Create flutter_launcher_icons configuration file.
Note you can create specific *flutter_launcher_icons* yaml file for each flavor if they need to use different icons
see reference belwo.

![flutter_launcher_icons-development](/flutter_launcher_icons-development.yaml?raw=true "flutter_launcher_icons-development.yaml")
![flutter_launcher_icons-staging](/flutter_launcher_icons-staging.yaml?raw=true "flutter_launcher_icons-staging.yaml")
![flutter_launcher_icons-production](/flutter_launcher_icons-production.yaml?raw=true "flutter_launcher_icons-production")

### STEP 5.3: Generate the asset 

Use the command below to dynamically generate all the asset for each flavor (Android) or scheme (IOS) 
```flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons*```

> Note: The command above might throw an error if you're on using later version of flutter 2.10.0 as it set the *flutter.minSdkVersion* inbuilt which value is 16. But the flutter_launcher_icons package does not recognize this so it throws up an error. The fix for now is to manually set your **minSdkVersion** in the **android/app/build.gradle** file to your specific minimum target e.g 16 or above

```
defaultConfig {
    ...
    minSdkVersion 16 //flutter.minSdkVersion**
    ...
}
```

![flutter_launcher_icons-production](/flutter_launcher_icons-production.yaml?raw=true "flutter_launcher_icons-production")

The expected error:
```Unhandled exception: FormatException: Invalid number (at character 1)```

Related issue is logged here:
https://github.com/fluttercommunity/flutter_launcher_icons/issues/333

###  STEP 5.4: IOS only - Update app icon reference
Once app and launcher icons are generated. IOS requires you to update the reference on Xcode
* Select Runner (TARGETS)
* Click on Build Settings
* Select *All* and *Combined* tab options.
* Then search for **app icon** in the search box at the top right beside the tabs.
* Then toggle to expand the *Primary App Icon Set Name* accordion on the search result list. If you didn't see *Primary App Icon Set Name* as the value might be different in your Xcode. Alternatively check for *Asset Catalog App Icon Set Name*

![flutter_launcher_icons-production](/screenshots/24.ios_icon_name_update.png?raw=true "flutter_launcher_icons-production")

### ---- END SETUP FLAVOR/SCHEME FOR FOR DYNAMIC APP_ICON (ANDROID/IOS) ---------------------

## Getting With Flutter

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
