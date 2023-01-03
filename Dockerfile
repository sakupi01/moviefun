# ビルド用のコンテナ
FROM node:16-alpine as builder

  # Enable "sh" in Alpine container
RUN apk add --no-cache bash

WORKDIR /app

COPY . /app

RUN npm install

RUN npm run build


# 実行用のコンテナ
FROM node:16-alpine

WORKDIR /app

COPY --from=builder /app  .

ENV HOST 0.0.0.0
EXPOSE 3000

CMD [ "npm", "run", "start" ]