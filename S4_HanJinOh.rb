$total = 0 #投入金額
$drink = Array.new() #ジュースの種類(array)
$saving = 0 #売上

class Drink
attr_reader :price, :name, :amount #getter method
attr_writer :amount #setter method

def initialize (price, name, amount)#construct
  @price = price
  @name = name
  @amount = amount
end
end

$drink.push(Drink.new(120,"コーラ",5))

def inputMoney() #お金を入れる
  puts("\nお金を入れてくだたい。（入力）")
  input = gets.chomp
  inputMoney = input.to_i
  case inputMoney
  when 10 then $total += inputMoney
  when 50 then $total += inputMoney
  when 100 then $total += inputMoney
  when 500 then $total += inputMoney
  when 1000 then $total += inputMoney
  else refund(inputMoney)#以外は払い戻し
  end
end

def refund(money) #moneyを払い戻し
puts("\n払い戻し " + money.to_s)
end

def ableDrink()　#購入可能飲料確認
for i in 0..$drink.length-1
  able = false
if ($total >= $drink[i].price) and ($drink[i].amount!=0)#お金、数量を確認
  able = true
end
sign = able ? ("可能") : ("不可")
puts($drink[i].price.to_s+ "¥ "+ $drink[i].name+ " " + sign)
end
puts("\n")
end

def purchase()#購入機能
getDrinkInfo()
puts("ジュースの番号を押してください。")
input = gets.chomp
i = input.to_i - 1

#存在する番号か、お金、数量を確認
if (i <= $drink.length) and ($total >= $drink[i].price) and ($drink[i].amount!= 0)
  $total -= $drink[i].price
  $saving += $drink[i].price
  $drink[i].amount -= 1
  puts("\n"+$drink[i].name+"が出ました。")
  refund($total)
  $total = 0
end#該当事項がないと、何もしない。
end

def juceManagerment()#ジュース管理
  puts("\nジュース管理.\n1.追加\n2.全部見る\n3.以前")
  puts("\n番号を入力してください。")
  input = gets.chomp
  case input.to_i
  when 1 then addDrink()
  when 2 then getDrinkInfo()
  when 3 then #以前
  end
end

def addDrink()#ジュースを追加
  puts("ジュースの値段を入力してください")
  price = gets.chomp
  puts("ジュースの名を入力してください")
  name = gets.chomp
  puts("ジュースの数を入力してください")
  amount = gets.chomp
  $drink.push(Drink.new(price.to_i, name, amount.to_i))#Listにジュースを追加
  puts("ジュース登録完了。")
end

def getDrinkInfo()#ジュースの情報を閲覧
puts("\n")
for i in 0..$drink.length-1
  #ジュースの番号、名、値段、量を出力
  puts((i+1).to_s+". "+$drink[i].price.to_s+"円 "+$drink[i].name+" "+$drink[i].amount.to_s+"缶")
end
puts("\n")
end

# <main>
while true do #interfaceを出力
  puts("自動販売機　System.\n1.金を入れる\n2.払い戻し\n3.購入\n4.ジュース管理")
  puts("\n番号を入力してください。")
  input = gets.chomp

  case input.to_i
  when 1 then inputMoney()
  when 2 then refund($total)
    $total = 0
  when 3 then purchase()
  when 4 then juceManagerment()
end
puts("---------------------------------------------------")
puts("\n 残高 : " + $total.to_s + "円\n\n")
ableDrink()#入可能ジュースを出力
puts("\n")
end
