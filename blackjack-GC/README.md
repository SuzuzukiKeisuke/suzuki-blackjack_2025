# Dockerを学ぼう
## 目的
サーバーに関する知識を学習し、配属先の業務に役立てる

## 目標
- Linux環境をDockerで立ち上げる
- その環境にMySQLをインストールする
- MySQLが動いているLinuxサーバーでブラックジャックをアプリを動かす

## 手順
###  0. Github Codespaceを使う
#### 0-1. ローカル環境で動かしたかった
- [公式サイト](https://docs.docker.com/desktop/setup/install/windows-install/)からインストーラをダウンロードしてインストールした
- BIOSの設定で仮想マシンについての項目を操作しないといけない
- ほんとはUbuntuのLinux環境を動かしたかったけど、仮想環境が動作しない
- **-> 今回はGithubを使用して動かす**

#### 0-2. Github Codespaceとは
**GitHub上のリポジトリをLinux環境で開いて、コードを書いて、ビルドして、実行できるサービス**　- copilot
- 開発コンテナの構成を定義できる
- 無料で利用できる範囲がある
- クラウドなので、外部のLinux仮想マシンホストへのアクセスは制限されている
![GithubCodespaceの構造を示す画像](https://docs.github.com/assets/cb-68851/mw-1440/images/help/codespaces/codespaces-diagram.webp)
参考:[GitHub Codespacesesとは](https://docs.github.com/ja/codespaces/about-codespaces/what-are-codespaces)

### 1. プロジェクト構成
- Javaアプリケーション(JSP/Servlet)
- Tomcatサーバー
- MariaDB
- JDBCドライバ
### 2. リポジトリの準備
以下のファイル構成を構築する
```
your-project/
├── .devcontainer/
│   ├── devcontainer.json
│   └── Dockerfile        (環境定義)
├── docker-compose.yml    (起動構成)
├── sql/
│   └── schema.sql        (DDL)
└── target/yourapp.war    (アプリケーション)
```

#### 2-1. Dockerfile
- 使用するイメージとリソースを定義
```Dockerfile
FROM tomcat:9.0-jdk11
COPY ./target/Suzuki_Blackjack_2025.war /usr/local/tomcat/webapps/
```
#### 2-2. YMLファイル
- YAML Ain't a Markup Language
- YAMLに従って書かれたファイル
- ここでは**起動する構成を定義**している
```yml
version: '3.8'
services:
  db:
    image: mariadb:10.4
    container_name: blackjack-db
    environment:
      MYSQL_ALLOW_EMPTY_PASSWORD: "yes"
      MYSQL_ROOT_PASSWORD: password
      MYSQL_DATABASE: blackjack
      MYSQL_USER: root
    ports:
      - "3306:3306"
    volumes:
      - ./sql/:/docker-entrypoint-initdb.d/

```
#### 2-3. SQLファイル
- データベースの初期構成を定義する
- 以前作製したDDLファイルを置いた
```sql
USE blackjack;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(20) NOT NULL,
    user_password VARCHAR(20) NOT NULL,
    user_isadmin BOOLEAN NOT NULL DEFAULT FALSE,
    user_wincount INT NOT NULL DEFAULT 0,
    user_losecount INT NOT NULL DEFAULT 0,
    user_drawcount INT NOT NULL DEFAULT 0,
    user_bjcount INT NOT NULL DEFAULT 0,
    user_chip INT NOT NULL DEFAULT 100
);

CREATE TABLE results (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    result_code TINYINT NOT NULL,
    result_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    result_win INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);


```
#### 2-4. WARファイル
- Web Application Archive
- JavaベースのWebアプリケーションをパッケージ化するためのファイル形式
- アプリケーションサーバーにWARファイルを配布すると、これをもとにデプロイされる
今回はEclipseのエクスポート機能でプロジェクト全体をWARファイルに変換した

#### 2-5. jsonファイル

### 3 リポジトリをプッシュ