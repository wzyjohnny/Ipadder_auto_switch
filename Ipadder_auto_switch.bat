@echo off
color 0A
echo                       ============IP 地址自动切换 v1.0=============
echo 			1.设置公司IP   2.设置DHCP	3.退出
echo.
set /p choice= 你的选择:
echo.
if "%choice%"=="1" goto ip1
if "%choice%"=="2" goto ip2
if "%choice%"=="3" goto end
if "%choice%"=="4" goto test
goto main
:ip1
echo IP自动设置开始...
echo.
echo 正在设置IP及子网掩码
cmd /c netsh interface ip set address name="以太网" source=static addr=192.168.4.168 mask=255.255.255.0 gateway=192.168.4.254 gwmetric=1
echo 正在设置DNS服务器
cmd /c netsh interface ip set dns name="以太网" source=static addr=59.77.139.1 register=PRIMARY
echo 正在设置DNS服务器
cmd /c netsh interface ip add dns name="以太网" addr=192.168.30.1 
echo 设置完成
pause
exit 
if errorlevel 2 goto main
if errorlevel 1 goto end 
:ip2
echo IP自动设置开始...
echo.
echo 自动获取IP地址...
netsh interface ip set address name="以太网" source=dhcp
echo 自动获取DNS地址...
netsh interface ip set dns name="以太网" source=dhcp 
@rem 设置自动获取IP
echo 设置完成
pause
exit 
if errorlevel 2 goto main
if errorlevel 1 goto end 
:test
netsh inte***ce ip set address name = "以太网" source = dhcp
netsh inte***ce ip set dns name = "以太网" source = dhcp 
netsh inte***ce ip set wins name = "以太网" source = dhcp 
CHOICE /C YN /M "退出请按Y，返回菜单请按N."
if errorlevel 2 goto main
if errorlevel 1 goto end 
:end  