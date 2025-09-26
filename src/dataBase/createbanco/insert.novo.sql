-- 1 - CONDOMINIO
INSERT INTO Condominio (cond_nome, cond_endereco, cond_cidade) VALUES
('Residencial Jardim Europa', 'Rua das Flores, 123', 'São Paulo'),
('Condomínio Sol Nascente', 'Av. Brasil, 456', 'Rio de Janeiro'),
('Village das Palmeiras', 'Rua Central, 789', 'Belo Horizonte'),
('Residencial Porto Seguro', 'Av. Atlântica, 1000', 'Salvador');

-- 2 - USUARIOS
INSERT INTO Usuarios (user_nome, user_email, user_senha, user_telefone, user_tipo, user_push_token) VALUES
('Ana Souza', 'ana@email.com', 'senha123', '1199999999', 'Morador', NULL),
('Carlos Pereira', 'carlos@email.com', '123456', '2198888888', 'Sindico', 'ExponentPushToken[xxxxxxxxxxxxxxxxxxxxxx]'),
('Fernanda Lima', 'fernanda@email.com', 'abc123', '3197777777', 'ADM', 'ExponentPushToken[yyyyyyyyyyyyyyyyyyyyyy]'),
('João Oliveira', 'joao@email.com', 'pass123', '7196666666', 'Funcionario', NULL);

-- 3 - GERENCIAMENTO
INSERT INTO Gerenciamento (cond_id, ger_data, ger_descricao, ger_valor) VALUES
(1, '2025-01-10', 'Pagamento de energia', 3500.500),
(2, '2025-01-15', 'Reforma da piscina', 12000.000),
(3, '2025-02-01', 'Compra de equipamentos', 2500.750),
(4, '2025-02-05', 'Manutenção elétrica', 1800.250);

-- 4 - BLOCO
INSERT INTO Bloco (cond_id, bloc_nome) VALUES
(1, 'Bloco A'),
(1, 'Bloco B'),
(2, 'Bloco Único'),
(3, 'Bloco Central');

-- 5 - AMBIENTES
INSERT INTO Ambientes (cond_id, amd_descricao, amd_nome, amd_capacidade) VALUES
(1, 'Salão de Festas principal', 'Salão de Festas', 100),
(1, 'Piscina adulta e infantil', 'Piscina', 80),
(2, 'Quadra poliesportiva', 'Quadra', 50),
(3, 'Academia equipada', 'Academia', 30);

-- 6 - APARTAMENTOS
INSERT INTO Apartamentos (bloco_id, ap_numero, ap_andar) VALUES
(1, '101', 1),
(1, '202', 2),
(2, '301', 3),
(3, '12', 1);

-- 7 - USUARIO_APARTAMENTOS
INSERT INTO Usuario_Apartamentos (user_id, ap_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 4);

-- 8 - VISITANTES
INSERT INTO Visitantes (userap_id, vst_nome, vst_documento, vst_validade_inicio, vst_validade_fim, vst_qrcode_hash, vst_status, vst_data_entrada, vst_data_saida) 
VALUES 
(1, 'João da Silva', '123.456.789-00', '2025-09-24 19:00:00', '2025-09-24 23:59:00', 'hash_unico_para_joao_123', 'Aguardando', NULL, NULL),
(2, 'Maria Oliveira', NULL, '2025-09-26 18:00:00', '2025-09-28 22:00:00', 'hash_unico_para_maria_456', 'Aguardando', NULL, NULL),
(3, 'Pedro Souza', '987.654.321-11', '2025-09-24 14:00:00', '2025-09-24 18:00:00', 'hash_unico_para_pedro_789', 'Entrou', '2025-09-24 14:05:12', NULL);
-- Adicionei o quarto visitante com userap_id = 4 para consistência
(4, 'Ana Costa', '555.444.333-22', '2025-09-23 10:00:00', '2025-09-23 17:00:00', 'hash_unico_para_ana_101', 'Finalizado', '2025-09-23 10:15:30', '2025-09-23 16:45:00');

