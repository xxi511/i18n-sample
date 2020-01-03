
# i18n sample

## Installation

### SwiftGen
[HomePage](https://github.com/SwiftGen/SwiftGen)

```
$ brew update
$ brew install swiftgen
```

### LanguageManager-iOS
[HomePage](https://github.com/Abedalkareem/LanguageManager-iOS)
To chage using language on the fly, doesn't need to restart app

Support `CocoaPods`, `Carthage`, `Swift Package Manager`    
But failed through `Carthage` and `Swift Package Manager` so just simply copy the file into project.

## Usage

### Step 1 - Setup localization of project
* PROJECT Info -> Localizations
* Create a `Localizable.strings`

### Step 2 - Create a new run script

Go to `TARGETS` -> `Build Phases` -> `New Run Script Phase`

```
TargetName=YourAppsMainTargetName
SourcePath=$SOURCE_ROOT/$TargetName/PathToLocalizableStringsFile.strings
Output=$SOURCE_ROOT/$TargetName/PathToOutputFileIncludingName.swift
TemplatePath=$SOURCE_ROOT/$TargetName/PathToTemplateFile.stencil

# Use custom template to generate file
swiftgen strings $SourcePath -p $TemplatePath -o $Output

# Use swiftgen template to generate file
swiftgen strings $SourcePath -n structured-swift4 -o $Output
```
Make sure you replace `YourAppsMainTargetName`, `PathToLocalizableStringsFile`, `PathToOutputFileIncludingName` and `PathToTemplateFile`

In this sample I want to use `LanguageManager-iOS`, so I have to use custom template, or you just simply use swiftgen template  is fine.


### Step3 - Build
```
cmd + B 
cmd + R
```
It should build a swift file in `$Output` every time project build  
It may crash after build, maybe a bug but still work don't worry.
