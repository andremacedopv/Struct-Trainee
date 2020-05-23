# Lista POO - Exercício 1

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
        return @balance += value
    end

    def takeMoney(value)
        @balance -= value
        return {new_balance: @balance, value_taken: value}
    end

    def showBalance
        puts "O saldo da conta é R$#{@balance}"
    end

    def modifyPhone(new_phone)
        return @phone = new_phone
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

# Inicializar conta e mostrar dados
account_1 = Account.new("Andre Macedo", "123.456.789-10", "99999-8888", 21, "senha123")
account_1.showAccountData
account_1.showPersonalData

# Depositar dinheiro
puts "\nDepositando R$500.25:"
account_1.depositMoney(500.25)
account_1.showBalance

# Retirar dinheiro
puts "\nRetirando R$300.75:"
account_1.takeMoney(300.75)
account_1.showBalance

# Modificar telefone e reimprimir dados pessoais
puts "\nModificando telefone:"
account_1.modifyPhone("99999-9999")
account_1.showPersonalData