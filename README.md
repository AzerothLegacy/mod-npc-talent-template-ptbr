# ![logo](https://raw.githubusercontent.com/azerothcore/azerothcore.github.io/master/images/logo-github.png) AzerothCore

## mod-npc-talent-template

- Último status de compilação com azerothcore:
  
[![core-build](https://github.com/AzerothLegacy/mod-npc-talent-template-ptbr/actions/workflows/core-build.yml/badge.svg)](https://github.com/AzerothLegacy/mod-npc-talent-template-ptbr)
## Descrição
Este mod introduz um NPC que permite aos jogadores aplicar instantaneamente modelos de personagens pré-configurados que equipam, gemam, definem talentos e aplicam glifos para qualquer classe. Ideal para otimização rápida de personagens para várias funções e cenários.

* modelos para nível 80 PvP S6 e nível 70 PvE T6
* opções de equipamentos específicos para cada raça (por exemplo, humanos não recebem nenhum acessório PvP)
* comando do administrador para criar modelos personalizados. Os modelos são gerenciados diretamente pelo banco de dados e configuração. Nenhuma edição C++ necessária

![](https://i.ibb.co/27WPR5j/Wo-WScrn-Shot-021219-000220.jpg)

Video Showcase:
https://streamable.com/yxv1m

## Criando conjuntos de equipamentos personalizados
Este processo só pode ser feito por um administrador e é propenso a erros. A criação de conjuntos de equipamentos deve ser feita em um servidor de desenvolvimento local e a exportação de conjuntos do Banco de Dados para um `.sql` é recomendada.

1. Configure um personagem com o conjunto de equipamentos desejado, gemas, encantamentos, talentos e glifos.
2. `.templatenpc create [TemplateName]` cria entradas de banco de dados para equipamentos, talentos, glifos e uma entrada na tabela de índice para sua classe. Um nome de modelo precisa ser exclusivo para essa classe e diferencia maiúsculas de minúsculas. Por exemplo, ao criar um conjunto PvP para um Druida Restauração lvl80 `.templatenpc create Restoration80PvPS8`.
3. exporte para `.sql`
4. algumas alterações manuais são necessárias

As seguintes entradas são criadas no banco de dados `acore_characters`:
a. `mod_npc_talent_template_gear`: equipamento para sua classe, especialização e raça. Ao exportar, modifique a raceMask conforme necessário. Ao criar um conjunto de especialização para várias raças, crie um modelo para uma raça, exporte para sql e crie um modelo para uma nova raça. Modifique a raceMask conforme necessário
b. `mod_npc_talent_template_talents`: nenhuma modificação necessária
c. `mod_npc_talent_template_glyphs`: nenhuma modificação necessária
d. `mod_npc_talent_template_index`: modifique gossipText, actionId precisa ser exclusivo por especialização. As opções de Gossip são exibidas de acordo com seu ID com o ID mais baixo no topo. Você pode substituir uma coluna para reutilizar talentos, glifos ou equipamento de outro modelo. Por exemplo, talentos e glifos de `Restoration80PvP` podem ser reutilizados

`.templatenpc reload` para recarregar as alterações. Teste com a remoção das tabelas `acore_characters.mod_npc_talent_template*` e atualizações do banco de dados de personagens conforme necessário
```sql
DELETE FROM acore_characters.updates WHERE name='npc_talent_template_data_1_80_pvp_s6.sql';
DELETE FROM acore_characters.updates WHERE name='npc_talent_template_data_2_70_pve_t6.sql';
DELETE FROM acore_characters.updates WHERE name='npc_talent_template.sql';
DROP TABLE IF EXISTS acore_characters.mod_npc_talent_template_gear;
DROP TABLE IF EXISTS acore_characters.mod_npc_talent_template_glyphs;
DROP TABLE IF EXISTS acore_characters.mod_npc_talent_template_index;
DROP TABLE IF EXISTS acore_characters.mod_npc_talent_template_talents;
```
