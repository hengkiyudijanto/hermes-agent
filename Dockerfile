FROM debian:13-slim

# Pasang dependensi utama yang ringan tanpa kompilasi ulang
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl python3 python3-pip git openssh-client nodejs npm \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/hermes

# Salin seluruh kode proyek
COPY . .

# Pasang runtime paket hermes secara global
RUN npm install -g @nousresearch/hermes-agent --unsafe-perm

# Setel port standar web dashboard
EXPOSE 8080

# Jalankan gateway komunikasi otomatis
CMD ["hermes", "gateway"]
