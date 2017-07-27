net stop srvAndesUpdate
net stop srvAndesBackupTool
net stop srvAndesPlanoOrcamentario
net stop AndesLogTransfer
net stop AndesLogErrorTransferService
c:\AndesERP\AndesAtualizador.exe /naomenu
net start srvAndesUpdate
net start srvAndesBackupTool
net start srvAndesPlanoOrcamentario
net start AndesLogTransfer
net start AndesLogErrorTransferService