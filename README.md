Introduction
---

Python 3.6.0 with Jupyter Nodebook.

Tensorflow 0.11 with Keras.

Build
---

docker build -t zhan2016/tensorflow-docker-rpi:0.11-rpi3 .

Run
---

docker run --name tf -d -p 8888:8888 -v $HOME:/notebooks zhan2016/tensorflow-docker-rpi:0.11-rpi3

Get Token
---

docker exec -it tf jupyter notebook list

Thanks
---

* [Jupyter Notebook Server on Raspberry Pi](https://github.com/kleinee/jns)
* [Tensorflow for Raspberry Pi](https://github.com/samjabrahams/tensorflow-on-raspberry-pi)

