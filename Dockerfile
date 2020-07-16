FROM gw000/keras:2.1.4-py3-tf-cpu
MAINTAINER heguangping 846120050@qq.com
# this is a basic environmental of python3+pip3+keras(backend:tensorflow)

# install jupyterlab
RUN pip3 --no-cache-dir install jupyterlab

# ENV for start the jupyterlab
ENV DIR='/opt/keras/'
ENV PASSWD='sha1:98b767162d34:8da1bc3c75a0f29145769edc977375a373407824'
ENV TOKEN='keras'
# random token authentication
#unset ENV PASSWD=
#unset ENV TOKEN=

# install nodejs
RUN apt-get update -qq && apt-get install --no-install-recommends -y curl && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get install --no-install-recommends -y nodejs && apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 8888
WORKDIR $DIR

CMD /bin/bash -c 'jupyter lab --ip=0.0.0.0 --port=8888 --allow-root --no-browser \
    --notebook-dir="$DIR" \
    --NotebookApp.password="$PASSWD" \
    --NotebookApp.token="$TOKEN" \
    --NotebookApp.allow_password_change=False \
    "$@"'
