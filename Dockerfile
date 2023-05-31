# Use a base image with Python 3.8 and Odoo 16 dependencies
FROM python:3.8

# Set environment variables
ENV ODOO_VERSION=16.0 \
    ODOO_RELEASE=20211006

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    libsasl2-dev \
    libldap2-dev \
    libpq-dev \
    wget \
    curl \
    git \
    libjpeg-dev \
    libldap2-dev \
    libsasl2-dev \
    node-less \
    postgresql-client \
    libjpeg62-turbo-dev \
    xfonts-75dpi \
    xfonts-base \
    && rm -rf /var/lib/apt/lists/*

# Download and install Odoo
RUN set -x; \
    curl -o odoo.deb -SL http://nightly.odoo.com/${ODOO_VERSION}/nightly/deb/odoo_${ODOO_VERSION}.${ODOO_RELEASE}_all.deb \
    && dpkg --force-depends -i odoo.deb \
    && apt-get install -y -f --no-install-recommends \
    && rm odoo.deb

# Set up Odoo configuration file
COPY odoo.conf /etc/odoo.conf

# Expose Odoo ports
EXPOSE 8069 8071

# Set the working directory
WORKDIR /opt/odoo

# Define the entrypoint command
ENTRYPOINT ["odoo"]

# Set the default command to start Odoo server
CMD ["--config=/etc/odoo.conf"]