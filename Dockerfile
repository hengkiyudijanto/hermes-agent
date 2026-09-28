FROM node:20-alpine

# Pasang dependensi sistem yang dibutuhkan oleh git dan openssh
RUN apk add --no-cache git openssh-client python3 make g++

WORKDIR /app

# Salin seluruh file proyek dari hasil fork ke dalam container
COPY . .

# Pasang semua dependensi internal proyek langsung dari file lokal
RUN npm install

# Daftarkan perintah CLI hermes secara lokal agar bisa dieksekusi
RUN npm link

EXPOSE 8080

CMD ["npm", "run", "gateway"]
