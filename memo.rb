# CSVファイルを扱うためのライブラリを読み込み
require "csv"  

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

# ユーザーの入力値を取得し、数字へ変換
memo_type = gets.to_i 
# テキストを入れる箱
memos = []
# memos.csvが存在するなら参照してカウントアップする
count = File.exist?('memos.csv') ? CSV.read('memos.csv').length : 0

# memo_type」の値（1 or 2）によって処理を分岐
# 新規メモ作成
if memo_type == 1
    #メモ作成
    def make_memo(count)
        puts"新規メモ作成"
        #タイトル入力
        puts"タイトルを入力してください"
        title = gets.chomp
        #テキスト入力
        puts"本文を入力してください"
        text = STDIN.read
        #
        count += 1
        #配列取得
        [count,title,text]
    end
    # title,textをmemoに取得
    memo = make_memo(count)
    # 新規メモ追加
    memos.push(memo)
    # CSVファイル作成 今回は新規メモを追加していくため"a"を設定
    CSV.open('memos.csv','a') do |csv|
        csv << memo
    end

    

# 編集
elsif memo_type == 2
    # データ取得
    def director(id)
        data = CSV.read("memos.csv")
        memo = data.find { |row| row[0].to_i == id } # IDに対応する行を検索する
        memo
    end
    puts "編集したいメモのID番号を入力してください"
    id = gets.chomp.to_i
    memo = director(id)
    p memo

    # データ記入
    puts"タイトルを入力してください"
    title = gets.chomp
    puts"本文を入力してください"
    text = STDIN.read
    
    # CSVデータをハッシュ形式で読み込む
    data = CSV.read("memos.csv", headers: true)
    data[id - 1]['title'] << title
    data[id - 1]['text'] << text
    
    # CSVに編集データの挿入
    # openにはデータ上書きのため"w"を設定
    CSV.open("memos.csv", "w") do |csv|
        csv << data.headers
        data.each do |row|
        csv << row
        end
    end

else
    puts"1または2を入力してください"
end