-- 9 - ENCOMENDAS
INSERT INTO Encomendas (userap_id, enc_nome_loja, enc_codigo_rastreio, enc_status, enc_data_chegada, enc_data_retirada) VALUES
(1, 'Amazon', 'BR123456789', 'Aguardando', '2025-03-01 10:00:00', NULL),
(2, 'Shopee', 'BR987654321', 'Entregue', '2025-03-02 11:30:00', '2025-03-02 18:00:00'),
(3, 'Magazine Luiza', 'BR555666777', 'Aguardando', '2025-03-03 15:00:00', NULL),
(4, 'Americanas', 'BR888999000', 'Entregue', '2025-03-04 09:00:00', '2025-03-04 12:00:00');

-- 10 - MENSAGENS
INSERT INTO Mensagens (cond_id, userap_id, msg_mensagem, msg_data_envio, msg_status) VALUES
(1, 1, 'Reunião marcada para sexta-feira', '2025-03-01 08:00:00', 'Enviada'),
(2, 2, 'Lembrete da assembleia', '2025-03-02 09:00:00', 'Lida'),
(3, 3, 'Aviso de manutenção na academia', '2025-03-03 10:00:00', 'Pendente'),
(4, 4, 'Pagamento da taxa condominial', '2025-03-04 11:00:00', 'Enviada');

-- 11 - NOTIFICACOES
INSERT INTO Notificacoes (userap_id, not_titulo, not_mensagem, not_data_envio, not_lida, not_prioridade, not_tipo) VALUES
(1, 'Entrega Recebida', 'Seu pacote foi entregue na portaria.', '2025-03-05 11:45:00', 0, 'Media', 'Entrega'),
(2, 'Manutenção Elevador', 'O elevador ficará em manutenção amanhã das 14h às 18h.', '2025-03-06 16:20:00', 0, 'Alta', 'Aviso'),
(3, 'Reunião de Condomínio', 'Reunião marcada para sexta-feira às 19h no salão de festas.', '2025-03-07 18:30:00', 1, 'Media', 'Aviso'),
(4, 'Dedetização', 'A dedetização ocorrerá no sábado pela manhã. Favor manter janelas fechadas.', '2025-03-08 09:00:00', 0, 'Baixa', 'Aviso');

-- 12 - RESERVAS_AMBIENTES
INSERT INTO Reservas_Ambientes (userap_id, amd_id, res_horario_inicio, res_horario_fim, res_data_reserva, res_status) VALUES
(1, 1, '18:00:00', '23:00:00', '2025-03-10', 'Reservado'),
(2, 2, '10:00:00', '12:00:00', '2025-03-11', 'Reservado'),
(3, 3, '15:00:00', '17:00:00', '2025-03-12', 'Cancelado'),
(4, 4, '07:00:00', '09:00:00', '2025-03-13', 'Reservado');

-- 13 - OCORRENCIAS
INSERT INTO Ocorrencias (userap_id, oco_protocolo, oco_categoria, oco_descricao, oco_localizacao, oco_data, oco_status, oco_prioridade, oco_imagem) VALUES
(1, 'OCO001', 'Segurança', 'Barulho excessivo após as 22h', 'Bloco A - 2º andar', '2025-03-01 23:30:00', 'Aberta', 'Média', NULL),
(2, 'OCO002', 'Manutenção', 'Lâmpada queimada no corredor', 'Bloco B - 1º andar', '2025-03-02 20:00:00', 'Em Andamento', 'Baixa', NULL),
(3, 'OCO003', 'Reclamação', 'Piscina suja', 'Área comum', '2025-03-03 14:15:00', 'Resolvida', 'Alta', NULL),
(4, 'OCO004', 'Segurança', 'Portão da garagem não fecha', 'Garagem', '2025-03-04 18:00:00', 'Aberta', 'Urgente', NULL);

-- 14 - DOCUMENTOS
INSERT INTO Documentos (cond_id, doc_nome, doc_categoria, doc_data, doc_tamanho, doc_url) VALUES
(1, 'Ata Assembleia 2025', 'Ata', '2025-02-01', '1.2MB', 'https://docs.condominio.com/ata2025.pdf'),
(2, 'Regulamento Piscina', 'Regulamento', '2025-01-15', '500KB', 'https://docs.condominio.com/piscina.pdf'),
(3, 'Balanço Financeiro 2024', 'Balanço', '2025-02-10', '2.5MB', 'https://docs.condominio.com/balanco2024.pdf'),
(4, 'Circular Avisos Gerais', 'Circular', '2025-02-20', '800KB', 'https://docs.condominio.com/circular.pdf');