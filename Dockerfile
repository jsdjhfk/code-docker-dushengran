# docker fastqc & multiQC
# out of cuhkhaosun/base image
FROM cuhkhaosun/base

LABEL maintainer="XNGZ"
LABEL maintainer="LYX"

# Installation the package

RUN apt update && apt install -y fastqc && apt autoclean


# Set working directory
WORKDIR /root

# Download the set.thread.num.sh script
RUN curl -o /root/set.thread.num.sh https://raw.githubusercontent.com/cuhk-haosun/code-docker-script-lib/main/set.thread.num.sh && \
    chmod +x /root/set.thread.num.sh

# Copy entrypoint script to container
COPY entrypoint.sh /entrypoint.sh

# Permission
RUN chmod +x /entrypoint.sh

# Entry point
ENTRYPOINT ["/entrypoint.sh"]
