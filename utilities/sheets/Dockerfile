FROM node:18
WORKDIR /app
RUN apt-get update && apt-get install -y build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev
RUN npm install -g pnpm
COPY package.json .
RUN pnpm i

COPY . .

EXPOSE $PORT

RUN pnpm exec tsc
CMD ["node", "./build"]