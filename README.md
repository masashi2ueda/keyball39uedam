# keyball39uedam

# 準備
1. git clone --recursive https://github.com/masashi2ueda/keyball39uedam.git
1. [こちら](https://www.thingiverse.com/thing:3131126#google_vignette)をリポジトリのホームに置くgi


# 利用方法
## ファーム
1. [こちら](https://sekigon-gonnoc.github.io/promicro-web-updater/index.html)を開く
1. 「ファイルを選択」を押して、[./results/keyball_keyball39_myvia.hex](./results/keyball_keyball39_myvia.hex)を選択
1. 「flash」を押して、keyballのリセットボタンを二回押すと、候補にでるので、選択

## ケースの作成
*[bambulab p1s](https://jp.store.bambulab.com/products/p1s?gad_source=1&gclid=CjwKCAjw1NK4BhAwEiwAVUHPUIpf5Ls_KnHSjKl2rj6zLr3eTgKgz7EQLOlgLGGXZAqSBZOodKARWBoCR-4QAvD_BwE)でテストをしています

*以降[results](./results/)の中のstlを下記の個数印刷

1. case_left、case_rightをひとつずつ印刷
1. armrest×2、armrest_parts×4を印刷
1. armrestを左右のケースに装着、入れた穴をarmrest_partsで閉じる
1. foot×4、nuts×4、screw×4を印刷
1. 上記を左右のcaseに装着(footはギザギザをケースの方にむける)

## キーキャップの作成
1. keycap0×10、keycap1×8、keycap1_bar×2、keycap2×10、keycap3×4を印刷
1. キーボードの上から番号順に（一番上の列が0）装着（ホームポジションにはkeycap1_barを配置する）

# 参考+利用しているもの
- [OpenScad library. Threads for screws and nuts V1](https://www.thingiverse.com/thing:3131126#google_vignette)
- [keyball](https://github.com/Yowkees/keyball)
- [キーキャップ設計による OpenSCAD 入門](https://qiita.com/zk_phi/items/ab99315ebaef66e84aa0)

