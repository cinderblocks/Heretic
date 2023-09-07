; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

;#define MyAppName "Alchemy Viewer"
;#define MyAppNameShort "AlchemyViewer"
;#define MyAppVersion "7.0.0.4545"
;#define MyAppExeName "MyProg.exe"
;#define ViewerSrcDir ""

%%INST_VARS%%

#define MyAppPublisher "Alchemy Development Group"
#define MyAppURL "https://www.alchemyviewer.org"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{564993A0-36C3-4C9C-83FA-336EAB720367}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion} 
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
AppCopyright=Copyright (C) 2013-2023 {#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppNameShort}
DisableProgramGroupPage=yes
;LicenseFile={#ViewerSrcDir}\..\..\doc\LGPL-license.txt
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=commandline
OutputDir=.
OutputBaseFilename={#MyAppInstFile}
SetupIconFile={#ViewerSrcDir}\installers\windows\install_icon.ico
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64
MinVersion=10.0
AppMutex=AlchemyAppMutex,Global\AlchemyAppMutex
VersionInfoCompany={#MyAppPublisher}
VersionInfoVersion={#MyAppVersion}
AlwaysShowDirOnReadyPage=yes
;DisableWelcomePage=no

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "armenian"; MessagesFile: "compiler:Languages\Armenian.isl"
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"
Name: "bulgarian"; MessagesFile: "compiler:Languages\Bulgarian.isl"
Name: "catalan"; MessagesFile: "compiler:Languages\Catalan.isl"
Name: "corsican"; MessagesFile: "compiler:Languages\Corsican.isl"
Name: "czech"; MessagesFile: "compiler:Languages\Czech.isl"
Name: "danish"; MessagesFile: "compiler:Languages\Danish.isl"
Name: "dutch"; MessagesFile: "compiler:Languages\Dutch.isl"
Name: "finnish"; MessagesFile: "compiler:Languages\Finnish.isl"
Name: "french"; MessagesFile: "compiler:Languages\French.isl"
Name: "german"; MessagesFile: "compiler:Languages\German.isl"
Name: "hebrew"; MessagesFile: "compiler:Languages\Hebrew.isl"
Name: "hungarian"; MessagesFile: "compiler:Languages\Hungarian.isl"
Name: "icelandic"; MessagesFile: "compiler:Languages\Icelandic.isl"
Name: "italian"; MessagesFile: "compiler:Languages\Italian.isl"
Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"
Name: "norwegian"; MessagesFile: "compiler:Languages\Norwegian.isl"
Name: "polish"; MessagesFile: "compiler:Languages\Polish.isl"
Name: "portuguese"; MessagesFile: "compiler:Languages\Portuguese.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "slovak"; MessagesFile: "compiler:Languages\Slovak.isl"
Name: "slovenian"; MessagesFile: "compiler:Languages\Slovenian.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"
Name: "turkish"; MessagesFile: "compiler:Languages\Turkish.isl"
Name: "ukrainian"; MessagesFile: "compiler:Languages\Ukrainian.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
%%INSTALL_FILES%%

[InstallDelete]
Type: files; Name: "{app}\app_settings"
Type: files; Name: "{app}\llplugin"
Type: files; Name: "{app}\skins"

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Registry]
Root: HKA; Subkey: "Software\Classes\secondlife"; ValueType: "string"; ValueData: "URL:Second Life"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\secondlife"; ValueType: "string"; ValueName: "URL Protocol"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\secondlife\DefaultIcon"; ValueType: "string"; ValueData: "{app}\{#MyAppExeName},0"
Root: HKA; Subkey: "Software\Classes\secondlife\shell\open\command"; ValueType: "string"; ValueData: """{app}\{#MyAppExeName}"" -url ""%1"""

Root: HKA; Subkey: "Software\Classes\x-grid-info"; ValueType: "string"; ValueData: "URL:Hypergrid"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\x-grid-info"; ValueType: "string"; ValueName: "URL Protocol"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\x-grid-info\DefaultIcon"; ValueType: "string"; ValueData: "{app}\{#MyAppExeName},0"
Root: HKA; Subkey: "Software\Classes\x-grid-info\shell\open\command"; ValueType: "string"; ValueData: """{app}\{#MyAppExeName}"" -url ""%1"""

Root: HKA; Subkey: "Software\Classes\x-grid-location-info"; ValueType: "string"; ValueData: "URL:Hypergrid"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\x-grid-location-info"; ValueType: "string"; ValueName: "URL Protocol"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\x-grid-location-info\DefaultIcon"; ValueType: "string"; ValueData: "{app}\{#MyAppExeName},0"
Root: HKA; Subkey: "Software\Classes\x-grid-location-info\shell\open\command"; ValueType: "string"; ValueData: """{app}\{#MyAppExeName}"" -url ""%1"""