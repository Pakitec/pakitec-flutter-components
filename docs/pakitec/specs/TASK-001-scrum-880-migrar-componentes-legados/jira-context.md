# Jira Context: SCRUM-880

**Issue**: https://pakitec.atlassian.net/browse/SCRUM-880  
**Summary**: Migrar componentes legados para o novo pacote Flutter temável  
**Status**: A fazer  
**Assignee**: Unassigned  
**Branch**: `feature/scrum-880-migrar-componentes-legados`
**Projeto Jira/GitHub**: pakitec-flutter-components

## Description

## Faltou discutir com a equipe
- Confirmar criterios de aceite finais. - Validar prioridade, prazo e impacto em outros fluxos. - Confirmar se existem regras de negocio, prototipo ou casos extremos nao descritos.
## Detalhes tecnicos gerados pelo Pakitec
Projeto carregado: pakitec-flutter-components Path local analisado: /Volumes/External HD/Projetos/pakitec/pakitec-flutter-components Stack inferida: flutter Estrutura observada: - LICENSE - docs - example - lib - test Arquivos relevantes encontrados: - AGENTS.md - README.md - example/README.md - example/pubspec.yaml - pubspec.yaml
Flutter/pubspec snapshot: name: pakitec_flutter_components description: Componentes Flutter oficiais da Pakitec, independentes de tema. environment:   sdk: '>=3.10.0 <4.0.0'   flutter: '>=3.38.0' dependencies:   flutter:   pakitec_themes: dev_dependencies:   flutter_test:   flutter_lints: ^6.0.0   uses-material-design: true
README snapshot: # Pakitec Flutter Components
Componentes Flutter oficiais da Pakitec. Os widgets consomem o `ThemeData` do aplicativo e funcionam com Nimbus ou com um tema criado pelo produto.
## Instalação
```yaml dependencies:   pakitec_flutter_components:     git:       url: https://github.com/Pakitec/pakitec-flutter-components.git       ref: v0.1.0 ```
## Nimbus
```dart MaterialApp(   theme: PakitecThemes.nimbusLight(),   darkTheme: PakitecThemes.nimbusDark(),   themeMode: ThemeMode.system,   home: const MyHomePage(), ); ```
Os componentes resolvem estilo nesta ordem:
1. Propriedade explícita do widget. 2. Tema Material do componente. 3. `NimbusThemeTokens`, quando aplicável. 4. `ColorScheme` do tema ativo.
## Catálogo
O Dashbook publicado está disponível em:
https://pakitec.github.io/pakitec-flutter-components/
```sh cd example flutter run -d chrome ```
O Dashbook permite alternar entre Nimbus Light e Nimbus Dark pela barra de ferramentas.
## Licença
O repositório é público. A licença de uso comunitário ainda precisa ser formalmente definida pela Pakitec antes da distribuição fora dos projetos autorizados. Leitura tecnica inicial: - A implementacao deve partir do projeto 'pakitec-flutter-components' e preservar os padroes locais detectados. - A demanda do usuario deve ser refinada em criterio de aceite antes de iniciar desenvolvimento. - Antes de executar, rodar pakitec_plan na issue criada para gerar TASK local, branch e contexto de implementacao.
Notas tecnicas informadas no prompt: Consumir pakitec_themes v1.1.0 via Theme.of(context), ColorScheme e NimbusThemeTokens. Preservar APIs claras, acessibilidade e assets com package correto. Prompt original resumido: Migrar todos os componentes públicos do pacote legado pakitec-components para pakitec-flutter-components, tornando-os independentes de tema e compatíveis com Nimbus Light, Nimbus Dark e ThemeData customizado. Aplicar os renomes aprovados: PakiComboField para PakiSelect, PakiInputCalendar para PakiDateField, PakiInputZipCode para PakiZipCodeField, PakiIndicator para PakiStatusIndicator, PakiTextField para PakiRichTextField e consolidar PakiHorizontalDiv/PakiVerticalDiv em PakiDivider.horizontal()/vertical(). Replicar todos os componentes no Dashbook com alternância de tema, testes e documentação.

## Acceptance Criteria

- [NEEDS CLARIFICATION] Criterios de aceite nao encontrados no Jira.

## Visao do Usuario

Migrar todos os componentes públicos do pacote legado pakitec-components para pakitec-flutter-components, tornando-os independentes de tema e compatíveis com Nimbus Light, Nimbus Dark e ThemeData customizado. Aplicar os renomes aprovados: PakiComboField para PakiSelect, PakiInputCalendar para PakiDateField, PakiInputZipCode para PakiZipCodeField, PakiIndicator para PakiStatusIndicator, PakiTextField para PakiRichTextField e consolidar PakiHorizontalDiv/PakiVerticalDiv em PakiDivider.horizontal()/vertical(). Replicar todos os componentes no Dashbook com alternância de tema, testes e documentação.

