# ---- Build stage ----
FROM node:18 AS builder

WORKDIR /app
COPY package*.json ./
RUN npm ci

COPY . .
RUN npm test

# ---- Runtime stage ----
FROM node:18-slim

WORKDIR /app

COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node.js ./

RUN npm ci --omit=dev

USER node

EXPOSE 3004

CMD ["node", "node.js"]
