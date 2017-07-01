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
      
    - イーサネットヘッダで最も重要な領域は、送信元と送信先との2つのMACアドレス
    
    ```
    tcpdump -i eth0 -s 0 -w result '((src port 80 || src port 443))' && (src net <ip_address>)
    ```
    
    - NetFlow
      ネットワークトラフィックセッションを要約するツール
    
 - ホスト型
 - サービス型

##### アクション（センサーによるデータの処理）

 - レポート生成型
 - イベント通知型
 - 自動防御型
 
## Reference

#### Network Security Through Data Analysis
http://shop.oreilly.com/product/0636920028444.do

