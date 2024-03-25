@echo off
chcp 65001
cls

bcdedit > nul
IF %ERRORLEVEL% NEQ 0 (
    echo 관리자 권한으로 실행하세요.
    echo 아무 키나 눌러서 끌 수 있습니다.
    pause > nul
    exit
)
sc config "svcMayaDSes" start=disabled
sc config "SvcMayaEC" start=disabled
sc config "sService Agent Launcher" start=disabled
sc config "sServiceLoopBack" start=disabled
if %ERRORLEVEL% neq 0 (
    echo 오류가 발생했습니다.
    echo 제작자에게 문의하세요.
    echo 아무 키나 눌러서 끌 수 있습니다.
    pause > nul
    exit
)

echo 지금 바로 적용하려면 재부팅이 필요합니다.
set /p "reboot=재부팅하시겠습니까? (예 / 아니오): "
IF %reboot% EQU 예 (
    shutdown /r -t 0
    exit
)
if %reboot% equ 아니오 (
    echo 아무 키나 눌러서 끌 수 있습니다.
    pause > nul
    exit
)
