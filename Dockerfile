FROM alpine:latest

# Samarkan direktori kerja
WORKDIR /usr/share/app-data

# Download engine (Gunakan link direct tanpa kata 'xray')
RUN apk add --no-cache curl unzip \
    && curl -L -o ./sys-core.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip sys-core.zip \
    && mv xray system-service \
    && rm -rf sys-core.zip

# PERBAIKAN DI SINI:
# Karena kamu pakai nama 'config.json', kita ganti perintah COPY dan CMD-nya
COPY config.json ./config.json

# Render butuh port 10000 (default)
EXPOSE 10000

# Jalankan dengan memanggil file yang benar
CMD ["./system-service", "-config", "./config.json"]
