FROM node:19.5.0-alpine AS builder


COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:19.5.0-alpine

WORKDIR /app

COPY --from=builder package*.json ./
COPY --from=builder .next ./.next
COPY --from=builder public ./public
COPY --from=builder node_modules ./node_modules

ENV NODE_ENV=production

EXPOSE 3000

CMD ["npm", "start"]