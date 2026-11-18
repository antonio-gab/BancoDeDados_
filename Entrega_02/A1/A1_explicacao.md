# A1 - Preparação e organização

## Tabelas
- **estudantes:** guarda os alunos cadastrados no sistema, com um id e o nome de cada um.
- **atividades:** guarda as oficinas da Semana de Tecnologia, com o nome e a quantidade de vagas (capacidade). A "Oficina de PostgreSQL" tem só 1 vaga, para os testes de disputa.
- **inscricoes:** liga um aluno a uma atividade, ou seja, registra quem se inscreveu em quê. Também guarda a situação da inscrição: ativa ou cancelada.

## Restrições
- **PRIMARY KEY:** cada registro tem um id único que nunca se repete e nunca fica vazio. Assim não existem dois alunos, duas atividades ou duas inscrições com o mesmo número, e dá pra identificar cada um sem confusão.
- **FOREIGN KEY:** liga a tabela de inscrições às tabelas de estudantes e de atividades. O banco só aceita inscrever um aluno e uma atividade que já existem, então não tem como criar uma inscrição "fantasma", de um aluno ou de uma oficina que não está cadastrada.
- **CHECK (capacidade > 0):** não deixa cadastrar uma atividade com 0 vagas ou com vagas negativas, porque uma oficina sem vaga nenhuma não faz sentido.
- **CHECK (situacao IN ('ativa', 'cancelada')):** a situação só aceita esses dois valores. Isso protege a contagem de vagas, que procura exatamente 'ativa'. Se alguém gravasse 'Ativa' ou 'ativo', a inscrição não seria contada e a atividade pareceria ter vaga sobrando.
- **NOT NULL:** campos obrigatórios, como o nome do aluno e a capacidade, não podem ficar vazios.