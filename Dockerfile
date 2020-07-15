FROM gw000/keras:2.1.4-py3-tf-cpu
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

EXPOSE 8888
WORKDIR $DIR

CMD /bin/bash -c '--ip=0.0.0.0 --port=8888 --allow-root --no-browser \
    --notebook-dir="$DIR" \
    --NotebookApp.password="$PASSWD" \
    --NotebookApp.token="$TOKEN" \
    --NotebookApp.allow_password_change=False \
    "$@"'
