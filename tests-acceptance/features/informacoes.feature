Feature: Listar informações sobre o desempenho dos alunos em diferentes disciplinas
    
    As a professor de uma disciplina
    I want to visualizar informações sobre o desempenho dos alunos em diferentes disciplinas
    So that eu possa identificar alunos com dificuldades e apoiá-los adequadamente


    Scenario: Visualizar relatório do desempenho de um aluno com aprovações

        Given que estou logado como "Professor" na disciplina "ESS"
        And estou na página "Alunos"
        When eu seleciono "Visualizar desempenho" ao lado do aluno "Cleber Lucas"
        Then eu vejo uma lista contendo as disciplinas do aluno "Cleber Lucas" 
        And eu vejo o status "aprovado" ao lado de cada disciplina


    Scenario: Visualizar relatório do desempenho de um aluno com aprovações e reprovações

        Given que estou logado como "Professor" na disciplina "ESS"
        And estou na página "Alunos"
        When eu seleciono "Visualizar desempenho" ao lado do aluno "Mauricio Andrey"
        Then eu vejo uma lista contendo as disciplinas do aluno "Mauricio Andrey"
        And eu vejo o status "aprovado" ao lado das disciplinas aprovadas
        And eu vejo o status "reprovado" ao lado das disciplinas reprovadas


    Scenario: Acessar relatório de desempenho indisponível

        Given que estou logado como "Professor" na disciplina "ESS"
        And estou na página "Alunos"
        When eu seleciono "Visualizar desempenho" ao lado do aluno "Cleber Lucas"
        And o sistema não encontra o relatório de desempenho do aluno
        Then eu vejo uma mensagem informando que o relatório de desempenho está indisponível para o aluno "Cleber Lucas"
        And não deve ser exibida nenhuma lista de disciplinas
        And eu permaneço na página "Alunos"
    

    Scenario: Falha ao carregar relatório de desempenho devido a erro no servidor

        Given que estou logado como "Professor" na disciplina "ESS"
        And estou na página "Alunos"
        When eu seleciono "Visualizar desempenho" ao lado do aluno "Mauricio Andrey"
        And o servidor retorna um erro interno
        Then eu vejo uma mensagem informando que não foi possível carregar as informações de desempenho do aluno "Mauricio Andrey"
        And nenhuma informação de disciplinas deve ser exibida
        And eu permaneço na página "Alunos"
        And eu estou logado como "Professor" na disciplina "ESS"

    Scenario: Tempo de resposta adequado ao carregar relatório de desempenho

        Given que estou logado como "Professor" na disciplina "ESS"
        And estou na página "Alunos"
        When eu seleciono "Visualizar desempenho" ao lado do aluno "Cleber Lucas"
        Then o relatório de desempenho do aluno "Cleber Lucas" deve ser carregado em menos de "2" segundos
        And eu devo ver a lista de disciplinas do aluno