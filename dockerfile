FROM gw000/keras:2.1.4-py3-tf-cpu

# install jupyterlab
RUN pip3 --no-cache-dir install jupyterlab


CMD ["/bin/bash"]
