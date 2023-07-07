def janken
    puts "0: グー, 1: チョキ, 2: パー 3:終了 を選択してください"
    puts "じゃんけん......"
    # プレイヤーの手を数値で取得
    player_hand = gets.chomp.to_i
    #0~3以外の番号入力した場合
    if player_hand < 0 || player_hand > 3
        puts "無効な手です。最初に戻ります。"
        exit #終了させる
    elsif  
    #3の場合はゲーム終了
        player_hand == 3
        puts "ゲームを終了します。"
        exit
    end

    #0: グー, 1: チョキ, 2: パーの設定
    hands = ["グー","チョキ","パー"]
    # sampleメソッドで変数をランダムに出力
    computer_hand = hands.sample
    
    #手の展開
    puts "あなた：#{hands[player_hand]}!!!" #hands[0]の形に
    puts "コンピュータ:#{computer_hand}!!!"

    #じゃんけんに勝った場合
    if 
        player_hand == 0 && computer_hand == "チョキ" ||
        player_hand == 1 && computer_hand == "パー" ||
        player_hand == 2 && computer_hand == "グー" 
        puts "あなたの勝ちです。あっち向いてホイに進みます。"
        # 因数呼び出し
        attimuitehoi_win
    end
    #じゃんけんに引き分けた場合
    if 
        player_hand == 0 && computer_hand == "グー" ||
        player_hand == 1 && computer_hand == "チョキ" ||
        player_hand == 2 && computer_hand == "パー"
        puts "あいこです。じゃんけんを再開します。"
        # 因数呼び出し
        janken
    end
    #じゃんけんに負けた場合
    if 
        player_hand == 0 && computer_hand == "パー" ||
        player_hand == 1 && computer_hand == "グー" ||
        player_hand == 2 && computer_hand == "チョキ" 
        puts "あなたの負けです。あっち向いてホイに進みます。"
        #因数呼び出し
        attimuitehoi_lose
    end
end



# じゃんけんに買った場合
def attimuitehoi_win
    puts "あっち向いてホイを開始します。"
    puts "0:上,1:右,2:下,3:左 を選択してください。"
    # プレーヤーの手を数値で取得
    player_direction = gets.chomp.to_i
    
    #0-3以外の選択時
    if player_direction < 0 || player_direction > 3
        puts "無効な手です。あっち向いてホイに戻ります。"
        attimuitehoi_win
    end

    #0:上 1:右 2:下 3:左の設定
    directions = ["上","右","下","左"]
    # sampleメソッドで変数をランダムに出力
    computer_direction = directions.sample

    # 展開
    puts "あなた：#{directions[player_direction]}!!!"
    puts "コンピュータ:#{computer_direction}!!!"

    # 同じなら勝利、それ以外ならじゃんけんへ
    if 
        player_direction == 0 && computer_direction == "上" ||
        player_direction == 1 && computer_direction == "右" ||
        player_direction == 2 && computer_direction == "下" ||
        player_direction == 3 && computer_direction == "左"
        puts "あなたの勝ちです。"
    else
        puts "じゃんけんに戻ります。"
        janken
    end
end

#じゃんけんに負けた場合
def attimuitehoi_lose
        puts "あっち向いてホイを開始します。"
        puts "0:上,1:右,2:下,3:左 を選択してください。"
        player_direction = gets.chomp.to_i
        
        #0-3以外の選択時
        if player_direction < 0 || player_direction > 3
            puts "無効な手です。最初に戻ります。"
            attimuitehoi_lose
        end
    
        #設定
        directions = ["上","右","下","左"]
        computer_direction = directions.sample
    
        #展開
        puts "あなた：#{directions[player_direction]}!!!"
        puts "コンピュータ:#{computer_direction}!!!"

        # 同じなら負け、それ以外ならじゃんけんへ
        if 
            player_direction == 0 && computer_direction == "上" ||
            player_direction == 1 && computer_direction == "右" ||
            player_direction == 2 && computer_direction == "下" ||
            player_direction == 3 && computer_direction == "左"
            puts "あなたの負けです。"
        else
            puts "じゃんけんに戻ります。"
            janken
        end
end

#ゲームの開始
janken