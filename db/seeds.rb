# Create admin user from environment variables (idempotent)
admin_email = ENV.fetch("ADMIN_EMAIL", "admin@pedro.blog")
admin_password = ENV.fetch("ADMIN_PASSWORD", "admin123")

admin = Admin.find_or_initialize_by(email: admin_email)
admin.password = admin_password
admin.password_confirmation = admin_password
admin.save!

puts "Admin created/updated: #{admin_email}"

# Seed blog posts (idempotent)
posts_data = [
  {
    slug: "primeiro-post",
    title: "Primeiro Post!",
    description: "Falando um pouco da experiência de criar um blog",
    published_at: Time.zone.parse("2021-03-22 12:00:25"),
    category: "dev",
    background_color: "#637a91",
    thumbnail_url: "https://images.unsplash.com/photo-1542831371-29b0f74f9713?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80",
    body: <<~MARKDOWN
      ![Html code block](https://images.unsplash.com/photo-1542831371-29b0f74f9713?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1350&q=80)

      Olá Jovem!\
      Seja bem-vinde ao meu humilde blog, não tem lá muita coisa ainda, mas com o tempo pretendo preencher esse pequeno site com bastante conhecimento, tanto o que ando aprendendo, quanto os que eu já sei.

      Estou fazendo como meu amigo [Willian Justen](https://willianjusten.com.br/), ele geralmente escreve os posts escutando alguma música, atualmente estou fazendo algumas descobertas relacionados a bandas, zapeando meu [Instagram](https://www.instagram.com/azevedodev/) eu encontrei uma banda muito boa chamada [Fire From The Gods](https://open.spotify.com/artist/6yeRY2d7gubXoymv3DAYhS?si=eTV3jt_5RWSMVN01bmVr7g), eles tem uma pegada meio hardcore metal fury com hip-hop, bem legal de se ouvir enquanto está trabalhando, ou até mesmo no tempo de boa.

      Agora vamos ao assunto principal, *por que eu tirei esse blog do fundo do baú?* A muito tempo eu comprei o curso do Will para aprender um pouco sobre Gatsby e Graphql e praticamente finalizei o curso, faltava poucas coisas a se fazer para por no ar, mas como toda pessoa desenvolvedora de respeito, acaba deixando o projeto de lado e segue fazendo outras milhares de coisas e nunca termina aquilo que começou.

      Esse final de semana, resolvi alguns pontos para minha carreira, como seguir somente uma frente, não ser um generalista JavaScript e sim um **Front-end Specialist**! Fica melhor para focar nos estudos, no momento eu tenho visto muito sobre testes unitários, usando praticamente tudo que tem no mercado para ver a diferença de um para o outro.

      Assim começou meu domingo, baixando o projeto, atualizando **TODOS** os pacotes, foi uma boa luta com os bugs e problemas que estavam aparecendo como aranhas que você não espera que ela pareça, mas no final consegui vencer e foi bem mais tranquilo do que eu imaginei que seria, muito obrigado Gatsby por não fazer muitas breaking changes.

      Depois de resolver tudo, veio a parte de configurar o CMS do blog, no caso eu estou usando [Netlify CMS](https://www.netlifycms.org/), ele é bem simples de se usar e se configurar, inclusive é nele que estou escrevendo esse post! A parte final foi configurar o netlify para receber o projeto e por no ar, mais uma parte bem simples.

      ### Próximos passos

      Bem, fazendo uma analise bem simples, ainda preciso finalizar algumas partes do blog como o **Sobre Mim**, tentar fazer posts mensais(isso pode me cobrar), e corrigir alguns bugszinhos aqui ou ali que possa ter, e aos poucos ir mudando o layout, já que esse aqui deve ter uns 2000 iguais.

      Muito obrigado por ter lido até aqui jovem, nos vemos na próxima!

      Foto do usuário [Florian Olivo](https://unsplash.com/@florianolv) no [Unsplash](https://unsplash.com/)
    MARKDOWN
  },
  {
    slug: "vamos-falar-sobre-metodologias-ageis",
    title: "Vamos falar sobre metodologias ágeis?",
    description: "Um pouco da minha experiencia, escrevi esse post quando ainda trabalhava na Concrete Solutions",
    published_at: Time.zone.parse("2021-03-23 02:48:28"),
    category: "misc",
    background_color: "#7AAB13",
    thumbnail_url: "https://images.unsplash.com/photo-1518349619113-03114f06ac3a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
    body: <<~MARKDOWN
      O Post a seguir foi o primeiro que eu escrevi na minha vida, foi na época que trabalhei na [Concrete Solutions](https://medium.com/concretebr), corrigi algumas coisas, coloquei mais algumas visões que tenho hoje em dia.

      Espero que curta essa leitura, eu fiz a correção ouvindo [Five Finger Death Punch](https://open.spotify.com/artist/5t28BP42x2axFnqOOMg3CM?si=WG8lTojLQYCBb-PiCvCcoA) uma banda de heavy metal que eu simplesmente amo!

      Boa leitura!\
      \
      E aí jovens! Tudo bem? Nesse post vou falar um pouco da minha vivência com metodologias ágeis dentro da Concrete Solutions e tentar explicar o essencial para quem está iniciando na carreira de tecnologia atualmente.

      Sabemos que existem diversas metodologias ágeis. Como por exemplo Scrum, XP, Kanban, etc... Essas metodologias servem para gerenciar o desenvolvimento e para realizar boas entregas no menor tempo. Claro, priorizando a qualidade para que assim você possa focar no produto.

      A partir de uma visão geral do que o cliente precisa, nós como time precisamos transformar em algo palpável em pouco tempo, e para isso é necessário:

      1. Realizar uma reunião com o time para deixar o projeto claro;
      2. Alinhar com o time e quebrar em partes o desenvolvimento do projeto;
      3. O Product Owner organizará as tarefas e suas prioridades, separando em sprints, que são ciclos para realizar as entregas do projeto.

      E pelos estudos que fiz nos últimos tempos, a demora na entrega foi o que motivou a criação desses métodos lá década de 90, um software demorava coisa de 2 a 3 anos para ser entregue.

      As entregas eram sempre softwares enxutos, com muitas funcionalidades, o que era bom! Certo?! Errado! (aqui lê-se Erroooooou!). Porque além do alto custo para o desenvolvimento, acabava saindo do escopo do cliente e aquilo que foi solicitado mudou ou não tinha mais serventia.

      Comparando com o mercado de TI, que hoje em dia muda tudo em alguns segundos, imaginem no início onde muitas empresas queriam evoluir tecnologicamente falando, e com essa demora na entrega, alguns dos propósitos iniciais daquele software já estavam completamente defasado.

      Analisando esses problemas, 17 pessoas com o intuito de resolver está demora se reuniram na cidade de [Utah (EUA)](https://goo.gl/maps/4UmPTZnRr7WGpiSh7). Entre elas, estavam os criadores do Extremme Programming, Scrum, Adaptive Software Development, Feature-Driven Development, Pragmatic Programming, entre outros métodos.

      Se passaram vários dias de brainstorm, pegando tudo que cada um deles havia criado de expressivo nas metodologias já existentes e gerando ideias para a criação do manifesto ágil (resuminho do que pode ser verificado [aqui](https://pt.wikipedia.org/wiki/Manifesto_%C3%81gil)).

      Sendo assim, concluíram como essenciais os seguintes pilares:

      - Indivíduos e interações mais que processos e ferramentas.
      - Software em funcionamento mais que documentação abrangente.
      - Colaboração com o cliente mais que negociação de contratos.
      - Responder a mudanças mais que seguir um plano

      Ou seja, mesmo tendo o valor nos itens da direita, priorizar os itens à esquerda.

      Dessa forma, conseguimos tornar mais humano o desenvolvimento de software. Possibilitando que ele se molde e evolua junto ao time, assim formando o manifesto ágil. Que pode ser implementado na sua empresa, no seu time, equipe de hackathon e onde for necessário realizar entregas com qualidade e agilidade.

      Lembrando que o adjetivo ágil no dicionário é: eficiente, rápido no trabalho; diligente, trabalhador.

      Você precisa ser ágil, que não enrola nas entregas, não deixa o time na mão e se tiver alguma dificuldade, levantará a mão para pedir ajuda. E não vai esperar até o fim da sprint e dizer que não entregou sua parte porque estava dependendo de alguém e se você não sinalizou isso, a culpa é sua, certo?

      Como é o dia-a-dia de um time que usa metodologias ágeis? Eu explico:

      Baseado nos times que já trabalhei, começamos com a daily, sendo uma pequena reunião de 15 minutos feita para poder falar o que fizemos no dia anterior, o que faremos no dia atual e se temos alguma dificuldade para poder concluir aquela tarefa. Essa é feita todos os dias de segunda a sexta. As vezes rola de fazer um checkpoint só para atualizar certa tarefa ou demanda.

      No começo ou no final da sprint, vamos fazer a retrospectiva e o refinamento. essa data é definida pelo time mas como exemplo da entrega do sprint ser na sexta de manhã e fazer o planejamento na parte da tarde, para começar na segunda-feira atacando aquelas tarefas.

      Uma observação muito importante é comunicação sempre! Sempre esteja online no Slack, Teams da Microsoft, Chat da Google, fazendo um sinal de fumaça e levantando-se da mesa e indo até a pessoa (mas em caso de pandemia, #FiqueEmCasa), e segue o baile.

      Mas o que eu gostaria de acrescentar é em caso tenha algum problema, seja ele pessoal ou profissional, levanta a mão e converse com a seu time, sejam eles seu Product Owner, Delivery Manager, Project Manager, Dev Team, eles vão dar um jeito de resolver essa barra com você! Se for um impedimento de terceiros por exemplo, e depender de um acesso, um serviço na AWS/Azure ou de qualquer outra plataforma, essas pessoas estão ali para poder te ajudar. Caso eles não tenham uma solução, eles saberão a quem recorrer.

      Lembre-se, nem toda chamada de atenção que você ou o time leva é para o mal de vocês. Como um time de futebol, é necessário o trabalho em equipe para poder vencer os desafios que nos foram impostos. Pegue isso, veja os pontos que está errando e melhore. Caso tenha dificuldade de resolver algum ponto específico, tem o seu gestor(a), conselheiro(a), coordenador(a), um(a) amigo(a) para te ajudar a melhorar nisso.

      Obrigado!
    MARKDOWN
  },
  {
    slug: "trilhando-os-caminhos-que-escolhi",
    title: "Front-end Specialist, caminho que escolhi trilhar",
    description: "Falando um pouco sobre o roadmap de estudos que vou trilhar para alcançar o nível desejado como pessoa desenvolvedora especializada em front-end",
    published_at: Time.zone.parse("2021-03-28 11:37:18"),
    category: "dev",
    background_color: "#637a91",
    thumbnail_url: nil,
    body: <<~MARKDOWN
      Olá jovem!

      Como estão as coisas? tudo bem? Espero que sim.\
      Muito obrigado por voltar a visitar meu humilde Blog! Já fiz algumas melhorias, como passar tudo para Typescript, ajustar alguns plugins do Gatsby, fixando a versão do NodeJS lá no Netlify e se quiser dar uma acompanhada no que alterei segue esse [repositório](https://github.com/azevedo-pedro/my-personal-blog).

      Para não sair muito do costume, hoje eu estou ouvindo a banda [Bad Wolves](spotify:artist:0eI3X5rAzHRZVe5FPk4MN1) que é uma pegada heavy metal/groove metal, algo inspirado no Pantera, Sepultura e Fear Factory, o album em questão que estou ouvindo é o **_N.A.T.I.O.N,_** depois de uma olhada se curtir esse tipo de música.

      Hoje o papo vai ser mais sobre carreira, como vocês podem ver no sobre mim, eu resolvi que seria especialista em front-end, mas como posso definir que vou ser especialista em algo se eu mal sei o que quero da minha vida? Explico, nesses últimos meses, eu andei passando por alguns problemas de performance no trabalho, rendi menos do que de costume e se me perguntar o motivo, eu sei exatamente o que é, **falta de plano de carreira.**

      Mas Pedron, como isso pode afetar o seu rendimento no trabalho? o que te deixa tão abatido para não te fazer render como a meses atrás? Creio que todos nós precisamos de propósitos na vida, só viver para pagar boleto não é o tipo de coisa que eu recomendaria e isso não é diferente da sua carreira profissional.

      Nós como pessoas desenvolvedoras, precisamos ter alguns cuidados na hora de escolher alguns caminhos, muitos amigos escolheram virar especialistas e hoje eu tenho o foco da virar Tech lead um dia, mas para isso acontecer eu preciso ser especialista em algo, seja isso na linguagem que eu trabalho ou no desenvolvimento de aplicações web, é aqui que começamos a falar sobre as minhas escolhas.

      Durante algum tempo eu fui anotando algumas coisas que me faltavam como profissional, são skills importantes para a evolução da carreira, seja ela na parte da comunicação ou na parte técnica, e seguindo de um plano de estudos, essas são as habilidades que eu preciso melhorar.

      ## Javascript

      Sabemos que quando trabalhamos com front-end precisamos dominar o Javascript, no começo não precisamos saber de tudo mas sim o essencial para conseguir desenvolver algumas funcionalidades, estar familiarizado com as palavras reservadas da linguagem, como ela se comporta em alguns aspectos e mais algumas outras coisas se aprende com o tempo.

      Hoje me encontro na fase de aprender como o JS funciona por debaixo dos panos, entender como funciona o event loop, pilhas, arrays, prototype dos objetos, e para isso eu tenho lido o livro da [@loiane](https://twitter.com/loiane) sobre estruturas de dados e algoritmos com JS segunda versão!

      > ![Livro estrutura de dados e algoritmo com javascript da loiane](https://images-na.ssl-images-amazon.com/images/I/71KGa1y8eaL.jpg "Livro  estrutura de dados da loiane")

      Além desta leitura, estou fazendo o curso de Expert Javascript do [Erick Wendel](https://twitter.com/erickwendel_), o conteúdo que é passado neste curso é muito baseado em como o node funciona e tem uma pegada bem forte de back-end e se usa muito de logica de programação em toda as aulas, então você acaba pegando alguns casos do dia-a-dia e vai entendo como o pessoal que trabalha com back-end resolve aquele tipo de problema, o que me ajuda como front-end a ser mais compreensivo nas entregas que me são feitas, e ainda mais ajudar a discutir melhorias em alguns pontos, assim alinhando bem com o back-end e fazendo o fluxo de trabalho ser melhor.

      Esses dois são os que mais tenho focado nos últimos tempos, quando preciso me atualizar de algo sobre JS vejo alguns artigos.

      ## Testes

      Aqui entramos em um assunto mais polemico que mamilos!

      Quando eu era um Dev juninho que era lá por 2019, pensava que isso de testar aplicação era furada e que ninguém fazia! De certa forma era verdade, na época onde eu trabalhava ninguém se preocupava com testes unitário ou e2e, hoje o mercado te cobra **muito** essa skill e como tudo na vida tem seu tempo, resolvi estudar esse tipo de conteúdo no ano passado, bem lá no começo do ano eu botei na cabeça que testes são importantes e comprei o curso de [TDD na prática](https://www.udemy.com/course/js-com-tdd-na-pratica/) do meu amigo [@Willian_justen](https://twitter.com/Willian_justen). Você começou a fazer? Pois eu não!

      Só quando eu mudei de empresa e que vimos que era muito necessário fazer os testes que comecei a procurar conteúdo sobre, voltei a fazer o curso que já estava pegando muita poeira na minha estante de cursos que compramos e nunca terminamos lá da udemy.

      Está no meu foco fazer o curso também do Willian, o [React Avançado](https://reactavancado.com.br/) que como o nome já diz, além de ter muito conteúdo em Reactjs, temos muitos testes unitários e e2e e com toda certeza quando eu terminar estarei muito melhor com testes!

      Nessa mesma trilha, para poder firmar mais os conhecimentos, pretendo adquirir o curso de testes do [@Fabio Vedovelli](https://twitter.com/vedovelli74) que parece ser muito completo também.

      Muitos desses aprendizados eu vou utilizar aqui no blog, justamente para poder treinar tudo isso que estou aprendendo, sempre bom lembrar que programar é 80% prática, é claro que esse valor pode variar, mas a prática é o que te faz ir mais longe!

      ### Design Patterns

      Esse é um assunto que eu tenho que me aprofundar com carinho, muitas das vezes eu sigo padrões que talvez não sejam as melhores para aquele tipo de projeto, dentro desses padrões peguei SOLID para estudar e ainda tem mais alguns outros porem esse não é meu foco agora, mas está no road map.

      ## Conclusão

      Existem muitas coisas que eu ainda preciso aprender e com o tempo devem sair novas versões desta lista para poder ir se adaptando com a evolução continua que nós de T.I sabemos como funciona.

      \
      Se quiser trocar uma ideia comigo sobre esse post, me chama no Twitter ou no Linkedin!
    MARKDOWN
  },
  {
    slug: "minha-jornada-de-desenvolvedor-front-end-a-full-stack-com-ruby-on-rails",
    title: "Minha Jornada de Desenvolvedor Front-End a Full-Stack com Ruby on Rails",
    description: "Falo um pouco de como foi a transição de front-end para full-stack com Ruby",
    published_at: Time.zone.parse("2024-05-20 03:26:24"),
    category: "ruby",
    background_color: "#CC342D",
    thumbnail_url: "https://elevatecompany.eu/assets/ruby-code-448129fe4345ad9d5c69dc8671db380391febdc0e769ecf487d09c747ab8f822.jpg",
    body: <<~MARKDOWN
      Olá, Jovens! Hoje quero compartilhar um pouco da minha jornada de transição de um desenvolvedor front-end para um desenvolvedor full-stack utilizando Ruby on Rails.

      ## Por que Decidi Expandir Meu Horizonte

      ### Limitações do Front-End

      Trabalhar como desenvolvedor front-end é incrível. A capacidade de criar interfaces de usuário bonitas e interativas é gratificante. No entanto, comecei a sentir que estava preso em um nicho. As decisões e a lógica por trás do que acontece no back-end sempre me intrigaram, e senti que dominar apenas o front-end me limitava em termos de oportunidades e compreensão completa do desenvolvimento web.

      ### Curiosidade e Crescimento

      Sempre fui uma pessoa curiosa. Queria entender como as coisas funcionam por trás das cortinas e ser capaz de construir um aplicativo do início ao fim. A transição para full-stack parecia o próximo passo lógico para meu crescimento pessoal e profissional.

      ## Por que Escolhi Ruby on Rails

      ### Produtividade e Simplicidade

      Ruby on Rails é conhecido por sua produtividade e simplicidade. Com uma estrutura MVC robusta e convenções claras, Rails permite que você crie aplicações web complexas de maneira rápida e eficiente. A famosa frase "Rails é otimizado para a felicidade do desenvolvedor" realmente faz sentido quando você começa a trabalhar com ele.

      ### Comunidade e Recursos

      A comunidade de Ruby on Rails é acolhedora e cheia de recursos. Desde tutoriais abrangentes até fóruns de discussão ativos, sempre há ajuda disponível. Sites como o [RailsGuides](https://guides.rubyonrails.org/) e o [Stack Overflow](https://stackoverflow.com/questions/tagged/ruby-on-rails) além dos [grupos do Telegram](https://community.ruby.com.br/) e a maravilhosa [Ju Dias](https://x.com/juuh42dias) foram cruciais para o meu aprendizado.

      ## Minha Experiência com Ruby on Rails

      ### Aprendizado Inicial

      Comecei minha jornada com alguns cursos online e tutoriais. Recomendo o [Ruby on Rails Tutorial](https://www.railstutorial.org/) de Michael Hartl, que é uma excelente introdução prática. Aprender os fundamentos do Ruby também foi essencial, já que Rails é construído sobre ele.

      ### Primeiros Projetos

      Meus primeiros projetos com Rails foram simples, mas impactantes. Construir um ecommerce, o back-end deste blog me deu uma compreensão sólida de como as coisas funcionam no back-end. A integração com bancos de dados, rotas, e a lógica de negócio se tornaram claras com a prática.

      ### Desafios e Superações

      A transição não foi sem desafios. Entender e aplicar conceitos de banco de dados relacionais, lidar com autenticação e autorização, e otimizar o desempenho foram algumas das áreas que exigiram um esforço extra. Mas cada desafio superado trouxe uma sensação de realização e me fez um desenvolvedor mais completo.

      ## Benefícios de Ser Full-Stack

      ### Versatilidade

      Ser full-stack me tornou muito mais versátil. Agora posso pegar projetos de ponta a ponta, desde o design da interface até a implementação da lógica de negócios e manutenção do banco de dados. Isso não só aumentou minhas oportunidades de emprego, mas também minha capacidade de trabalhar em projetos pessoais mais complexos.

      ### Entendimento Completo

      Compreender tanto o front-end quanto o back-end me deu uma visão mais holística do desenvolvimento web. Posso tomar decisões mais informadas sobre arquitetura e design de software, e colaborar mais efetivamente com outros desenvolvedores e equipes multidisciplinares.

      ## Conclusão

      A transição de front-end para full-stack com Ruby on Rails foi uma das melhores decisões da minha carreira. Não só expandi meu conjunto de habilidades, mas também encontrei uma nova paixão no desenvolvimento web. Se você está considerando fazer uma mudança similar, eu encorajo você a mergulhar de cabeça. A curva de aprendizado pode ser íngreme, mas a recompensa vale a pena.

      Obrigado por ler sobre minha jornada. Se você tiver alguma pergunta ou quiser compartilhar sua própria experiência, sinta-se à vontade de me procurar nas redes.
    MARKDOWN
  }
]

posts_data.each do |attrs|
  post = Post.find_or_initialize_by(slug: attrs[:slug])
  post.assign_attributes(attrs.except(:slug).merge(published: true))
  if post.save
    puts "Post seeded: #{post.title}"
  else
    puts "Post failed (#{attrs[:slug]}): #{post.errors.full_messages.join(', ')}"
  end
end
