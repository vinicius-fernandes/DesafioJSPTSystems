# DesafioJSPTSystems

## Instruções

Toda a parte referente ao JSP está na pasta BLOG.

Os scripts para criação das tabelas e população dela estão na raiz do repositório.

Para alterar os dados de conexão ao banco é necessário o método conectar da classe Conexao com as credenciais do seu banco de dados, basta alterar a url, user e o password.

Os usuários criados inicialmente são:

Moderador:
Login: vinicius
Senha: 123abcd

Comum:
Login: ana
Senha: 123abcd

A sessão do usuário persiste enquanto o navegador estiver aberto e o programa sendo executado, utilizei nesse caso a própria session do JSP.

É possível ver todos os posts sem estar logado pelo index, basta navegar pelas páginas através dos botões do fim da página.

No menu superior é possível buscar uma postagem pelo seu título. 


## Descrição


Desenvolver um sistema de blog, as características para o desenvolvimento desse
projeto são:

  ● Na página inicial deverão ser listadas as dez últimas postagens registradas, exiba o
título, os primeiros quinze caracteres do texto principal da postagem e um botão
para ter acesso a postagem completa.

  ● Quando clicado para ver a postagem completa, deverá ser exibido o título e o texto
completo.

  ● Abaixo de cada postagem completa, poderá ser feito um comentário, porém para
que o comentário seja realizado, deverá ser implementado uma autenticação (login
e senha).

  ● Comentários realizados serão exibidos abaixo da postagem quando o moderador
aceitar determinado comentário.

  ● Postagens podem ser gerenciadas apenas por usuários do tipo moderador.
Implemente o uso de um CRUD (Cadastrar, Listar, Alterar e Remover).

  ● Implemente o uso de sessão para validar as páginas, como por exemplo: Se um
cliente estiver logado, poderá realizar comentários, caso contrário exiba um texto:
“para comentar é necessário efetuar o login, clique aqui”.
