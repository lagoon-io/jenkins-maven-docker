# jenkins-maven-docker

## イメージの作成とコンテナの起動

```
# イメージ作成
$ docker build  -t jenkins-maven:latest .

# コンテナ起動
$ docker run -u root -d -p 8080:8080 -p 50000:50000 -v jenkins-data:/var/jenkins_home/custom -v /var/run/docker.sock:/var/run/docker.sock jenkins-maven
```

## 補足：パスワード確認方法

以下のコマンドを実行して、初期パスワードを確認できる。

```
$ docker log ＜コンテナID＞
```

```
INFO:

*************************************************************
*************************************************************
*************************************************************

Jenkins initial setup is required. An admin user has been created and a password generated.
Please use the following password to proceed to installation:

818bba2a7fa2420c81128a7e8a0c6ff7

This may also be found at: /var/jenkins_home/secrets/initialAdminPassword

*************************************************************
*************************************************************
*************************************************************
```
