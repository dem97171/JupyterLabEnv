# 機械学習の勉強用Nodebook環境
## 使い方
dockerが起動してる環境で
```
docker-compose up
```

を実行する。
コンテナを実行するとアクセストークンとURLが表示されるので、コピペしてブラウザでJupyterLabにアクセスする。

## ディレクトリ構造について
### file
Dockerfileを実行するときに `file/mecab-ipadic-2.7.0-20070801.tar.gz` と
 `file/mecab-0.996.tar.gz` を読み込んで展開するので、自分で `mecab-ipadic-2.7.0-20070801.tar.gz` と `mecab-0.996.tar.gz` をダウンロードしてから `docker-compose` を実行してね。

### workspace
JupyterLabで参照するワークスペースのディレクトリ。
