[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{7AA89A45-B79C-4EF7-ABEB-F88FD38B1084}
AppName=Instalador Padr�o AnDes ERP
AppVersion=7_6_30
DefaultDirName=C:\AndesERP
DefaultGroupName=Andes
OutputBaseFilename=Instalador_AnDesERP_7.6.30
SetupIconFile=andes.ico
AppPublisher=AnDes Sistemas Integrados
AppPublisherURL=www.andessistemas.com.br
AppSupportURL=www.andessistemas.com.br
AppUpdatesURL=www.andessistemas.com.br
AllowNoIcons=true
LicenseFile=
Compression=zip/9
SolidCompression=true
VersionInfoVersion=7.6.30
VersionInfoCompany=AnDes Sistemas Integrados
VersionInfoCopyright=AnDes Sistemas Integrados
VersionInfoProductName=Instala_AnDesUpdate_7_6_30
VersionInfoProductVersion=7.6.30
AppCopyright=AnDes Sistemas Integrados
UsePreviousUserInfo=true
WindowVisible=True
WizardImageFile=logo-instalador.bmp
InternalCompressLevel=ultra
DisableDirPage=false
AppSupportPhone=+551637078900
Uninstallable=yes
WizardImageStretch=true
InfoAfterFile=
AppendDefaultGroupName=true
EnableDirDoesntExistWarning=false
ChangesEnvironment=true
AlwaysShowDirOnReadyPage=true
AlwaysShowGroupOnReadyPage=true
ShowTasksTreeLines=true
ShowLanguageDialog=auto
RestartIfNeededByRun=false
WizardSmallImageFile=logo-instalador.bmp
AppContact=Comercial
VersionInfoDescription=Software de Gest�o Empresarial
BackColorDirection=lefttoright
BackColor2=clAqua
OutputDir=www
DisableStartupPrompt=false
UsePreviousAppDir=true
ChangesAssociations=true
DirExistsWarning=yes
FlatComponentsList=false
DisableReadyPage=True
DisableProgramGroupPage=false
UsePreviousGroup=false
UsePreviousTasks=false
WizardImageBackColor=clNavy
#include <idp.iss>
;#include <idplang\brazilianPortuguese.iss>
DiskSpanning=True
DiskSliceSize=1566000000
SlicesPerDisk=3
DisableWelcomePage=True
DisableReadyMemo=True
BackColor=clPurple

[Languages]
Name: brazilianportuguese; MessagesFile: compiler:Languages\BrazilianPortuguese.isl
;[Tasks]
;Name: NFE; Description: Componentes para NFE; GroupDescription: Componentes para NFE; Flags: unchecked
;Name: refirebird25; Description: Instala Firebird 2.5 na pasta AnDes; GroupDescription: Instala Firebird 2.5 na pasta AnDes; Flags: unchecked
;Name: refirebird30; Description: Instala Firebird 3.0 na pasta AnDes; GroupDescription: Instala Firebird 3.0 na pasta AnDes; Flags: unchecked
;Name: datapump; Description: Instala DataPump; GroupDescription: Instala DataPump; Flags: unchecked
[Types]
Name: servidor; Description: Instalacao Completa (FB 2.5 + FB 3.0 + DataPump + NFE + Servidor + Estacao)
Name: servidor25; Description: Servidor 32 Bits Firebird 2.5
Name: servidor30; Description: Servidor 32 Bits Firebird 3.0
Name: estacao; Description: Instala somente estacao
Name: nfe; Description: Nota Fiscal Eletronica
Name: datapump; Description: Data Pump

[Components]
Name: "Servidor30"; Description: "Servidor 3.0"; Types: datapump estacao nfe servidor servidor25 servidor30
Name: "servidor25"; Description: "Servidor 2.5"; Types: estacao nfe servidor servidor25
Name: "Estacao"; Description: "Estacao"; Types: estacao nfe
Name: "FB25"; Description: "Firebird 2.5"; Types: servidor25
Name: "FB30"; Description: "Firebird 3.0"; Types: servidor30
Name: "datapump"; Description: "Data Pump"; ExtraDiskSpaceRequired: 300; Types: datapump

[Dirs]
Name: "{app}\ibdb"; Components: FB25 servidor25 Servidor30 FB30
Name: "{app}\Firebird30"; Components: FB30
Name: "{app}\SPED"; Components: servidor25 Servidor30
Name: "{app}\TEMP"; Components: Estacao
Name: "{app}\XML_ENTRADA"; Components: Estacao
Name: "{app}\NFEletronica"; Components: Estacao
Name: "{app}\ibdb\backup_bd"; Components: servidor25 Servidor30
Name: "{app}\ibdb\log_backup_exporta"; Components: servidor25 Servidor30
Name: "{sd}\Temp"; 
Name: "{sd}\Tmp";
Name: "{app}\DataPump"; Components: datapump

[Files]
Source: "componentes\EXE_ESTACAO\*"; DestDir: "{app}\"; Components: Estacao servidor25 Servidor30
Source: "{tmp}\AndesDataPump.zip"; DestDir: "{app}\DataPump\"; Flags: external; Components: datapump
Source: "{tmp}\descompactaDP.bat"; DestDir: "{app}\DataPump\"; Flags: external; Components: datapump
Source: "{tmp}\ANDESDB_7_6_30_ID101.zip"; DestDir: "{app}\DataPump\"; Flags: external; Components: DataPump
Source: "{tmp}\AndesBackupToolSrv.zip"; DestDir: "{app}\"; Flags: external; Components: servidor25
Source: "{tmp}\AndesLogErrorTransfer.zip"; DestDir: "{app}\"; Flags: external; Components: servidor25
Source: "{tmp}\AndesLogTransfer.zip"; DestDir: "{app}\"; Flags: external; Components: servidor25
Source: "{tmp}\restart_services.bat"; DestDir: "{app}\"; Flags: external; Components: servidor25
Source: "{tmp}\install_services.bat"; DestDir: "{app}\"; Flags: external; Components: servidor25
Source: "{tmp}\AndesMonitorUpdate.zip"; DestDir: "{app}\"; Flags: external; Components: servidor25
Source: "{tmp}\restart_service_config.xml"; DestDir: "{app}\"; Flags: external; Components: servidor25
Source: "{tmp}\AndesConfiguracao_MODELO.xml"; DestDir: "{app}\"; Flags: external; Components: servidor25
Source: "{tmp}\descompactaSRV.bat"; DestDir: "{app}\"; Flags: external; Components: servidor25
Source: "{tmp}\cepbras.zip"; DestDir: "{app}\ibdb\"; Flags: external; Components: servidor25
Source: "componentes\setup\Firebird-3.0.2.32703_0_Win32.exe"; DestDir: "{app}\INSTALADORES\"; Components: Servidor30
Source: "componentes\INSTALADORES\*"; DestDir: "{app}\INSTALADORES\"; Flags: ignoreversion
Source: "componentes\imagens\*"; DestDir: "{app}\imagens\"; Flags: ignoreversion
Source: "componentes\ImagensBoletos\*"; DestDir: "{app}\ImagensBoletos\"; Flags: ignoreversion
Source: "componentes\locales\*"; DestDir: "{app}\locales\"; Flags: ignoreversion
Source: "componentes\Fonts\*"; DestDir: "{win}\Fonts"; Flags: ignoreversion
Source: "componentes\Firebird-2.5.6.27020-0_Win32\bin\fbclient.dll"; DestDir: "{app}\app"; Flags: ignoreversion
Source: "componentes\Firebird-2.5.6.27020-0_Win32\bin\fbclient.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "componentes\Firebird-2.5.6.27020-0_Win32\bin\gfix.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "componentes\Firebird-2.5.6.27020-0_Win32\bin\gbak.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "componentes\Firebird-2.5.6.27020-0_Win32\*"; DestDir: "{app}\Firebird25\"; Flags: ignoreversion
Source: "componentes\Firebird-2.5.6.27020-0_Win32\bin\*"; DestDir: "{app}\Firebird25\bin\"; Flags: ignoreversion
Source: "componentes\Firebird-2.5.6.27020-0_Win32\include\*"; DestDir: "{app}\Firebird25\include\"; Flags: ignoreversion
Source: "componentes\Firebird-2.5.6.27020-0_Win32\intl\*"; DestDir: "{app}\Firebird25\intl\"; Flags: ignoreversion
Source: "componentes\Firebird-2.5.6.27020-0_Win32\lib\*"; DestDir: "{app}\Firebird25\lib\"; Flags: ignoreversion
Source: "componentes\Firebird-2.5.6.27020-0_Win32\misc\*"; DestDir: "{app}\Firebird25\misc\"; Flags: ignoreversion
Source: "componentes\Firebird-2.5.6.27020-0_Win32\plugins\*"; DestDir: "{app}\Firebird25\plugins\"; Flags: ignoreversion
Source: "componentes\Firebird-2.5.6.27020-0_Win32\system32\*"; DestDir: "{app}\Firebird25\system32\"; Flags: ignoreversion
Source: "componentes\Firebird-2.5.6.27020-0_Win32\udf\*"; DestDir: "{app}\Firebird25\udf\"; Flags: ignoreversion
Source: "componentes\Firebird-3.0.2.32703-0_Win32\fbclient.dll"; DestDir: "{app}\app\"; Flags: ignoreversion; Components: FB30
Source: "componentes\Firebird-3.0.2.32703-0_Win32\fbclient.dll"; DestDir: "{app}\"; Flags: ignoreversion; Components: FB30
Source: "componentes\Firebird-3.0.2.32703-0_Win32\firebird.conf"; DestDir: "{app}\Firebird30\"; Flags: ignoreversion; Components: FB30
Source: "componentes\Firebird-3.0.2.32703-0_Win32\security3.fdb"; DestDir: "{app}\Firebird30\"; Flags: ignoreversion; Components: FB30
Source: "componentes\Firebird-3.0.2.32703-0_Win32\udf\*"; DestDir: "{app}\Firebird30\udf\"; Flags: ignoreversion; Components: FB30

[Icons]
Name: "{commondesktop}\AnDes Sistemas"; Filename: "{app}\AndesAtualizador.exe"; WorkingDir: "{app}"; Components: Estacao
[Registry]
;PERMITIR QUE O SOFTWARE SEJA EXECUTADO OU INSTALADO MESMO QUE A ASSINATURA SEJA INVALIDA Windows 7
Root: "HKLM"; Subkey: "SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\RUN_INV_SIG"; ValueType: dword; ValueName: "CheckedValue"; ValueData: "00000001"; Components: Estacao
Root: "HKLM"; Subkey: "SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\RUN_INV_SIG"; ValueType: dword; ValueName: "DefaultValue"; ValueData: "00000001"
;VERIFICAR REVOGA��O DE CERTIFICADOS DO SERVIDOR - win7, winXP, win2003, win2008.
Root: "HKLM"; Subkey: "SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\SSLREV"; ValueType: dword; ValueName: "CheckedValue"; ValueData: "00000001"
Root: "HKLM"; Subkey: "SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\SSLREV"; ValueType: dword; ValueName: "DefaultValue"; ValueData: "00000001"; Components: Estacao
;VERIFICAR SE H� CERTIFICADOS REVOGADOS DO EDITOR
Root: "HKLM"; Subkey: "SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\CERTREV"; ValueType: dword; ValueName: "CheckedValue"; ValueData: "00000001"; Components: Estacao
Root: "HKLM"; Subkey: "SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\CERTREV"; ValueType: dword; ValueName: "DefaultValue"; ValueData: "00000001"; Components: Estacao
;PERMITIR QUE O SOFTWARE SEJA EXECUTADO OU INSTALADO MESMO QUE A ASSINATURA SEJA INVALIDA Windows 7
Root: "HKLM"; Subkey: "SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\RUN_INV_SIG"; ValueType: dword; ValueName: "CheckedValue"; ValueData: "00000001"; Components: Estacao
Root: "HKLM"; Subkey: "SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\RUN_INV_SIG"; ValueType: dword; ValueName: "DefaultValue"; ValueData: "00000001"; Components: Estacao
;VERIFICAR REVOGA��O DE CERTIFICADOS DO SERVIDOR - win7, winXP, win2003, win2008.
Root: "HKLM"; Subkey: "SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\SSLREV"; ValueType: dword; ValueName: "CheckedValue"; ValueData: "00000001"; Components: Estacao
Root: "HKLM"; Subkey: "SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\SSLREV"; ValueType: dword; ValueName: "DefaultValue"; ValueData: "00000001"; Components: Estacao
;VERIFICAR SE H� CERTIFICADOS REVOGADOS DO EDITOR
Root: "HKLM"; Subkey: "SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\CERTREV"; ValueType: dword; ValueName: "CheckedValue"; ValueData: "00000001"; Components: Estacao
Root: "HKLM"; Subkey: "SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\CERTREV"; ValueType: dword; ValueName: "DefaultValue"; ValueData: "00000001"; Components: Estacao
;vari�veis de ambiente
Root: "HKLM"; Subkey: "System\CurrentControlSet\Control\Session Manager\Environment\"; ValueType: expandsz; ValueName: "TEMP"; ValueData: "{sd}\TEMP"; Components: Estacao
Root: "HKCU"; Subkey: "Environment\"; ValueType: expandsz; ValueName: "TEMP"; ValueData: "{sd}\TEMP"; Components: Estacao
Root: "HKLM"; Subkey: "System\CurrentControlSet\Control\Session Manager\Environment\"; ValueType: expandsz; ValueName: "TMP"; ValueData: "{sd}\TMP"; Components: Estacao
Root: "HKCU"; Subkey: "Environment\"; ValueType: expandsz; ValueName: "TMP"; ValueData: "{sd}\TMP"; Components: Estacao
Root: "HKLM"; Subkey: "System\CurrentControlSet\Control\Session Manager\Environment\"; ValueType: expandsz; ValueName: "AndesFB25"; ValueData: "{app}\Firebird25\bin"; Components: FB25 servidor25
Root: "HKCU"; Subkey: "Environment\"; ValueType: expandsz; ValueName: "AndesFB25"; ValueData: "{app}\Firebird25\bin"; Components: FB25 servidor25
Root: "HKLM"; Subkey: "System\CurrentControlSet\Control\Session Manager\Environment\"; ValueType: expandsz; ValueName: "AndesFB30"; ValueData: "{app}\Firebird30"; Components: Servidor30 FB30
Root: "HKCU"; Subkey: "Environment\"; ValueType: expandsz; ValueName: "AndesFB30"; ValueData: "{app}\Firebird30"; Components: Servidor30 FB30

[Run]
;Compartilhando pasta AnDesERP
Filename: "net"; Parameters: "share AndesERP=""{app}\AndesERP"" /grant:Todos,full /users:20 /remark:Compartilhado_Automaticamente"; Flags: nowait runascurrentuser shellexec; StatusMsg: "Compartilhando pasta AndesERP"; Components: Estacao
Filename: "cacls"; Parameters: """{app}\AndesERP"" /T /P todos:f"; Flags: nowait runascurrentuser shellexec; StatusMsg: "Dando permiss�es nas pastas"; Components: Estacao
Filename: "{app}\INSTALADORES\npp.7.4.2.Installer.exe"; WorkingDir: "{app}\INSTALADORES\"; Flags: shellexec runascurrentuser; StatusMsg: "Instalando Notepad++"; Components: servidor25 Servidor30
Filename: "{app}\INSTALADORES\Firebird302"; WorkingDir: "{app}\INSTALADORES\"; Flags: shellexec runascurrentuser; StatusMsg: "Instala��o FB30"; Components: FB30
Filename: "{app}\install_services.bat"; WorkingDir: "{app}\"; Flags: shellexec runascurrentuser; StatusMsg: "Instalando servi�os"; Components: servidor25 Servidor30
Filename: "{app}\REGISTRA_DLL.bat"; WorkingDir: "{app}\"; Flags: shellexec runascurrentuser; StatusMsg: "Instalando servi�os"; Components: servidor25 Servidor30 Estacao
;libera a porta 3050
Filename: "netsh.exe"; Parameters: "firewall add portopening protocol=TCP port=3050 name=Firebird mode=ENABLE scope=SUBNET"; Flags: runascurrentuser runhidden; Description: "Liberar Porta do Firebird"; Components: FB25 servidor25
Filename: "netsh.exe"; Parameters: "firewall add portopening protocol=TCP port=3051 name=Firebird_Update mode=ENABLE scope=SUBNET"; Flags: runascurrentuser runhidden; Description: "Liberar Porta do Firebird"; Components: FB25 servidor25
Filename: "netsh.exe"; Parameters: "firewall add portopening protocol=TCP port=55988 name=Firebird30 mode=ENABLE scope=SUBNET"; Flags: runascurrentuser runhidden; Description: "Liberar Porta do Firebird"; Components: FB30 Servidor30
Filename: "netsh.exe"; Parameters: "firewall add portopening protocol=TCP port=55989 name=Firebird_Update30 mode=ENABLE scope=SUBNET"; Flags: runascurrentuser runhidden; Description: "Liberar Porta do Firebird"; Components: FB30 Servidor30

;instala firebird 2.5 na pasta do aplicativo
Filename: "{app}\Firebird25\bin\install_classic.bat"; Parameters: "AndesFB25"; WorkingDir: "{app}\Firebird25\bin\"; Flags: shellexec; Description: "Instala��o do Firebird 2.5.6"; Components: FB25
;instala firebird 3.0 na pasta do aplicativo
;Filename: "{app}\Firebird30\install_service.bat"; Parameters: "AndesFB30"; WorkingDir: "{app}\Firebird30\"; Flags: shellexec; Description: "Instala��o do Firebird 3.0.2";
;certificados
Filename: "{app}\INSTALADORES\ACRaizBrasileira_v2.cer"; Parameters: "/install /silent"; Flags: runascurrentuser shellexec; Components: Estacao
Filename: "{app}\INSTALADORES\ACCertisignMultiplaG5.cer"; Parameters: "/install /silent"; Flags: runascurrentuser shellexec; Components: Estacao
Filename: "{app}\INSTALADORES\ACCertisignG6_v2.cer"; Parameters: "/install /silent"; Flags: runascurrentuser shellexec; Components: Estacao
Filename: "{app}\descompactaSRV.bat"; Flags: nowait postinstall runhidden; StatusMsg: "Extraindo arquivo"; Components: servidor25 FB25
Filename: "{app}\DataPump\descompactaDP.bat"; Flags: nowait postinstall runhidden; StatusMsg: "Extraindo arquivo"; Components: servidor25 FB25
;Filename: "{sys}\regsvr32"; Parameters: "'{sys}\capicom.dll' /s"; StatusMsg: "Registrando DLL capicom"
;Filename: "{sys}\regsvr32"; Parameters: "'{sys}\msxml5.dll' /s"; StatusMsg: "Registrando DLL msxml5"
;Filename: "{sys}\regsvr32"; Parameters: "'{sys}\midas.dll' /s"; StatusMsg: "Registrando DLL midas"
[Code]
procedure InitializeWizard();
   begin
       //DATAPUMP
       idpAddFileComp('http://andeserp.com.br/update/estavel/setup/AndesDataPump.zip', ExpandConstant('{tmp}\AndesDataPump.zip'),'datapump');
       idpAddFileComp('http://andeserp.com.br/update/estavel/setup/ANDESDB_7_6_30_ID101.zip', ExpandConstant('{tmp}\ANDESDB_7_6_30_ID101.zip'),'datapump');
       idpAddFileComp('http://andeserp.com.br/update/estavel/setup/AndesDataPump.xml',      ExpandConstant('{tmp}\AndesDataPump.xml')     ,'datapump');
       idpAddFileComp('http://andeserp.com.br/update/estavel/setup/AndesBackupToolSrv.zip', ExpandConstant('{tmp}\AndesBackupToolSrv.zip'),'servidor25');
       idpAddFileComp('http://andeserp.com.br/update/estavel/setup/AndesConfiguracao_MODELO.xml', ExpandConstant('{tmp}\AndesConfiguracao_MODELO.xml'),'servidor25');
       idpAddFileComp('http://andeserp.com.br/update/estavel/setup/AndesLogErrorTransfer.zip', ExpandConstant('{tmp}\AndesLogErrorTransfer.zip'),'servidor25');
       idpAddFileComp('http://andeserp.com.br/update/estavel/setup/AndesLogTransfer.zip', ExpandConstant('{tmp}\AndesLogTransfer.zip'),'servidor25');
       idpAddFileComp('http://andeserp.com.br/update/estavel/setup/AndesMonitorUpdate.zip', ExpandConstant('{tmp}\AndesMonitorUpdate.zip'),'servidor25');
       idpAddFileComp('http://andeserp.com.br/update/estavel/setup/descompactaSRV.bat', ExpandConstant('{tmp}\descompactaSRV.bat'),'servidor25');
       idpAddFileComp('http://andeserp.com.br/update/estavel/setup/descompactaDP.bat', ExpandConstant('{tmp}\descompactaDP.bat'),'datapump');
       idpAddFileComp('http://andeserp.com.br/update/estavel/setup/restart_service_config.xml', ExpandConstant('{tmp}\restart_service_config.xml'),'servidor25');
       idpAddFileComp('http://andeserp.com.br/update/estavel/setup/restart_services.bat', ExpandConstant('{tmp}\restart_services.bat'),'servidor25');
       idpAddFileComp('http://andeserp.com.br/update/estavel/setup/install_services.bat', ExpandConstant('{tmp}\install_services.bat'),'servidor25');
       idpAddFileComp('http://andeserp.com.br/update/estavel/setup/cepbras.zip', ExpandConstant('{tmp}\cepbras.zip'),'servidor25');
       idpDownloadAfter(wpReady);
   end;
