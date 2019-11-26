FROM alpine:3.10
MAINTAINER Dmitry Boldak <dbsfbp@gmail.com>

########################################### [ PYTHON 2 ] ###########################################

RUN apk add --no-cache python2 && \
    python2 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip2 install --upgrade pip setuptools && \
    rm -r /root/.cache

########################################### [ PYTHON 3 ] ###########################################

ENV PYTHONUNBUFFERED=1

RUN echo "**** install Python ****" && \
    apk add --no-cache python3 && \
    # Set python3 as default
    ln -sf python3 /usr/bin/python && \
    \
    echo "**** install pip ****" && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    # Set pip3 as default
    ln -sf pip3 /usr/bin/pip

####################################### [ GOOGLE CLOUD  SDK ] ######################################

WORKDIR /root

### Download Google Cloud SDK
RUN apk add --no-cache --virtual .bootstrap-deps wget ca-certificates \
    && wget -O cloud.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-272.0.0-linux-x86_64.tar.gz \
    && tar xzf cloud.tar.gz \
    && rm cloud.tar.gz \
    && apk del .bootstrap-deps

### Install SDK and App Engine component
RUN google-cloud-sdk/install.sh \
      --path-update=true \
      --bash-completion=true --rc-path=/root/.bashrc \
      --additional-components app-engine-python

### Configuration

# Disable updater check for the whole installation.
# Users won't be bugged with notifications to update to the latest version of gcloud.
RUN /root/google-cloud-sdk/bin/gcloud config set core/disable_usage_reporting true \
    && /root/google-cloud-sdk/bin/gcloud config set component_manager/disable_update_check true \
    && /root/google-cloud-sdk/bin/gcloud --version

# Disable updater completely.
# Running `gcloud components update` doesn't really do anything in a union FS.
# Changes are lost on a subsequent run.
RUN sed -i -- 's/\"disable_updater\": false/\"disable_updater\": true/g' /root/google-cloud-sdk/lib/googlecloudsdk/core/config.json

# Make gcloud command accessible
ENV PATH /root/google-cloud-sdk/bin:$PATH
ENV gcloud_sdk_dir /root/google-cloud-sdk

# Add permissions to run the App Engine dev server
RUN chmod +x /root/google-cloud-sdk/platform/google_appengine/dev_appserver.py