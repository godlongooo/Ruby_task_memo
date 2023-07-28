require "csv"  

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
memo_type = gets.to_i

# 新規メモ作成
if memo_type == 1

    puts "新規でメモを作成します。拡張子を除いたファイル名を入力してください。(キャンセルする場合はendと入力してください)"
    file_name = gets.chomp
    # 入力キャンセル
    if file_name == "end"
        puts "入力をキャンセルし、プログラムを終了します。"
        exit
    end
    puts"メモの内容を記入して下さい。「Ctrl+D（あるいはCTRL+Z）」で保存します。"
    text= STDIN.read

    CSV.open("#{file_name}.csv" , "w") do |csv|  
    csv.puts ["#{text}"]
    end

# メモ編集
elsif memo_type == 2

    puts "既存のメモを編集します。拡張子を除いた既存ファイル名を入力してください。"
    file_name = gets.chomp
    # existでファイルが存在するか確認
    if File.exist?("#{file_name}.csv")
    # ファイルがあれば読み込みして表示
    puts "既存のテキスト内容"
    puts CSV.read("#{file_name}.csv")
    else
    # ファイルがなければプログラムを終了
    puts "ファイルが存在しないため、プログラムを終了します。"
    exit
    end
    
    # 上書きしたcsvファイル作成
    puts"編集内容を記入して下さい。(既存のテキストは削除されます)「Ctrl+D（あるいはCTRL+Z）」で上書き保存します。"
    text = STDIN.read
    CSV.open("#{file_name}.csv" , "w") do |csv|
        csv.puts ["#{text}"]
    end

# 1,2以外が選択されたとき
else
    puts "指定外の情報が入力されたためプログラムを終了します。1か2の数字を入力してください。"
end


