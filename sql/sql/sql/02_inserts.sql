/* =========================================================
   Script 02 - INSERTs (DML)
   Popula tabelas principais com dados coerentes
   ========================================================= */

-- CLIENTES
INSERT INTO cliente (nome, email, telefone) VALUES
('Ana Lima',    'ana@email.com',   '85999990001'),
('Bruno Rocha', 'bruno@email.com', '85999990002'),
('Carla Souza', 'carla@email.com', '85999990003'),
('Diego Alves', 'diego@email.com', '85999990004');

-- PRODUTOS
INSERT INTO produto (nome, categoria, preco, estoque) VALUES
('Teclado Mecânico',  'Periféricos', 350.00, 20),
('Mouse Gamer',       'Periféricos', 180.00, 35),
('Monitor 27"',       'Monitores',   1200.00, 10),
('Headset USB',       'Áudio',       250.00, 15),
('Cadeira Ergonômica','Móveis',      980.00, 5);

-- PEDIDOS
INSERT INTO pedido (id_cliente, status) VALUES
(1, 'ABERTO'),
(2, 'PAGO'),
(1, 'ENVIADO'),
(3, 'ABERTO');

-- ITENS DO PEDIDO
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 350.00),
(1, 2, 2, 180.00),
(2, 3, 1, 1200.00),
(3, 4, 1, 250.00),
(3, 2, 1, 180.00),
(4, 5, 1, 980.00);

-- PAGAMENTOS (somente pedidos pagos/confirmados)
INSERT INTO pagamento (id_pedido, forma, valor) VALUES
(2, 'PIX', 1200.00),
(3, 'CARTAO', 430.00);
