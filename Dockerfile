FROM node:18-alpine AS builder

WORKDIR /app

ENV NODE_ENV=development

COPY . .

RUN npm i

RUN npm run build

FROM node:18-alpine

WORKDIR /app

COPY --from=builder /app/dist ./dist

COPY --from=builder /app/package.json ./package.json

COPY --from=builder /app/.env ./.env

RUN npm i --production

ENV PORT=3000

EXPOSE $PORT

CMD ["npm", "start"]
