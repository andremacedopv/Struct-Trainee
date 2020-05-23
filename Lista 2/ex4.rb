# Lista POO - Exercício 4

class Turma

    @@qntd_total_alunos = 0
    @@alunos_aprovados_total = 0

    def initialize()
        # Gerar lista de alunos
        @alunos = gerarAlunos
        @alunos_aprovados = 0

        # Pegar total de alunos
        @qntd_alunos = @alunos.count
        @@qntd_total_alunos += @qntd_alunos

        # Pegar matéria para turma
        lista_materias = [
            "Cálculo 1",
            "Cálculo 2",
            "Cálculo 3",
            "Física 1",
            "Física 2",
            "Estrutura de Dados",
            "Algoritmos e Programação de Computadores",
            "Técnicas de Programação 1",
            "Sistemas Digitais",
            "Eletromagnetismo"
        ]
        @materia = lista_materias.sample
    end

    attr_reader :alunos, :qntd_alunos, :materia

    def self.totalAlunos()
        return @@qntd_total_alunos
    end

    def self.totalAlunosAprovados()
        return @@alunos_aprovados_total
    end

    def verificarAprovados()
        # Definir menções validas
        mencoes_aprovadas = ["MM", "MS", "SS"]

        @alunos.each do |aluno|
            if mencoes_aprovadas.include?(aluno[:mencao])
                @alunos_aprovados += 1
            end
        end

        @@alunos_aprovados_total += @alunos_aprovados

        return @alunos_aprovados
    end

    private

    # Método para gerar um número de matrícula aleatório para um aluno
    def gerarMatricula()
        # Criar array de 0 a 9
        numeros = [*"0".."9"]

        # Pegar o ano da matricula
        ano = rand(10..20).to_s
        matricula = ano + "\\"

        # Gerar restante da matricula
        7.times { matricula += numeros.sample }
        return matricula
    end

    # Método para gerar menção
    def gerarMencao()
        # Definir menções possíveis
        mencoes_validas = ["SR", "II", "MI", "MM", "MS", "SS"]

        return mencoes_validas.sample
    end

    # Método para gerar array de alunos
    def gerarAlunos()
        qntd = rand(5..20)
        alunos = []
        qntd.times { alunos << {:matricula => gerarMatricula, :mencao => gerarMencao } }
        return alunos
    end

end

# Ler o número de turmas
n_turmas = 0
while n_turmas < 1 || n_turmas > 10
    puts "Insira o número de turmas a serem criadas, de 1 a 10:"
    n_turmas = gets.to_i
end

# Gerar turmas e verificar aprovações
turmas = []
n_turmas.times do |i|
    turmas << Turma.new
    aprovados = turmas[i].verificarAprovados
    puts "Turma #{i+1}:"
    puts "Matéria - #{turmas[i].materia}"
    puts "Quantidade de Alunos - #{turmas[i].qntd_alunos} alunos"
    puts "Quantidade de Aprovados - #{aprovados}"
    puts "Percentual de Aprovados - #{((aprovados.to_f)/turmas[i].qntd_alunos * 100).round(2)}%"
    puts "--------------------------------------------"
end

# Verificar qntd total de aprovados
puts "Quantidade Total de Alunos - #{Turma.totalAlunos} alunos"
puts "Quantidade Total de Aprovados - #{Turma.totalAlunosAprovados} aprovados"
puts "Percentual de Aprovação Total - #{(Turma.totalAlunosAprovados.to_f/Turma.totalAlunos * 100).round(2)}%"