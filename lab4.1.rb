require 'pry'

def odnomernNormRaspredelenie(m, d)
  sv = standartNormRaspredelenie
  ksi = d * sv + m
end

def standartNormRaspredelenie
  n = 12
  sv = 0.0
  n.times { sv += rand }
  sv -= 6.0
end

def raspredelenieKoshi(m, c)
  ksi = m + c * Math.tan(Math::PI * (rand - 0.5))   # ????
end

def integrant(x, y) #подынтегральная функция, деленая на плотность XY
  (Math::PI ** (3/2)) * (2 / 3**(1/2)) * Math.sin(x - y)
end

def main(n)
  x = []
  y = []

  n.times do
    x << odnomernNormRaspredelenie(0, 1 / 2**(1/2))
    y << raspredelenieKoshi(-1/2, 3**(1/2) / 2)
  end

  sum = 0.0
  n.times { |i| sum += integrant(x[i], y[i]) }
  sum /= n.to_f
end

n = 1000
result = main(n)
puts "#{n}: значение интеграла #{result}"
