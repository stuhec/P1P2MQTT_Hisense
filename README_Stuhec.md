

--compile and upload to bridge -- set IP in configs
cd C:\WORK\P1P2MQTT_Hisense\P1P2MQTT_Hisense\examples\P1P2MQTT-bridge
py -3.13 -m platformio run -e Hisense-OTA
py -3.13 -m platformio run -e Hisense-OTA -t upload



--compile and upload monitor
cd C:\WORK\P1P2MQTT_Hisense\P1P2MQTT_Hisense\examples\P1P2MQTT-bridge
py -m platformio run -e Hisense
py -m platformio run -e Hisense -t upload



telnet ukazi:
    J11B -> spremenis output mode


--to mora biti nastavljeno da lahko uploadas nov firmware
C:\WORK\P1P2MQTT_Hisense\P1P2MQTT_Hisense\examples\P1P2Monitor\platformio.ini¨->> tukaj mora biti pravi IP pri bridge_ip
C:\WORK\P1P2MQTT_Hisense\P1P2MQTT_Hisense\examples\P1P2MQTT-bridge\platformio.ini ->> tukaj mora biti pravi IP pri upload_port