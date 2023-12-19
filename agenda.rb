@agenda = [
    {nome: "Eduarda", numeroTelefone: "123456789"},
    {nome: "Camilo", numeroTelefone: "678912345"}
]

def todos_contatos
    @agenda.each do |contato|
        puts "#{contato[:nome]} - #{contato[:numeroTelefone]}"
    end
    puts "-----------------------------------------"
end

def adicionar_contato
    print "Nome: "
    nome = gets.chomp
    print "Número de Telefone: "
    numeroTelefone = gets.chomp

    @agenda << {nome: nome, numeroTelefone: numeroTelefone}
    puts "----------------------------------------------"
    puts "Seu contato foi adicionado à lista de contatos"
end

def ver_contato
    print "Qual contato você deseja ver? "
    nome = gets.chomp

    @agenda.each do |contato|
        if contato[:nome].downcase.include?(nome.downcase)
            puts "-----------------------------------------"
            puts "#{contato[:nome]} - #{contato[:numeroTelefone]}"
            puts "-----------------------------------------"
            break
        end
    end
    puts "----------------------"
end

def editar_contato
    print "Qual nome você deseja editar? "
    nome = gets.chomp

    @agenda.each do |contato|
        if contato[:nome].downcase.include?(nome.downcase)
            print "Novo nome (Se quiser manter o mesmo nome, pressione Enter): "
            nome_salvo = contato[:nome]

            contato[:nome] = gets.chomp
            contato[:nome] = contato[:nome].empty? ? nome_salvo : contato[:nome]

            print "Novo número de telefone (Para manter o mesmo número de telefone, pressione Enter): "
            numero_salvo = contato[:numeroTelefone]

            contato[:numeroTelefone] = gets.chomp
            contato[:numeroTelefone] = contato[:numeroTelefone].empty? ? numero_salvo : contato[:numeroTelefone]
            break
        end
    end
end

def remover_contato
    print "Qual nome você deseja remover? "
    nome = gets.chomp

    @agenda.each do |contato|
        if contato[:nome].downcase.include?(nome.downcase)
            index = @agenda.index(contato)
            @agenda.delete_at(index)
            break
        end
    end
end

loop do
    puts " 1. Contatos\n 2. Adicionar Contato\n 3. Ver Contato\n 4. Editar Contato\n 5. Remover Contato\n 0. Sair\n"
    codigo = gets.chomp.to_i

    case codigo
    when 0
        puts "Agenda fechada"
        break
    when 1
        todos_contatos
    when 2
        adicionar_contato
    when 3
        ver_contato
    when 4
        editar_contato
    when 5
        remover_contato
    else
        puts "Esta não é uma opção válida, por favor, insira uma opção válida"
    end
end
