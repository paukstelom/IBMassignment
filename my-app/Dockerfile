FROM node:19.5.0-alpine AS builder

WORKDIR /app

ARG IMAGE_TAG

ENV NEXT_PUBLIC_IMAGE_TAG ${IMAGE_TAG}

COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:19.5.0-alpine

WORKDIR /app

COPY --from=builder /app/package.json ./
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/node_modules ./node_modules

ENV NODE_ENV=production

EXPOSE 3000

CMD npm run start
