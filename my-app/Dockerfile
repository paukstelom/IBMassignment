FROM node:19.5.0-alpine AS builderr

WORKDIR /app

COPY package*.json /.
RUN npm install
RUN npm ci
COPY . .
RUN npm run build

FROM node:19.5.0-alpine

WORKDIR /app

COPY --from=builderr /app/package.json ./
COPY --from=builderr /app/.next ./.next
COPY --from=builderr /app/public ./public
COPY --from=builderr /app/node_modules ./node_modules

ENV NODE_ENV=production

EXPOSE 3000

CMD ["npm", "start"]