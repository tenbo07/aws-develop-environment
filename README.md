# AWSスクリプト開発環境

#### 0.librarian-chef

```gem install librarian-chef```

#### 1.git clone

```git clone https://github.com/tenbo07/aws-devlop-environment.git```

```cd aws-devlop-environment```

#### 2.Vagrant plugin install

```vagrant plugin install vagrant-omnibus```

#### 3.cookbook install

```librarian-chef install```

#### 4.vagrant up

```vagrant up```

#### 5.構築したサーバにログイン

```vagrant ssh```

#### 6.Vimプラグインのインストール

```vim ```


``` :NeoBundleInstall ```


## 設定
#### git 設定
以下にgitの設定を記述するとプロビジョニング時に設定します

site-cookbooks/aws/attributes/git_config.rb

###### 例)

```site-cookbooks/aws/attributes/git_config.rb
default[:git][:username] = "username"
default[:git][:email] = "user@email"
```

#### プロキシ環境下での利用

```vagrant plugin install vagrant-proxyconf```

環境変数"http_proxy","https_proxy"を設定

for Windows

```
set http_proxy="http://yourproxyhost:port"
set https_proxy="http://yourproxyhost:port"
```

for Mac or Other Linux

```
export http_proxy="http://yourproxyhost:port"
export https_proxy="http://yourproxyhost:port"
```
