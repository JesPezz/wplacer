FROM node:22-bookworm

RUN apt-get update && apt-get install -y \
    build-essential \
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    librsvg2-dev \
    python3 \
    pkg-config \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY package*.json ./
COPY pnpm-lock.yaml* ./

RUN npm install --build-from-source impit

COPY . .

EXPOSE 3000

CMD ["node", "."]
