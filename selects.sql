-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT
  pd.id,
  pd.status,
  pd.cliente_id,
  pr.id,
  pr.nome,
  pr.tipo,
  pr."preço",
  pr.pts_de_lealdade
FROM
  pedidos pd
  INNER JOIN produtos_pedidos pp ON pd.id = pp.pedido_id
  INNER JOIN produtos pr ON pp.produto_id = pr.id;

-- 2)
SELECT
  pd.id
FROM
  pedidos pd
  INNER JOIN produtos_pedidos pp ON pd.id = pp.pedido_id
  INNER JOIN produtos pr ON pp.produto_id = pr.id
WHERE
  pr.id = 6; -- ou pr.nome = 'Fritas'

-- 3)
SELECT
  cl.nome AS gostam_de_fritas
FROM
  pedidos pd
  INNER JOIN produtos_pedidos pp ON pd.id = pp.pedido_id
  INNER JOIN produtos pr ON pp.produto_id = pr.id
  INNER JOIN clientes cl ON pd.cliente_id = cl.id
WHERE
  pr.id = 6; -- ou  pr.nome = 'Fritas'

-- 4)
SELECT
  SUM(pr."preço")
FROM
  pedidos pd
  INNER JOIN produtos_pedidos pp ON pd.id = pp.pedido_id
  INNER JOIN produtos pr ON pp.produto_id = pr.id
  INNER JOIN clientes cl ON pd.cliente_id = cl.id
WHERE
  cl.id = 5; -- ou cl.nome = 'Laura'

-- 5)
SELECT
  pr.nome,
  COUNT(pp.produto_id)
FROM
  pedidos pd
  INNER JOIN produtos_pedidos pp ON pd.id = pp.pedido_id
  INNER JOIN produtos pr ON pp.produto_id = pr.id
GROUP BY
  pr.nome
ORDER BY
  pr.nome;