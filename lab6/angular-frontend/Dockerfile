FROM node:16-alpine AS build
WORKDIR /app/
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/dist/angular-frontend /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/nginx.conf
