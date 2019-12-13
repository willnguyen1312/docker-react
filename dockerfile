# Phase 1: Build
FROM node:alpine as builder

WORKDIR /app

COPY package.json .
RUN npm install

COPY . .

RUN npm run build


# Phase 2: Deploy
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html