chcp.com 65001

$curp = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if ($curp.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator) -ne $true) {
    Write-Error('관리자 권한으로 실행하십시오.')
    Write-Output('아무 키나 눌러종료하십시오.')
    Pause
    exit
}

sc.exe config "svcMayaDSes" start=disabled
sc.exe config "SvcMayaEC" start=disabled

if ($LASTEXITCODE) {
    Write-Error('오류가 발생했습니다. 화면을 찍어 제작자에게 문의하십시오.')
    Write-Output('아무 키나 눌러종료하십시오.')
    Pause
    exit
}

Write-Output('바로 적용하려면 재부팅이 필요합니다.')
$sd = Read-Host('재부팅하시겠습니까? (예 / 아니오)')
if ($sd -eq '예') {
    shutdown.exe /s -t 0
    exit
}
Write-Output('아무 키나 눌러종료하십시오.')
Pause
exit
