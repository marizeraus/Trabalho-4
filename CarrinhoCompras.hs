-- definindo os tipos e getters

type ProdutoEstoque = ([Char], Int, Int)
type EstoqueProdutos = [ProdutoEstoque]

type ProdutoCarrinho = ([Char], Int)
type CarrinhoCompra = [ProdutoCarrinho]

getNome :: ([Char], Int, Int) -> [Char]
getNome(nome, _, _) = nome

getValor :: ([Char], Int, Int) -> Int
getValor(_, valor, _) = valor

getValorCarrinho :: ([Char], Int) -> Int
getValorCarrinho(_, valor) = valor

getQuantidade :: ([Char], Int, Int) -> Int
getQuantidade(_, _, quantidade) = quantidade

-- inicializando o estoque
monitorEstoque :: ProdutoEstoque
monitorEstoque = ("monitor", 500, 100)

telefoneEstoque :: ProdutoEstoque
telefoneEstoque = ("telefone", 150, 300)

tecladoEstoque :: ProdutoEstoque
tecladoEstoque = ("teclado", 70, 50)

mouseEstoque :: ProdutoEstoque
mouseEstoque = ("mouse", 50, 50)

estoque :: EstoqueProdutos
estoque = [monitorEstoque, telefoneEstoque, tecladoEstoque, mouseEstoque]

-- adicionando os produtos ao carrinho e atualiza o estoque

adicionaProduto :: ProdutoEstoque -> Int -> ProdutoCarrinho
adicionaProduto produtoEstoque quant = (getNome produtoEstoque, getValor produtoEstoque*quant)

updateProdutoEstoque :: ProdutoEstoque -> Int -> ProdutoEstoque
updateProdutoEstoque produtoEstoque quant = (getNome produtoEstoque, getValor produtoEstoque, getQuantidade produtoEstoque - quant)

monitorCarrinho :: ProdutoCarrinho
monitorCarrinho = adicionaProduto monitorEstoque 2

updateMonitor :: ProdutoEstoque
updateMonitor = updateProdutoEstoque monitorEstoque 2

telefoneCarrinho :: ProdutoCarrinho
telefoneCarrinho = adicionaProduto telefoneEstoque 5

updateTelefone :: ProdutoEstoque
updateTelefone = updateProdutoEstoque telefoneEstoque 5

tecladoCarrinho :: ProdutoCarrinho
tecladoCarrinho = adicionaProduto tecladoEstoque 2

updateTeclado :: ProdutoEstoque
updateTeclado = updateProdutoEstoque tecladoEstoque 5

carrinho :: CarrinhoCompra
carrinho = [monitorCarrinho, telefoneCarrinho, tecladoCarrinho]

estoqueFinal :: EstoqueProdutos
estoqueFinal = [updateMonitor, updateTeclado, updateTelefone, mouseEstoque]

totalCompra :: Int 
totalCompra = sum (map getValorCarrinho carrinho)

main :: IO ()
main = do

    putStrLn "total:"
    print totalCompra
    print estoque