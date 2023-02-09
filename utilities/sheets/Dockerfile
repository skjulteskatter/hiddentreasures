FROM node:16-alpine
WORKDIR /app
RUN apt update
RUN apt install -y build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev
RUN npm install -g pnpm
COPY package.json .
RUN pnpm i

COPY . .

EXPOSE $PORT

CMD ["pnpm", "start"]