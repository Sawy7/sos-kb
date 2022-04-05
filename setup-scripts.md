# Setup Scripts
> Toto je seznam skriptů, které se použitím jednoho řádku stáhnou, spustí a provedou kýžený úkon. Je potřeba zmínit, že byste neměli věřit, že se nejedná o jakýsi podvod. Prosím, **PŘEČTETĚ SI NEJDŘÍVE POZORNĚ CELÝ SKRIPT** a až potom jej případně spouštějte.

## Příprava
Pro příme spouštění skriptů je potřeba mít nainstalovaný ```curl```:
```console
root@debian:~$ apt update && apt install curl
```

## Nastavení sítě
DHCP Local:
```console
curl -s -L https://raw.githubusercontent.com/Sawy7/sos-kb/master/setup-scripts/localnet-dhcp-setup.sh | bash
```

Static Local:
```console
curl -s -L https://raw.githubusercontent.com/Sawy7/sos-kb/master/setup-scripts/localnet-static-setup.sh | bash
```

Vytvoření jednoho oddílu na specifikovaném disku a naformátování v souborovém systému *ext4*:
```console
curl -s -L https://raw.githubusercontent.com/Sawy7/sos-kb/master/setup-scripts/partition-whole-disk.sh | bash
```

Průvodce (wizard) pro jednoduchou instalaci a konfiguraci *ISC DHCP Server*:
```console
curl -s -L https://raw.githubusercontent.com/Sawy7/sos-kb/master/setup-scripts/dhcpd-wiz.sh | bash
```
