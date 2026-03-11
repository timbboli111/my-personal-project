FROM adguard/adguardhome:latest

# Direktori kerja tersamar
WORKDIR /opt/app-runtime

# Salin konfigurasi yang sudah kita racik
COPY AdGuardHome.yaml /opt/adguardhome/conf/AdGuardHome.yaml

# Buka port 3000 (Dashboard) dan 443 (DoT/DoH)
EXPOSE 3000
EXPOSE 443

# Jalankan service utama
CMD ["/opt/adguardhome/AdGuardHome", \
     "--work-dir", "/opt/adguardhome/work", \
     "--conf", "/opt/adguardhome/conf/AdGuardHome.yaml", \
     "--no-check-update"]

