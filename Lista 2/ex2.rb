# Lista POO - Exercício 2

class Account

    def initialize(name, cpf, phone, age, password)
        @name = name
        @cpf = cpf
        @phone = phone
        @age = age
        @password = password
        @balance = 0
        @account_number = generateAccountNumber
    end

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

    # Método para gerar um número de conta aleatório
    def generateAccountNumber
        # Criar array de 0 a 9
        numeros = [*"0".."9"]

        # Gerar número
        matricula = ""
        8.times { matricula += numeros.sample }

        # Adicionar caractere separador do número verificador ('-')
        return matricula.insert(7, "-")
        
    end

end

# Inicializar conta e abrir o menu de opções
account_1 = Account.new("Andre Macedo", "123.456.789-10", "99999-8888", 21, "senha123")
account_1.startAccountMenu