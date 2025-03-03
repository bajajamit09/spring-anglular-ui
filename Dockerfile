FROM node:14-alpine as build-step
#FROM node:latest as build-step
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app

RUN npm install
COPY . /app
RUN npm run build --prod
 
FROM nginx:1.17.1-alpine
#COPY --from=build-step /app/dist/DemoApp /usr/share/nginx/html
COPY --from=build-stage /app/dist/DemoApp /usr/share/nginx/html
