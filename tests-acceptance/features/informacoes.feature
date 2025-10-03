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
        And eu devo ver o status "aprovado" ao lado das disciplinas aprovadas
        And eu devo ver o status "reprovado" ao lado das disciplinas reprovadas