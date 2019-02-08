#first phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# durch neues from automatisch neue phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# nginx startet als default command automatisch den server
