# Implementation Plan: migrar-componentes-legados

**Feature ID**: `TASK-001`  
**Jira Issue**: `SCRUM-880`  
**Spec**: `spec.md`  
**Stack**: `flutter`
**Projeto Jira/GitHub**: pakitec-flutter-components

## Contexto

Implementar a historia Jira `SCRUM-880` seguindo o contexto Pakitec do projeto:

- `AGENTS.md`
- `docs/pakitec-project-context.md`
- `docs/pakitec/constitution.md`
- `docs/pakitec/specs/TASK-001-scrum-880-migrar-componentes-legados/jira-context.md`

## Abordagem

1. Confirmar que `Projeto` do Jira bate com o repo GitHub carregado na IDE; se nao bater, interromper.
2. Ler historia, criterios de aceite, `Visao do Usuario`, `Prototipo`, `Regras de Negocio`, `Detalhes Tecnicos` e anexos.
3. Mapear arquivos impactados antes de editar codigo.
4. Implementar em passos pequenos, preservando padroes locais.
5. Conferir o comportamento entregue contra `Visao do Usuario` e `Regras de Negocio`.
6. Rodar testes/lints relevantes.
7. Atualizar Jira com progresso, validacoes e pendencias.

## Contexto Jira para Planejamento

### Visao do Usuario

Migrar todos os componentes públicos do pacote legado pakitec-components para pakitec-flutter-components, tornando-os independentes de tema e compatíveis com Nimbus Light, Nimbus Dark e ThemeData customizado. Aplicar os renomes aprovados: PakiComboField para PakiSelect, PakiInputCalendar para PakiDateField, PakiInputZipCode para PakiZipCodeField, PakiIndicator para PakiStatusIndicator, PakiTextField para PakiRichTextField e consolidar PakiHorizontalDiv/PakiVerticalDiv em PakiDivider.horizontal()/vertical(). Replicar todos os componentes no Dashbook com alternância de tema, testes e documentação.

### Prototipo

- Nenhum prototipo informado.

### Regras de Negocio

Projetos atuais podem continuar no pacote legado; novos projetos devem usar pakitec_flutter_components. O novo pacote não deve manter aliases legados quando ainda não houver consumidores.

### Detalhes Tecnicos

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

## Areas Impactadas

- `lib/src/widgets/`: componentes temaveis e APIs renomeadas.
- `lib/pakitec_flutter_components.dart`: superficie publica do pacote.
- `example/lib/main.dart`: historias Dashbook para todos os componentes.
- `pubspec.yaml` e `example/pubspec.yaml`: dependencias necessarias.
- `test/`: matriz Nimbus Light, Nimbus Dark e tema customizado.
- `README.md` e `CHANGELOG.md`: catalogo, migracao e release.

## Validacoes

- `dart format .`
- `flutter analyze`
- `flutter test`
- `cd example && flutter analyze && flutter test && flutter build web --base-href /pakitec-flutter-components/`
- `pakitec_validate_project_structure` quando houver mudanca estrutural.

## Riscos

- Campo customizado ou anexo pode conter requisito nao refletido na descricao principal.
- Implementar no projeto errado invalida a entrega; conferir o repo antes de planejar.
- Prototipo pode ser opcional, mas quando existir deve guiar telas/fluxos de front ou app.
- Status/transitions do Jira podem variar por projeto.
- Subtasks geradas sao fases SDD e podem precisar de detalhamento adicional durante a implementacao.
- Dependencias de terceiros do legado podem nao acompanhar o tema; encapsular ou substituir quando possivel.
- O campo de CEP mistura rede e UI; expor callback/lookup injetavel para manter o componente testavel.
