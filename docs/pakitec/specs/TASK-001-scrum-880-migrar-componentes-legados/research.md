# Research: migrar-componentes-legados

**Feature ID**: `TASK-001`  
**Jira Issue**: `SCRUM-880`

## Jira Source

- URL: https://pakitec.atlassian.net/browse/SCRUM-880
- Status inicial: A fazer
- Assignee: Unassigned
- Projeto Jira/GitHub: pakitec-flutter-components
- Labels:
- design-system
- flutter
- nimbus
- pakitec-task

## Campos de Produto/Tecnicos

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

## Decisoes

- Componentes resolvem estilo por propriedade explicita, tema Material, `NimbusThemeTokens` e `ColorScheme`.
- O pacote novo nao exporta aliases com nomes legados.
- `PakiDivider` consolida orientacoes horizontal e vertical.
- `PakiSelect` substitui o termo combo e aceita generics.
- Integracoes externas devem ser injetaveis; widgets nao controlam servicos globais.

## Perguntas Pendentes

- Licenca publica do repositorio ainda depende de decisao juridica da Pakitec e nao bloqueia a migracao tecnica.

## Referencias

- `jira-context.md`
- `spec.md`
- `plan.md`
- Anexos em `jira/attachments/`
