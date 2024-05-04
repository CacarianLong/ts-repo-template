From node:22.1.0-bullseye-slim@sha256:3fd44a8648f66c1713cceb4e10087546fc7c4a040abf1e3c75406a17e5032fea AS builder
WORKDIR /app

ENV NODE_ENV=development
COPY ./package.json .
COPY ./package-lock.json .
RUN npm ci
COPY ./tsconfig.json .
COPY ./src ./src
RUN npm run build

From node:22.1.0-bullseye-slim@sha256:3fd44a8648f66c1713cceb4e10087546fc7c4a040abf1e3c75406a17e5032fea
WORKDIR /app
COPY --from=builder /app/dist .
COPY ./package.json .
COPY ./package-lock.json .
RUN npm ci