FROM continuumio/anaconda3:2022.10
WORKDIR /workspace

# install build tools
RUN apt-get update -qq
RUN apt-get install -y apt-utils
RUN apt-get install -y build-essential
RUN apt-get install -y make

# install pip
RUN pip install -U pip
RUN pip install -U setuptools

# node.js install
RUN conda install nodejs -c conda-forge --repodata-fn=repodata.json

# グラフ描画
## 3D描画のplotlyとJupyternotebookで3Dグラフを描画するためのnode.js拡張
RUN pip install ipywidgets>=7.6
RUN pip install jupyter-dash

# DL
RUN pip install tensorflow
RUN pip install keras

# 自然言語処理
## トピック分析
RUN pip install gensim

# 画像処理
## 画像データ水増し
RUN pip install Augmentor

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

# opencv
RUN apt-get install -y libgl1-mesa-glx
RUN conda update conda
RUN conda update anaconda
RUN conda install opencv

# start
CMD jupyter-lab --no-browser \
  --port=8888 --ip=0.0.0.0 --allow-root
