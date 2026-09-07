FROM node:22-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    ca-certificates \
    xz-utils \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz -o ffmpeg.tar.xz \
    && tar -xf ffmpeg.tar.xz \
    && cp ffmpeg-*-amd64-static/ffmpeg /usr/local/bin/ \
    && cp ffmpeg-*-amd64-static/ffprobe /usr/local/bin/ \
    && rm -rf ffmpeg*

RUN git clone https://github.com/Ainz-devs/OVL-MD-V2.git /ovl_bot

WORKDIR /ovl_bot

RUN npm install

EXPOSE 8000

CMD ["npm", "run", "Ovl"]
