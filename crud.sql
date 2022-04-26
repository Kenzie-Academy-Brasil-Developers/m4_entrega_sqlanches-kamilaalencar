-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)

INSERT INTO
  clientes (nome, lealdade)
VALUES
  ('Georgia', 0);

-- 2)

INSERT INTO
  pedidos (status, cliente_id)
VALUES
  ('Recebido', 6);

-- 3)

INSERT INTO
  produtos_pedidos (pedido_id, produto_id)
VALUES
  (6, 1),
  (6, 2),
  (6, 6),
  (6, 8),
  (6, 8);

-- Leitura

-- 1)

SELECT
  cl.id,
  cl.nome,
  cl.lealdade,
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
  INNER JOIN produtos pr ON pp.produto_id = pr.id
  INNER JOIN clientes cl ON pd.cliente_id = cl.id 
WHERE
  cl.id = 6 ; -- ou cl.nome = 'Georgia' 

-- Atualização

-- 1)

UPDATE
  clientes
SET
  lealdade = (
    SELECT
      SUM(pr.pts_de_lealdade)
    FROM
      pedidos pd
      INNER JOIN produtos_pedidos pp ON pd.id = pp.pedido_id
      INNER JOIN produtos pr ON pp.produto_id = pr.id
      INNER JOIN clientes cl ON pd.cliente_id = cl.id
    WHERE
      cl.id = 6
  )
WHERE
  id = 6;

-- Deleção

-- 1)

DELETE FROM
  clientes
WHERE
  nome = 'Marcelo' --ou id = 4;


