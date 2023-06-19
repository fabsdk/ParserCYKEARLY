require_relative "earley"
require_relative "gramatica"

regras = [
  # numeros
  Regra.new('N',   %w[0]),
  Regra.new('N',   %w[1]),
  Regra.new('N',   %w[2]),
  Regra.new('N',   %w[3]),
  Regra.new('N',   %w[4]),
  Regra.new('N',   %w[5]),
  Regra.new('N',   %w[6]),
  Regra.new('N',   %w[7]),
  Regra.new('N',   %w[8]),
  Regra.new('N',   %w[9]),

  # operacoes
  Regra.new('SOMAMENOS',  %w[+]),
  Regra.new('SOMAMENOS',  %w[-]),
  Regra.new('MULTIDIVI',  %w[*]),
  Regra.new('MULTIDIVI',  %w[/]),
  Regra.new('EXPO',  %w[^]),
  Regra.new('NEG',  %w[-]),
  
  # soma e subtracao
  Regra.new('S', %w[S SOMAMENOS S]),
  Regra.new('S', %w[MD]),

  # multiplicacao e divisao
  Regra.new('MD', %w[MD MULTIDIVI MD]),
  Regra.new('MD', %w[E]),

  # exponente
  Regra.new('E', %w[E EXPO E]),
  Regra.new('E', %w[NEGACAO]),
  
  # negacao
  Regra.new('NEGACAO', %w[NEG NEGACAO]),
  Regra.new('NEGACAO', %w[PAREN]),
  
  # parenteses
  Regra.new('PAREN', %w[( S )]),
  Regra.new('PAREN', %w[N]),

]

gramatica = Gramatica.new(regras, "S")

parser = EarleyParser.new(gramatica)
input = '9^(1*-2+3)-3/(6+3)'
puts parser.parse(input) ? 'Aceito' : 'Rejeitado'
