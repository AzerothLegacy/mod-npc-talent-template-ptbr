-- COMMAND
DELETE FROM `command` WHERE `name` IN ('templatenpc reload', 'templatenpc create');
INSERT INTO `command` (`name`, `security`, `help`) VALUES
('templatenpc reload', 3, 'Syntax: .templatenpc reload\nDigite .templatenpc reload para recarregar as alterações no banco de dados do Template NPC'),
('templatenpc create', 3, 'Syntax: .templatenpc create\nDigite .templatenpc create [nome] para criar um Template para sua classe com o nome desejado. Este nome diferencia maiúsculas de minúsculas');
