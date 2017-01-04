FROM resin/rpi-raspbian
MAINTAINER Zhan.Shi <g.shizhan.g@gmail.com>

RUN apt-get update && apt-get install -y git
RUN git clone --depth=1 https://github.com/ShiZhan/jns.git
RUN cd jns && ./install_python.sh && ./install_jupyter.sh && ./install_stack.sh

RUN rm -Rf /root/.cache/pip
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

ENV TF_URL https://github.com/samjabrahams/tensorflow-on-raspberry-pi/releases/download/v0.11.0/tensorflow-0.11.0-py3-none-any.whl
RUN pip --no-cache-dir install $TF_URL
RUN pip --no-cache-dir install keras

VOLUME /notebooks
WORKDIR /notebooks

EXPOSE 8888
CMD ["/bin/sh", "-c", "/usr/local/bin/jupyter-notebook --no-browser --ip=0.0.0.0 --notebook-dir=/notebooks"]
