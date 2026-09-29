FROM node:22-alpine

# Pasang dependensi sistem yang dibutuhkan oleh git dan openssh
RUN apk add --no-cache git openssh-client python3 make g++

WORKDIR /app

# Salin seluruh file proyek dari hasil fork ke dalam container
COPY . .

# Pasang semua dependensi internal proyek dengan mengabaikan pembatasan versi engine
RUN npm install --engine-strict=false

# Daftarkan perintah CLI hermes secara lokal agar bisa dieksekusi
RUN npm link

EXPOSE 8080

CMD ["npm", "run", "gateway"]
