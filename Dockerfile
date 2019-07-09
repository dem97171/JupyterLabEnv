FROM continuumio/anaconda3
WORKDIR /workspace
RUN pip install mecab-python3
RUN pip install gensim
CMD jupyter-lab --no-browser \
  --port=8888 --ip=0.0.0.0 --allow-root
