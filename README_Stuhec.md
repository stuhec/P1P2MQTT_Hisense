

--compile and upload to bridge -- set IP in configs
cd C:\WORK\P1P2MQTT_Hisense\P1P2MQTT_Hisense\examples\P1P2MQTT-bridge
py -3.13 -m platformio run -e Hisense-OTA
py -3.13 -m platformio run -e Hisense-OTA -t upload



--compile and upload monitor
cd C:\WORK\P1P2MQTT_Hisense\P1P2MQTT_Hisense\examples\P1P2MQTT-bridge
py -m platformio run -e Hisense
py -m platformio run -e Hisense -t upload



telnet ukazi:
    V - vidis kaj je nastavljeno
    J11B -> spremenis output mode  -> ce das V in pogledas  P19: output mode              is 0x0002 -> to naj je 0x011B


--to mora biti nastavljeno da lahko uploadas nov firmware
C:\WORK\P1P2MQTT_Hisense\P1P2MQTT_Hisense\examples\P1P2Monitor\platformio.ini¨->> tukaj mora biti pravi IP pri bridge_ip
C:\WORK\P1P2MQTT_Hisense\P1P2MQTT_Hisense\examples\P1P2MQTT-bridge\platformio.ini ->> tukaj mora biti pravi IP pri upload_port


.\mosquitto_sub.exe -h 192.168.0.139 -p 1883 -u P1P2 -P "password_je_nek_tukaj
" -t "P1P2/R/#" -v | Tee-Object -FilePath c:\temp\mqtt_5.txt


za pakete z 89 00 30 je naslednja tabela: (primer: 890030010101010101B1400118142D18000000010000000000000000003E000D8181810D0C00000C2000000100110077)

| Payload index | Hex primer          | Dec          | Pomen                                     | Status                |
| ------------- | ------------------- | ------------ | ----------------------------------------- | --------------------- |
| 7             | `41` → `40`         |              | Statusni bajt (bit 0 sledi ON/OFF)        | Kandidat              |
| 8             | `31` → `11`         |              | Delovni način / zahteva ogrevanja         | Kandidat              |
| 9             | `17` → `18`         | 23 → 24      | Cycle1 Water Temperature Setpoint         | ✅ Potrjeno            |
| 10            | `14`                | 20           | Neznano                                   | ?                     |
| 11            | `2D`                | 45           | Neznano                                   | ?                     |
| 12            | `18`                | 24           | Mogoče dejanski LWT ali povezan parameter | Kandidat              |
| 13            | `01` → `00`         |              | Heatpump Enabled / System ON              | ✅ Zelo verjetno       |
| 18            | `11` → `00`         |              | Obtočna črpalka / aktivna zahteva         | ✅ Močan kandidat      |
| 25            | `3E`                | 62           | Konstantna vrednost                       | ?                     |
| 28            | `16 → 18 → 17`      | 22 → 24 → 23 | Temperaturni parameter                    | Kandidat              |
| 29            | `81`                |              | Statusni biti                             | ?                     |
| 30            | `81`                |              | Statusni biti                             | ?                     |
| 31            | `81`                |              | Statusni biti                             | ?                     |
| 32            | `16 → 18 → 17`      | 22 → 24 → 23 | Temperaturni parameter                    | Kandidat              |
| 33            | `14 → 15`           | 20 → 21      | Temperaturni parameter                    | Kandidat              |
| 36            | `0B`                | 11           | Neznano                                   | ?                     |
| 37            | `20`                | 32           | Neznano                                   | ?                     |
| 40            | `01`                |              | Statusni flag                             | Kandidat              |
| 42            | `11`                | 17           | Outside Temperature                       | ✅ Zelo verjetno       |
| 44            | `42 → 43 → 52 → 72` |              | Checksum / stanje okvirja                 | Verjetno ne parameter |


 za pakete: 89 00 1E 010101010101B815160000000081180E0E0000000000001700002B


 