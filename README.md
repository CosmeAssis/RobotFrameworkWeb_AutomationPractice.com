# Automação

Testes automatizados Web utilizando o Robot Framework + Selenium.

**Site:** http://automationpractice.com/index.php

## CENÁRIOS DE TESTE

**CN0001-Criação de novo cadastro no Automation Practice**

<p>Dado que acesso o site automation practice <br />
E o cliente deseja realizar um cadastro<br />
Quando entrar com as informações de cadastro<br />
Então um novo cadastro é criado<br />

**CN0002-Login com sucesso no Automation Practice**

<p>Dado que acesso o site automation practice <br />
E clico em Sign In<br />
Quando preencho o campo email<br />
E preencho o campo senha<br />
E clico no botão Sign In no login<br />
Então sou direcionado para a pagina com titulo My account - My Store<br />

**CN0003-Pesquisar roupas femininas com o menor valor**

<p>Dado que eu esteja realizando uma compra<br />
Quando o cliente pesquisar por menor valor<br />
Então será exibido apenas peças com o menor valor<br />

**CN0004-Compra com sucesso utilizando forma de pagamento Pay by bank wire**
<p>Dado que acesso o site automation practice <br />
E clico em Sign In<br />
E clico na opção Women<br />
Quando adicionar o produto Faded Short Sleeve T-shirts ao carrinho<br />
E adicionar o produto Blouse no carrinho<br />
E realizo os proximos passos da venda com pagamento Pay by bank wire<br />
Então a mensagem Your order on My Store is complete é exibida após concluir compra<br />

**CN0005-Deletar produto do carrinho de compras**
<p>Dado que acesso o site automation practice <br />
E adiciono o produto Faded Short Sleeve T-shirts no carrinho<br />
E adiciono o produto Blouse<br />
Quando clico no carrinho<br />
E removo os produtos<br />
Então mensagem que os produtos foram excluidos é exibida<br />