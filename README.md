sda_examples(Network Security Through Data Analysis)
====

## Description
　ネットワークセキュリティにおいて、状況認識が重要。本当に守りたいものだけを保護し防御することが最も効果的な戦略

#### ネットワークデータ収集
 - 網羅性と冗長性のバランスを考慮し、センサーの配置、種類、アクセションを決定させる

##### センサー種類

 - ネットワーク型
    - 膨大なデータ量のため、データ量を抑制する必要がある。
      抑制方法として、循環バッファを利用、パケットの長さを制限、BNFなどのパケットフィルタ
      
    - 暗号化されているデータは読めない可能性が高い
      
    - イーサネットヘッダで最も重要な領域は、送信元と送信先との2つのMACアドレス
    
    ```
    $ tcpdump -i eth0 -s 0 -w result '((src port 80 || src port 443))' && (src net <ip_address>)
    ```
    
    - NetFlow
      ネットワークトラフィックセッションを要約するツール
    
 - ホスト型
    - サービスによって、ログフォーマットが異なる
    - ログ改ざんや消去の可能性が高い
    - 暗号化されているデータに対応可能
    
 - サービス型
    - サービスによって、ログフォーマットが異なる
    - ログ改ざんや消去の可能性が高い
    - サービスに特化した情報を残す
    
##### アクション（センサーによるデータの処理）

 - レポート生成型
 - イベント通知型
 - 自動防御型
 
#### ログ
 優れたセキュリティログは、説明的で、他のデータと関連付けができ、完全なものである。ログ転送にはsyslog(時刻、ファシリティ、深刻度、テキストメッセージなど含む)
 
 - 時間をエポック時間に変換
   タイムゾーンや夏時間などを気にする必要がなくなるため
   
 - センサーの同期
 
 - アドレス情報を入れること
   フロー5タプル(送信元IP,送信先IP,送信元ポート,送信先ポート,プロトコル)を入れる
 
 - ロガーが区切り文字を理解できるようにさせる
   
 - 可能な限りテキストでなくエラーコードを利用
   エラーメッセージとして、テキストはサイズが大きく解析を複雑化させるため

#### 着目すべきHTTPヘッダ
RFC4229(https://www.ietf.org/rfc/rfc4229.txt)の中で、監視に不可欠なヘッダ

 - Cookie
 - Host
 - Referer
 - User-Agent
 
 
## 分析
ログ分析は主にはI/Oバウンド(ディスクの読みだし速度に依存)である。

### ストレージシステムの種類
 - キーストア
   MongoDB, Accumulo, Cassandra, Hypertable, LevelDBなど
   
 - カラムナ(列指向)データベース
   各行を同じインデックスを持つ複数の列ファイルに分割
   MonetDB, Sensage, Paraccelなど

 - リレーショナルデータベース
   MySQL, Postgres, Oracle, SQL Serverなど
 
 - グラフデータベース
   グラフデータを扱う際に拡張性が高く効率的な問い合わせが可能
   Neo4j, ArangoDB, Titan
   
### ストレージの選択
 データ構造がわからない場合は、キーストア型が向いている(特に、ここのレコードサイズが大きい場合に効果的)が、データが列に分割できる場合にはカラムナモデルや、同じデータベースへの参照が広範囲に繰り返されるような構造を持つ場合には、リレーショナルモデルが適している
 
 - ハードディスク
 並列処理ができる場合に、カラムナモデルやキーストアが性能上のメリットを発揮するため。
 
 - データの大きさ
 
 - データフローとCRUDパラダイム
 定期的な行の更新であれば、リレーショナルモデル。内容があまり更新されない場合はカラムナモデル
 
 - データ構造とレコードのサイズ
   レコードが小さくか構造化されている場合は、カラムナモデル、次にリレーショナルモデル。レコードが大きいか構造化されていない場合には、キーバリューモデル。

## SiLK(System for Internet-Level Knowledge)
NetFlowデータの問い合わせや分析を行うためのツール群。処理はバイナリ表現で処理して、最後の最後でのみテキスト表現になる。

```
$ tar -zxvf SiLK-LBNL-05-nonscan.tar.gz
$ tar -zxvf SiLK-LBNL-05-scanners.tar.gz
$ cd SiLK-LBNL-05
$ ls in/2005/01/07/*.01
>>> in/2005/01/07/in-S0_20050107.01	in/2005/01/07/in-S1_20050107.01
```

### R言語の環境構築
 - R 言語
 https://cran.r-project.org/bin/macosx/
 - R Studio
 https://www.rstudio.com/products/rstudio/download/

![R Studio](./rstudio.png "R Studio")

#### 分析:統計的仮説検定
 - 統計的仮説検定：特定のデータセットから証拠に基づいてこの世の挙動に関する主張を評価する作業
 - 仮説検定では、帰無仮説の棄却に重点
 - 統計的検定では、帰無仮説の主張に重点（基本としてデータセット内の変数に関連性はない）
 
## Reference

#### Network Security Through Data Analysis
http://shop.oreilly.com/product/0636920028444.do

#### SiLK(System for Internet-Level Knowledge)
https://tools.netsa.cert.org/silk/license.html
