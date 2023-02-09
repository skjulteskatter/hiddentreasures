FROM node:18-alpine
WORKDIR /app
RUN apk get build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev
RUN npm install -g pnpm
COPY package.json .
RUN pnpm i

COPY . .

EXPOSE $PORT

CMD ["pnpm", "start"]