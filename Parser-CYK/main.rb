require_relative 'cyk'
require_relative 'gramatica'

regras = [

  #numeros
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

  #operacoes
  Regra.new('MAIS',  %w[+]),
  Regra.new('MENOS',  %w[-]),
  Regra.new('VEZES',  %w[*]),
  Regra.new('DIVISAO',  %w[/]),
  Regra.new('ELEVADO',  %w[^]),
  Regra.new('CONTAMAIS', %w[MAIS S]),
  Regra.new('CONTAMENOS', %w[MENOS S]),
  Regra.new('CONTAVEZES', %w[VEZES S]),
  Regra.new('CONTADIVISAO', %w[DIVISAO S]),
  Regra.new('CONTAELEVADO', %w[ELEVADO S]),

  #parenteses
  Regra.new('IPARENTESES',  %w[(]),
  Regra.new('FPARENTESES',  %w[)]),
  Regra.new('PARENTESES',   %w[S FPARENTESES]),
  Regra.new('PARENTESES',   %w[S OPARENTESES]),
  Regra.new('OPARENTESES',  %w[FPARENTESES CONTAMAIS]),
  Regra.new('OPARENTESES',  %w[FPARENTESES CONTAMENOS]),
  Regra.new('OPARENTESES',  %w[FPARENTESES CONTADIVISAO]),
  Regra.new('OPARENTESES',  %w[FPARENTESES CONTAVEZES]),
  Regra.new('OPARENTESES',  %w[FPARENTESES CONTAELEVADO]),

  #S
  Regra.new('S',   %w[N CONTAMAIS]),
  Regra.new('S',   %w[N CONTAMENOS]),
  Regra.new('S',   %w[N CONTADIVISAO]),
  Regra.new('S',   %w[N CONTADIVISAO]),
  Regra.new('S',   %w[N CONTAELEVADO]),
  Regra.new('S',   %w[IPARENTESES PARENTESES]),
  Regra.new('S',   %w[MENOS S]),
  Regra.new('S',   %w[0]),
  Regra.new('S',   %w[1]),
  Regra.new('S',   %w[2]),
  Regra.new('S',   %w[3]),
  Regra.new('S',   %w[4]),
  Regra.new('S',   %w[5]),
  Regra.new('S',   %w[6]),
  Regra.new('S',   %w[7]),
  Regra.new('S',   %w[8]),
  Regra.new('S',   %w[9]),
]


gramatica = Gramatica.new(regras, 'S')
parser = CYKParser.new(gramatica)

entrada = '7/(1-3)'
puts entrada
parser.parse(entrada).inspect
puts parser.aceito? ? 'Aceito' : 'Não aceito'
puts "\n"

entrada = '2+4^-4/4'
puts entrada
parser.parse(entrada).inspect
puts parser.aceito? ? 'Aceito' : 'Não aceito'
puts "\n"

entrada = '(1+4)*2^2'
puts entrada
parser.parse(entrada).inspect
puts parser.aceito? ? 'Aceito' : 'Não aceito'
puts "\n"

entrada = '(1+4)*2^2'
puts entrada
parser.parse(entrada).inspect
puts parser.aceito? ? 'Aceito' : 'Não aceito'
puts "\n"

entrada = '^2+4'
puts entrada
parser.parse(entrada).inspect
puts parser.aceito? ? 'Aceito' : 'Não aceito'
puts "\n"

entrada = '9*2+'
puts entrada
parser.parse(entrada).inspect
puts parser.aceito? ? 'Aceito' : 'Não aceito'
puts "\n"

entrada = '9++3'
puts entrada
parser.parse(entrada).inspect
puts parser.aceito? ? 'Aceito' : 'Não aceito'
puts "\n"

entrada = '()*3'
puts entrada
parser.parse(entrada).inspect
puts parser.aceito? ? 'Aceito' : 'Não aceito'
puts "\n"

entrada = '(3+3'
puts entrada
parser.parse(entrada).inspect
puts parser.aceito? ? 'Aceito' : 'Não aceito'
