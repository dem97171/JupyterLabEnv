FROM continuumio/anaconda3
WORKDIR /workspace

# install pip
RUN pip install -U pip
RUN pip install -U setuptools
RUN pip install Augmentor
RUN pip install tensorflow
RUN pip install keras
RUN pip install gensim
RUN pip install plotly

# install build tools
RUN apt-get install -y build-essential
RUN apt-get install -y make

# install mecab
ADD file/mecab-0.996.tar.gz /workspace
RUN cd mecab-0.996 && ./configure && make && make check && make install

# install mecab ipa dec
RUN mecab-config --libs-only-L | tee /etc/ld.so.conf.d/mecab.conf
RUN ldconfig
ADD file/mecab-ipadic-2.7.0-20070801.tar.gz /workspace
RUN cd mecab-ipadic-2.7.0-20070801 && ./configure && make && make install

# install meacb-python3
RUN pip install mecab-python3

# start
CMD jupyter-lab --no-browser \
  --port=8888 --ip=0.0.0.0 --allow-root
