@echo off
color 0A
echo                       ============IP ��ַ�Զ��л� v1.0=============
echo 			1.���ù�˾IP   2.����DHCP	3.�˳�
echo.
set /p choice= ���ѡ��:
echo.
if "%choice%"=="1" goto ip1
if "%choice%"=="2" goto ip2
if "%choice%"=="3" goto end
if "%choice%"=="4" goto test
goto main
:ip1
echo IP�Զ����ÿ�ʼ...
echo.
echo ��������IP����������
cmd /c netsh interface ip set address name="��̫��" source=static addr=192.168.4.168 mask=255.255.255.0 gateway=192.168.4.254 gwmetric=1
echo ��������DNS������
cmd /c netsh interface ip set dns name="��̫��" source=static addr=59.77.139.1 register=PRIMARY
echo ��������DNS������
cmd /c netsh interface ip add dns name="��̫��" addr=192.168.30.1 
echo �������
pause
exit 
if errorlevel 2 goto main
if errorlevel 1 goto end 
:ip2
echo IP�Զ����ÿ�ʼ...
echo.
echo �Զ���ȡIP��ַ...
netsh interface ip set address name="��̫��" source=dhcp
echo �Զ���ȡDNS��ַ...
netsh interface ip set dns name="��̫��" source=dhcp 
@rem �����Զ���ȡIP
echo �������
pause
exit 
if errorlevel 2 goto main
if errorlevel 1 goto end 
:test
netsh inte***ce ip set address name = "��̫��" source = dhcp
netsh inte***ce ip set dns name = "��̫��" source = dhcp 
netsh inte***ce ip set wins name = "��̫��" source = dhcp 
CHOICE /C YN /M "�˳��밴Y�����ز˵��밴N."
if errorlevel 2 goto main
if errorlevel 1 goto end 
:end  