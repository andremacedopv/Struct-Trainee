# Lista POO - Exercício 3

# Observação:
# Foi optado por criar uma classe geral de conta, Account,
# que herda de pessoa e é heradada pelas classes de conta
# corrente e conta poupança.

class Person

    def initialize(name, cpf, phone, age)
        @name = name
        @cpf = cpf
        @phone = phone
        @age = age
    end

    attr_reader :name

    def modifyPhone(new_phone)
        @phone = new_phone
        return {new_phone: @phone}
    end

    def showPersonalData
        puts "-------Dados Pessoais-------"
        puts "Nome: #{@name}"
        puts "CPF: #{@cpf}"
        puts "Telefone: #{@phone}"
        puts "Idade: #{@age}"
        puts "----------------------------"
    end

end

class Account < Person

    def initialize(name, cpf, phone, age, password)
        super(name, cpf, phone, age)
        @password = password
        @balance = 0
    end

    attr_reader :account_number

    def depositMoney(value)
        @balance += value
        return {new_balance: @balance}
    end

    def takeMoney(value)
        @balance -= value
        return {new_balance: @balance, value_taken: value}
    end

    def showBalance
        puts "O saldo da conta é R$#{@balance}"
    end
        
    def showAccountData
        puts "-------Dados da Conta-------"
        puts "Número da Conta: #{@account_number}"
        puts "Senha: #{@password}"
        puts "----------------------------"
    end

    # Funcão para executar menu com opções da conta
    def startAccountMenu
        exit = false
        while exit == false
            # Imprimir menu de opções
            puts "Digite sua opção:"
            puts "1. Depositar"
            puts "2. Sacar"
            puts "3. Exibir saldo"
            puts "4. Modificar telefone"
            puts "5. Exibir dados pessoais"
            puts "6. Exibir dados da conta"
            puts "7. Sair"
            
            # Ler e executar opção desejada
            option = gets.to_i
            print "\n"
            case option

            # Depositar
            when 1
                puts "Digite um valor para depositar:"
                value = gets.to_f
                puts self.depositMoney(value)

            # Sacar
            when 2
                puts "Digite um valor para sacar:"
                value = gets.to_f
                puts self.takeMoney(value)

            # Exibir saldo
            when 3
                self.showBalance

            # Modificar telefone
            when 4
                puts "Digite o novo telefone:"
                value = gets.chomp
                puts self.modifyPhone(value)

            # Exibir dados pessoais
            when 5
                self.showPersonalData

            # Exibir dados da conta
            when 6
                self.showAccountData

            # Sair
            when 7
                puts "Obrigado por usar o sistema!"
                exit = true

            # Caso inválido
            else
                puts "Digite um número válido"
            end

            puts "----------------------------"
        end
    end

    private

    # Método para gerar um número de conta aleatório, dado um número de dígitos
    def generateAccountNumber(digits_number)
        # Criar array de 0 a 9
        numeros = [*"0".."9"]

        # Gerar número
        matricula = ""
        digits_number.times { matricula += numeros.sample }

        # Adicionar caractere separador do número verificador ('-')
        return matricula.insert(digits_number-1, "-")
        
    end

end

class CurrentAccount < Account

    @@accounts_list = []

    def initialize(name, cpf, phone, age, password)
        super(name, cpf, phone, age, password)
        @account_number = generateAccountNumber(8)
        @@accounts_list << self
    end

    def self.list_accounts
        @@accounts_list
    end

end

class SavingsAccount < Account

    @@accounts_list = []

    def initialize(name, cpf, phone, age, password)
        super(name, cpf, phone, age, password)
        @account_number = generateAccountNumber(9)
        @@accounts_list << self
    end

    def self.list_accounts
        @@accounts_list
    end

    # Substituir função de retirar dinheiro da classe herdada
    def takeMoney(value)
        if value > @balance
            value = @balance
        end
        @balance -= value
        return {new_balance: @balance, value_taken: value}
    end

end

# Funcão para executar menu com opções de gerenciamento de contas
def startAccountManagerMenu
    exit = false
    while exit == false
        # Imprimir menu de opções
        puts "Digite sua opção:"
        puts "1. Listar contas corrente"
        puts "2. Listar contas poupança"
        puts "3. Criar conta corrente"
        puts "4. Criar conta poupança"
        puts "5. Acessar conta"
        puts "6. Sair"
        
        # Ler e executar opção desejada
        option = gets.to_i
        print "\n"
        case option

        # Listar contas corrente
        when 1
            if CurrentAccount.list_accounts == []
                puts "Não há contas corrente disponíveis"
            else
                puts "Contas corrente disponíveis:"
                CurrentAccount.list_accounts.each do |account|
                    puts "- Nome: #{account.name}, Número da Conta: #{account.account_number}"
                end
            end

        # Listar contas poupança
        when 2
            if SavingsAccount.list_accounts == []
                puts "Não há contas poupança disponíveis"
            else
                puts "Contas poupança disponíveis:"
                SavingsAccount.list_accounts.each do |account|
                    puts "- Nome: #{account.name}, Número da Conta: #{account.account_number}"
                end
            end

        # Criar conta corrente    
        when 3
            # Obter informações para criação da conta
            puts "Digite o nome:"
            name = gets.chomp
            puts "Digite o CPF:"
            cpf = gets.chomp
            puts "Digite o telefone:"
            phone = gets.chomp
            puts "Digite a idade:"
            age = gets.to_i
            puts "Digite a senha:"
            password = gets.chomp
            # Criar conta
            CurrentAccount.new(name, cpf, phone, age, password)
            puts "Conta corrente criada!"

        # Criar conta poupança
        when 4
            # Obter informações para criação da conta
            puts "Digite o nome:"
            name = gets.chomp
            puts "Digite o CPF:"
            cpf = gets.chomp
            puts "Digite o telefone:"
            phone = gets.chomp
            puts "Digite a idade:"
            age = gets.to_i
            puts "Digite a senha:"
            password = gets.chomp
            # Criar conta
            SavingsAccount.new(name, cpf, phone, age, password)
            puts "Conta poupança criada!"

        # Acessar conta
        when 5
            index = 0 # Index para saber qual conta selecionar
            accounts_list = [] # Array com todas a contas relacionado ao index

            if SavingsAccount.list_accounts == [] && CurrentAccount.list_accounts == []
                puts "Não há contas disponíveis"
            else
                puts "Contas disponíveis:"
                # Listagem das contas correntes disponíveis
                if CurrentAccount.list_accounts != []
                    CurrentAccount.list_accounts.each do |account|
                        accounts_list << account
                        puts "#{index}. Conta Corrente: Nome - #{account.name}, Número da Conta - #{account.account_number}"
                        index += 1
                    end
                end

                # Listagem das contas poupança disponíveis
                if SavingsAccount.list_accounts != []
                    SavingsAccount.list_accounts.each do |account|
                        accounts_list << account
                        puts "#{index}. Conta Poupança: Nome - #{account.name}, Número da Conta - #{account.account_number}"
                        index += 1
                    end
                end

                # Selecionar a conta de acordo com o index disponível
                option = -1
                while option < 0 || option >= index
                    puts "Selecione a conta a ser acessada:"
                    option = gets.to_i
                end
                accounts_list[option].startAccountMenu
            end

        # Sair
        when 6
            puts "Obrigado por usar o sistema!"
            exit = true

        # Caso Inválido
        else
            puts "Digite um número válido"
        end

        puts "----------------------------"
    end
end

# Acessar sistema
startAccountManagerMenu