# win , lose は別のメソッドでも使うのでグローバル変数にした
@win = 0
@lose = 0

puts "何本勝負?(press 1 or 3 or 5)"

def game_count
    @match = gets.to_i
    if @match == 1
        puts "#{@match}勝負選びました"
    elsif @match == 3
        puts "#{@match}勝負選びました"
    elsif @match == 5
        puts "#{@match}勝負選びました"
    else
        p "もう一度入力してください"
        game_count
    end
end

def janken
    cpu = ['g', 'c', 'p'].sample
    you = gets.chomp

    p "cpu...#{cpu}"
    p "you...#{you}"

    if you == "g"
        if cpu == "g"
            p "あいこで...(press g or c or p)"
            janken
        elsif cpu == "c"
            p "勝ち!"
            @win += 1
        elsif cpu == "p"
            p "負け!"
            @lose += 1
        end

    elsif you == "c"

        if cpu == "g"
            p "負け!"
            @lose += 1
        elsif cpu == "c"
            p "あいこで...(press g or c or p)"
            janken
        elsif cpu == "p"
            p "勝ち!"
            @win += 1
        end
        
    elsif you == "p"

        if cpu == "g"
            p "勝ち!"
            @win += 1
        elsif cpu == "c"
            p "負け!"
            @lose += 1
        elsif cpu == "p"
            p "あいこで...(press g or c or p)"
            janken
        end

    else
        p "もう一度入力してください"
        janken
    end
end


def judge
    if @win > @lose
        p "#{@win}勝#{@lose}敗であなたの勝ち"
    elsif @win == @lose
        p "#{@win}勝#{@lose}敗で引き分け"
    else
        p "#{@win}勝#{@lose}敗であなたの負け"
    end
end

game_count

i = 0
while i < @match do 
    p "#{i+1}本目"
    p "じゃんけん(press g or c or p)"
    janken
    i += 1
end

judge


# 発生したエラー:
# undefined local variable or method `janken' for main:Object (NameError)
# undefined local variable or method `judge' for main:Object (NameError)
# メソッドを呼び出す前に、メソッドを書く必要がある

#  undefined local variable or method `win' for main:Object (NameError)
# winをグローバル変数にした

# "you...g\n"になる。
# gets.chompで末尾に挿入された改行コードを取り除く

        