## Prototipo

- Nenhum prototipo informado.

## Regras de Negocio

Projetos atuais podem continuar no pacote legado; novos projetos devem usar pakitec_flutter_components. O novo pacote não deve manter aliases legados quando ainda não houver consumidores.

## Detalhes Tecnicos

Projeto carregado: pakitec-flutter-components Path local analisado: /Volumes/External HD/Projetos/pakitec/pakitec-flutter-components Stack inferida: flutter Estrutura observada: - LICENSE - docs - example - lib - test Arquivos relevantes encontrados: - AGENTS.md - README.md - example/README.md - example/pubspec.yaml - pubspec.yaml
Flutter/pubspec snapshot: name: pakitec_flutter_components description: Componentes Flutter oficiais da Pakitec, independentes de tema. environment:   sdk: '>=3.10.0 <4.0.0'   flutter: '>=3.38.0' dependencies:   flutter:   pakitec_themes: dev_dependencies:   flutter_test:   flutter_lints: ^6.0.0   uses-material-design: true
README snapshot: # Pakitec Flutter Components
Componentes Flutter oficiais da Pakitec. Os widgets consomem o `ThemeData` do aplicativo e funcionam com Nimbus ou com um tema criado pelo produto.
## Instalação
```yaml dependencies:   pakitec_flutter_components:     git:       url: https://github.com/Pakitec/pakitec-flutter-components.git       ref: v0.1.0 ```
## Nimbus
```dart MaterialApp(   theme: PakitecThemes.nimbusLight(),   darkTheme: PakitecThemes.nimbusDark(),   themeMode: ThemeMode.system,   home: const MyHomePage(), ); ```
Os componentes resolvem estilo nesta ordem:
1. Propriedade explícita do widget. 2. Tema Material do componente. 3. `NimbusThemeTokens`, quando aplicável. 4. `ColorScheme` do tema ativo.
## Catálogo
O Dashbook publicado está disponível em:
https://pakitec.github.io/pakitec-flutter-components/
```sh cd example flutter run -d chrome ```
O Dashbook permite alternar entre Nimbus Light e Nimbus Dark pela barra de ferramentas.
## Licença
O repositório é público. A licença de uso comunitário ainda precisa ser formalmente definida pela Pakitec antes da distribuição fora dos projetos autorizados. Leitura tecnica inicial: - A implementacao deve partir do projeto 'pakitec-flutter-components' e preservar os padroes locais detectados. - A demanda do usuario deve ser refinada em criterio de aceite antes de iniciar desenvolvimento. - Antes de executar, rodar pakitec_plan na issue criada para gerar TASK local, branch e contexto de implementacao.
Notas tecnicas informadas no prompt: Consumir pakitec_themes v1.1.0 via Theme.of(context), ColorScheme e NimbusThemeTokens. Preservar APIs claras, acessibilidade e assets com package correto. Prompt original resumido: Migrar todos os componentes públicos do pacote legado pakitec-components para pakitec-flutter-components, tornando-os independentes de tema e compatíveis com Nimbus Light, Nimbus Dark e ThemeData customizado. Aplicar os renomes aprovados: PakiComboField para PakiSelect, PakiInputCalendar para PakiDateField, PakiInputZipCode para PakiZipCodeField, PakiIndicator para PakiStatusIndicator, PakiTextField para PakiRichTextField e consolidar PakiHorizontalDiv/PakiVerticalDiv em PakiDivider.horizontal()/vertical(). Replicar todos os componentes no Dashbook com alternância de tema, testes e documentação.

## Custom Fields

### Detalhes técnicos

