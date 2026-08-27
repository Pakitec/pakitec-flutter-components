# Feature Specification: migrar-componentes-legados

**Feature ID**: `TASK-001`  
**Jira Issue**: `SCRUM-880`  
**Stack**: `flutter`  
**Status**: Approved  
**Created**: 2026-08-27  
**Source**: https://pakitec.atlassian.net/browse/SCRUM-880
**Projeto Jira/GitHub**: pakitec-flutter-components

## Objetivo

Migrar componentes legados para o novo pacote Flutter temável

## Historia Jira

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

## Criterios de Aceite

- Todos os componentes publicos uteis do pacote legado possuem equivalente no novo pacote.
- Nenhum componente novo depende de cores globais fixas do tema legado.
- O Dashbook permite alternar entre Nimbus Light e Nimbus Dark.
- Os componentes funcionam tambem com `ThemeData` customizado.
- `PakiSelect` substitui `PakiComboField`.
- `PakiDivider` oferece construtores `horizontal` e `vertical`.
- `flutter analyze`, `flutter test` e o build Web do Dashbook passam.
- README e Dashbook documentam todos os componentes disponiveis.

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

## Campos Customizados

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

## Anexos

- Nenhum anexo.

## Requisitos Funcionais

- **FR-001**: Implementar o comportamento descrito na historia `SCRUM-880`.
- **FR-002**: Entregar exatamente a necessidade descrita em `Visao do Usuario`.
- **FR-003**: Seguir o `Prototipo` quando houver telas/fluxos de front ou app.
- **FR-004**: Cumprir todas as `Regras de Negocio` sem criar comportamento contraditorio.
- **FR-005**: Considerar os `Detalhes Tecnicos` no planejamento e preservar compatibilidade com os fluxos existentes do projeto.

## Edge Cases

- Dados incompletos ou antigos relacionados a historia.
- Falha de rede/API quando o fluxo depender de integracoes externas.
- Usuario sem permissao para executar a acao principal.

## Criterios de Sucesso

- **SC-001**: Todos os criterios de aceite da historia Jira foram atendidos.
- **SC-002**: Testes/validacoes definidos em `plan.md` foram executados.
- **SC-003**: O comportamento entregue foi comparado com `Visao do Usuario` antes da conclusao.
- **SC-004**: Jira recebeu comentario final com resumo, validacoes e pendencias.

## Fora de Escopo

- Mudancas nao descritas na historia Jira ou nos comentarios/criterios aceitos.
- Manter aliases com os nomes legados no pacote novo.
- Alterar o comportamento do pacote legado.

## Assumptions

- A historia Jira e a fonte oficial de escopo.
- O campo `Projeto` deve bater com o repo GitHub carregado antes de qualquer planejamento.
- Campos customizados e anexos complementam, mas nao substituem, os criterios de aceite.
