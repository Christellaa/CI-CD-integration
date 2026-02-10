FROM debian:13.3-slim

RUN apt-get update && apt-get install -y curl unzip
RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="$PATH:/root/.bun/bin"
COPY srcs ./srcs

CMD ["bun", "--watch", "srcs/index.ts"]