Projeto carregado: pakitec-flutter-components Path local analisado: /Volumes/External HD/Projetos/pakitec/pakitec-flutter-components Stack inferida: flutter Estrutura observada: - LICENSE - docs - example - lib - test Arquivos relevantes encontrados: - AGENTS.md - README.md - example/README.md - example/pubspec.yaml - pubspec.yaml
Flutter/pubspec snapshot: name: pakitec_flutter_components description: Componentes Flutter oficiais da Pakitec, independentes de tema. environment:   sdk: '>=3.10.0 <4.0.0'   flutter: '>=3.38.0' dependencies:   flutter:   pakitec_themes: dev_dependencies:   flutter_test:   flutter_lints: ^6.0.0   uses-material-design: true
README snapshot: # Pakitec Flutter Components
Componentes Flutter oficiais da Pakitec. Os widgets consomem o `ThemeData` do aplicativo e funcionam com Nimbus ou com um tema criado pelo produto.
## Instalação
```yaml dependencies:   pakitec_flutter_components:     git:       url: https://github.com/Pakitec/pakitec-flutter-components.git       ref: v0.1.0 ```
## Nimbus
```dart MaterialApp(   theme: PakitecThemes.nimbusLight(),   darkTheme: PakitecThemes.nimbusDark(),   themeMode: ThemeMode.system,   home: const MyHomePage(), ); ```
Os componentes resolvem estilo nesta ordem:
1. Propriedade explícita do widget. 2. Tema Material do componente. 3. `NimbusThemeTokens`, quando aplicável. 4. `ColorScheme` do tema ativo.
## Catálogo
O Dashbook publicado está disponível em:
https://pakitec.github.io/pakitec-flutter-components/
```sh cd example flutter run -d chrome ```
O Dashbook permite alternar entre Nimbus Light e Nimbus Dark pela barra de ferramentas.
## Licença
O repositório é público. A licença de uso comunitário ainda precisa ser formalmente definida pela Pakitec antes da distribuição fora dos projetos autorizados. Leitura tecnica inicial: - A implementacao deve partir do projeto 'pakitec-flutter-components' e preservar os padroes locais detectados. - A demanda do usuario deve ser refinada em criterio de aceite antes de iniciar desenvolvimento. - Antes de executar, rodar pakitec_plan na issue criada para gerar TASK local, branch e contexto de implementacao.
Notas tecnicas informadas no prompt: Consumir pakitec_themes v1.1.0 via Theme.of(context), ColorScheme e NimbusThemeTokens. Preservar APIs claras, acessibilidade e assets com package correto. Prompt original resumido: Migrar todos os componentes públicos do pacote legado pakitec-components para pakitec-flutter-components, tornando-os independentes de tema e compatíveis com Nimbus Light, Nimbus Dark e ThemeData customizado. Aplicar os renomes aprovados: PakiComboField para PakiSelect, PakiInputCalendar para PakiDateField, PakiInputZipCode para PakiZipCodeField, PakiIndicator para PakiStatusIndicator, PakiTextField para PakiRichTextField e consolidar PakiHorizontalDiv/PakiVerticalDiv em PakiDivider.horizontal()/vertical(). Replicar todos os componentes no Dashbook com alternância de tema, testes e documentação.

### Visão do usuário

Migrar todos os componentes públicos do pacote legado pakitec-components para pakitec-flutter-components, tornando-os independentes de tema e compatíveis com Nimbus Light, Nimbus Dark e ThemeData customizado. Aplicar os renomes aprovados: PakiComboField para PakiSelect, PakiInputCalendar para PakiDateField, PakiInputZipCode para PakiZipCodeField, PakiIndicator para PakiStatusIndicator, PakiTextField para PakiRichTextField e consolidar PakiHorizontalDiv/PakiVerticalDiv em PakiDivider.horizontal()/vertical(). Replicar todos os componentes no Dashbook com alternância de tema, testes e documentação.

### Projeto

pakitec-flutter-components

### Regras de negócio

Projetos atuais podem continuar no pacote legado; novos projetos devem usar pakitec_flutter_components. O novo pacote não deve manter aliases legados quando ainda não houver consumidores.

### Classificação

0|i004x3:

## Attachments

- Nenhum anexo.

## Execution Contract

- A historia Jira e a fonte de escopo.
- O Codex deve implementar no projeto em `/Volumes/External HD/Projetos/pakitec/pakitec-flutter-components`.
- Antes de planejar, o campo `Projeto` do Jira deve bater com o repo GitHub carregado na IDE; se nao bater, interromper e avisar que o projeto esta errado.
- `Visao do Usuario` descreve exatamente o comportamento que o usuario precisa ter ao final da historia.
- `Prototipo` pode trazer imagem/fluxo de tela; quando houver front/app, as telas devem seguir a ideia do prototipo.
- `Regras de Negocio` sao obrigatorias para o planejamento e a implementacao; nao entregue nada que contradiga essas regras.
- `Detalhes Tecnicos` complementam o planejamento com notas do desenvolvedor da historia.
- A branch esperada e `feature/scrum-880-migrar-componentes-legados`.
- O arquivo `jira/subtasks.json` mapeia fases SDD para subtarefas Jira.
- Durante a execucao, comentar na subtarefa da fase atual com `pakitec_jiraPostSubtaskProgress` ao iniciar e ao concluir cada fase.
- Use `transitionTo: inProgress` ao iniciar uma fase e `transitionTo: done` ao concluir, quando as transitions estiverem disponiveis.
- Antes de concluir, executar `pakitec_validate_project_structure` no projeto e registrar o resultado na subtarefa `Review/Release`.
- Ao final, comentar no Jira resumo, arquivos alterados, validacoes e pendencias.
