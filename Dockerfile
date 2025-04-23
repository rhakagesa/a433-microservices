# menggunakan base image node 14 alpine
FROM node:14-alpine
# menentukan working directory container pada /app
WORKDIR /app
# mengcopy semua file dari host ke container
COPY . .
# menentukan environment production dan menggunakan container item-db
ENV NODE_ENV=production DB_HOST=item-db
# menjalankan perintah npm install untuk memasang dependensi dan melakukan build aplikasi dengan perintah npm run build
RUN npm install --production --unsafe-perm && npm run build
# mengekspos port aplikasi yaitu 8080
EXPOSE 8080
# menjalankan perintah npm start untuk menjalankan aplikasi
CMD [ "npm", "start" ]