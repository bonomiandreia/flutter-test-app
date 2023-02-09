# flutter-test-app

This is a app poc and a process of learning about Flutter, the framework created by google to facilitate the creation of applications, since it compiles the code in a native way in android or iOs.



# Topics

- `setState method`: notify that internally, a object changed its status and updated, for example.
- `InitState method`: Its when the component starts.
- `build method`: Called a anytime when you call setState.
- `dispose`: Called when the component is destroyed, in other words, it has left the view's user.

## Events
- O `addListener` is used to listen events that happen on screen, in this test case, the infinity scroll but it can use to listen inputs or buttons.
- `OnTap` is used to listen clicks of buttons and items.

## Grid
`Container` is all that includes many items as `Rows` and `Columns`, they are the structure of a component. 
The `GridView` can create layouts too but in a limited way.


## Requests http
The `import 'package:http/http.dart` is a library of dart that can make http requests.


## Apis used
- NewsAPI newsapi.org - News Api of varied news, in this case of project, about healthy.
- spoonacular: API of recipes and nutritional info.


## 


Este app é um teste de aprendizado sobre o Flutter, um framework criado pela google pra facilitar a criação de aplicativos, visto que ele compila o código de forma nativa em android ou iOs.

#Temas abordados


## Ciclos de vida
- `setState method`: Notifica que internamente um objeto mudou de estado e se atualizou, por exemplo.
- `InitState method`: Ë quando o componente se inicia
- `build method`: Chamado a qualquer momento quando o setState ou InitState é chamado, o componente é rebuildado.
- `dispose`: Chamado quando o componente é destruído, isto é, saiu da visão do usuário.

## Eventos
- O `addListener` é usado para escutar os eventos que acontecem na página, no caso da app, o scroll infinito mas pode ser utilizado pra escutar caixas de texto ou botôes, a pagina pode ouvir esse evento.
- `onTap` é usado para escutar cliques de botões ou itens.

## Grid
`Container` é tudo que engloba varios itens e o layout é construido através de `Rows`e `Columns`.
O `GridView` também consegue criar layouts mas de uma maneira mais limitada.

## Requisições http
a `import 'package:http/http.dart' as http;` é uma biblioteca do dart que consegue fazer requests http.

## Apis utilizadas:
- NewsApi newsapi.org - API de noticias variadas que no caso é sobre saúde
- spoonacular: API de receitas e informações nutricionais 

