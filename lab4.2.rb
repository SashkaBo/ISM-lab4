require 'pry'

def main(h)
  #Решение системы
  x = 0.0

  #Исходная матрица
  a = [[-0.2, -0.1, 0.3],
       [0.3, 0.1, 0.2],
       [-0.4, -0.5, 0.0]]
  #Правая часть системы
  f = [2.0, 3.0, 3.0]


  #Вектор нач. вероятностей цепи Маркова
  pi = [0.33333, 0.33333, 0.33334]
  #Матрица переходных состояний цепи Маркова
  p = [[0.33333, 0.33333, 0.33334],
       [0.33333, 0.33333, 0.33334],
       [0.33333, 0.33333, 0.33334]]

  #Длина цепи Маркова
  n1 = 1000
  #Количество реализаций цепи Маркова
  m = 10000
  #Цепь Маркова
  i = []
  #Веса состояний цепи Маркова
  q = []
  #Количество реализаций цепи Маркова
  m = 10000

  #СВ
  ksi = [] #matrix
  m.times {|k| ksi[k] = 0.0}
  #БСВ
  alpha = 0.0

  # моделирование m цепей Маркова длины n1
  m.times do |j|
    (n1+1).times do |k|
      alpha = rand
      if alpha < pi[0]
        i[k] = 0
      elsif alpha < (pi[0]+pi[1])
        i[k] = 1
      else
        i[k] = 2
      end
    end

    # вычисляем веса цепи маркова
    if pi[i[0]] > 0
      q[0] = h[i[0]].to_f / pi[i[0]].to_f
    else
      q[0] = 0.0
    end

    n1.times do |k|
      if p[i[k]][i[k+1]] > 0
        q[k+1] = q[k].to_f * a[i[k]][i[k+1]].to_f / p[i[k]][i[k+1]].to_f
      else
        q[k+1] = 0.0
      end
    end

    (n1+1).times {|k| ksi[j] += q[k].to_f * f[i[k]].to_f}
  end

  m.times { |k| x += ksi[k] }
  x = x / m.to_f
end


@h1 = [1.0, 0.0, 0.0]
@h2 = [0.0, 1.0, 0.0]
@h3 = [0.0, 0.0, 1.0]
puts "x = #{main(@h1)} "
puts "y = #{main(@h2)} "
puts "z = #{main(@h3)} "
