# so everything below can be refered as the builder phase

FROM node:alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# /app/build has the data we want from this builder phase

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
