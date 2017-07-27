net stop srvAndesUpdate
net stop srvAndesBackupTool
net stop AndesLogTransfer
net stop AndesLogErrorTransferService

c:\andesERP\AndesUpdate.exe /uninstall /s
c:\andesERP\AndesUpdate.exe /install /s
net start srvAndesUpdate
c:\andesERP\AndesBackupToolsrv.exe /uninstall /s
c:\andesERP\AndesBackupToolsrv.exe /install /s
net start srvAndesBackupTool
c:\andesERP\AndesLogTransfer.exe /uninstall /s
c:\andesERP\AndesLogTransfer.exe /install /s
net start AndesLogTransfer
c:\andesERP\AndesLogErrorTransfer.exe /uninstall /s
c:\andesERP\AndesLogErrorTransfer.exe /install /s
net start AndesLogErrorTransferService
