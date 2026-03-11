# Menggunakan image resmi AdGuard Home yang ringan
FROM adguard/adguardhome:latest

# Buat direktori kerja agar rapi
WORKDIR /opt/adguardhome/work

# Salin konfigurasi awal (opsional, tapi bagus buat pre-config)
# Kita akan buat file AdGuardHome.yaml terpisah nanti
COPY AdGuardHome.yaml /opt/adguardhome/conf/AdGuardHome.yaml

# Port yang biasanya dibuka oleh layanan PaaS (HTTP/HTTPS)
# Port 3000 untuk Dashboard (Setup awal)
# Port 443 atau 853 untuk DoT (Tergantung platform)
EXPOSE 3000
EXPOSE 443
EXPOSE 853

# Jalankan AdGuard Home
CMD ["/opt/adguardhome/AdGuardHome", \
     "--work-dir", "/opt/adguardhome/work", \
     "--conf", "/opt/adguardhome/conf/AdGuardHome.yaml", \
     "--no-check-update"]

