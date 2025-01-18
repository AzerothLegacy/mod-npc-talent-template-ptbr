-- DATA
SET @ENTRY := 55009;
SET @NAME := 'Selecione uma Spec';
SET @SUBNAME := 'AzerothCore Template';
SET @TEXT := 'Aqui você pode selecionar um modelo de personagem que irá equipar, ganhar gemas, definir especialização de talentos e definir glifos para seu personagem instantaneamente.';
SET @DISPLAY_ID := 24877;

DELETE FROM `creature_template` WHERE `entry` = @ENTRY;
INSERT INTO `creature_template` (`entry`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `unit_class`, `unit_flags`, `type`, `type_flags`, `RegenHealth`, `flags_extra`, `ScriptName`) VALUES
(@ENTRY, @NAME , @SUBNAME, 'Speak', 0, 80, 80, 35, 1, 1, 1.14286, 1, 0, 1, 2, 7, 138936390, 1, 2, 'npc_talent_template');

DELETE FROM `creature_template_model` WHERE `CreatureID` = @ENTRY;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@ENTRY, 0, @DISPLAY_ID, 1, 1, 0);

DELETE FROM `npc_text` WHERE `ID` = @ENTRY;
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`) VALUES
(@ENTRY, @TEXT, @TEXT);

DELETE FROM `creature_template_movement` WHERE `CreatureId` = @ENTRY;
INSERT INTO `creature_template_movement` (`CreatureId`, `Ground`, `Swim`, `Flight`, `Rooted`, `Chase`, `Random`, `InteractionPauseTimer`) VALUES
(@ENTRY, 1, 1, 0, 0, 0, 0, NULL);

-- module string
SET @MODULE_STRING := 'npc-talent-template';
DELETE FROM `module_string` WHERE `module` = @module_string;
INSERT INTO `module_string` (`module`, `id`, `string`) VALUES
(@MODULE_STRING, 1, 'Você precisa remover todos os seus itens equipados para usar este recurso!'),
(@MODULE_STRING, 2, 'Você já gastou alguns pontos de talento. Você precisa redefinir seus talentos primeiro!'),
(@MODULE_STRING, 3, 'Template equipado com sucesso!'),
(@MODULE_STRING, 4, 'Seus itens equipados foram deletados.'),
(@MODULE_STRING, 5, 'Seus glyphs foram removidos.'),
(@MODULE_STRING, 6, 'NYI: Personagem {} copiado com sucesso'),
(@MODULE_STRING, 7, 'Você tem pontos de talento não gastos. Gaste todos os seus pontos de talento e extraia o modelo novamente.'),
(@MODULE_STRING, 8, 'Obtenha glyphs e extraia o modelo novamente!'),
(@MODULE_STRING, 9, 'Modelo com sucesso criado!'),
(@MODULE_STRING, 10, 'Template criado com sucesso! Você pode usar `.templatenpc reload` para testar seu template. AVISO: Os templates precisam ser exportados manualmente para `.sql`. Veja a documentação para mais informações.'),
(@MODULE_STRING, 11, 'Recarregando templates para a tabela Template NPC...'),
(@MODULE_STRING, 12, 'Modelos de template NPC recarregados.');

-- 'deDE', 'ruRU', 'ruRU', 'koKR', 'frFR', 'zhCN', 'zhTW', 'esES', 'esMX',
DELETE FROM `module_string_locale` WHERE `module` = @MODULE_STRING;
-- INSERT INTO `module_string_locale` (`module`, `id`, `locale`, `string`) VALUES
-- (@MODULE_STRING, 0 , 'deDE', ''),
