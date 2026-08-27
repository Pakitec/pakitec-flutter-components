# Pakitec Build Handoff: SCRUM-880 - migrar-componentes-legados

Voce esta no projeto `/Volumes/External HD/Projetos/pakitec/pakitec-flutter-components`, na branch `feature/scrum-880-migrar-componentes-legados`.

Este arquivo foi gerado pelo `pakitec_plan`. Ele e um pacote de contexto para uma execucao futura, nao uma ordem para iniciar desenvolvimento agora.

Nao implemente esta historia apenas porque este arquivo foi criado. Para iniciar desenvolvimento com agentes, execute `pakitec_build` separadamente para a issue `SCRUM-880`.

Quando `pakitec_build` for chamado, use estes arquivos como fonte:

- `docs/pakitec/specs/TASK-001-scrum-880-migrar-componentes-legados/jira-context.md`
- `docs/pakitec/specs/TASK-001-scrum-880-migrar-componentes-legados/jira-subtasks.md`
- `docs/pakitec/specs/TASK-001-scrum-880-migrar-componentes-legados/jira/subtasks.json`
- `docs/pakitec/specs/TASK-001-scrum-880-migrar-componentes-legados/spec.md`
- `docs/pakitec/specs/TASK-001-scrum-880-migrar-componentes-legados/plan.md`
- `docs/pakitec/specs/TASK-001-scrum-880-migrar-componentes-legados/tasks.md`
- `docs/pakitec/specs/TASK-001-scrum-880-migrar-componentes-legados/research.md`

## Jira SDD Subtasks

- Spec: SCRUM-881 | SDD Spec | https://pakitec.atlassian.net/browse/SCRUM-881
- Plan: SCRUM-882 | SDD Plan | https://pakitec.atlassian.net/browse/SCRUM-882
- Implementation: SCRUM-883 | Implementacao | https://pakitec.atlassian.net/browse/SCRUM-883
- Tests: SCRUM-884 | Testes e validacao | https://pakitec.atlassian.net/browse/SCRUM-884
- Review/Release: SCRUM-885 | Review e entrega | https://pakitec.atlassian.net/browse/SCRUM-885

Antes de editar:

1. Leia `AGENTS.md`, `docs/pakitec-project-context.md` e `docs/pakitec/constitution.md`.
2. Confirme que o campo `Projeto` do Jira (`pakitec-flutter-components`) bate com o repo GitHub carregado na IDE; se nao bater, interrompa e informe que o projeto esta errado.
3. Leia a historia, criterios de aceite, `Visao do Usuario`, `Prototipo`, `Regras de Negocio`, `Detalhes Tecnicos`, campos customizados e anexos.
4. Mapeie os arquivos impactados e atualize `plan.md`/`tasks.md` se necessario.

## Campos Jira obrigatorios para o planejamento e build

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

Durante a execucao iniciada por `pakitec_build`:

- Preserve os padroes do projeto.
- Nao implemente escopo fora da historia Jira sem registrar decisao.
- Para front/app, quando `Prototipo` trouxer imagem ou fluxo de tela, desenhe a UI seguindo a ideia dele.
- Nao entregue comportamento que contrarie `Regras de Negocio`.
- Atualize `tasks.md` conforme concluir etapas.
- E obrigatorio atualizar a subtarefa Jira da fase atual ao iniciar e ao concluir cada fase SDD.
- Para iniciar uma fase, chame `pakitec_jiraPostSubtaskProgress` com `taskDirectory` apontando para `docs/pakitec/specs/TASK-001-scrum-880-migrar-componentes-legados`, `phase` igual a `Spec`, `Plan`, `Implementation`, `Tests` ou `Review/Release`, `summary` descrevendo o inicio do trabalho e `transitionTo` como `inProgress` quando a transition estiver disponivel.
- Para concluir uma fase, chame `pakitec_jiraPostSubtaskProgress` novamente com resumo do que foi feito, arquivos alterados, validacoes executadas, bloqueios/pendencias e `transitionTo` como `done` quando a fase estiver realmente concluida.
- Se a fase bloquear por falta de informacao, comente na subtarefa correspondente com `blockers` preenchido e nao avance para a proxima fase sem registrar a decisao.
- Use `pakitec_jiraPostProgress` apenas para comentarios gerais na historia principal.

Antes de finalizar:

- Rode testes/lints/checks adequados ao projeto.
- Na fase `Tests`, se o projeto tiver Flutter Web, Angular, React/Vite ou Swagger/OpenAPI configurado, chame `pakitec_qaCollectWebEvidence` com `projectPath`, `taskDirectory` e `phase: "Tests"` para tentar rodar localmente, capturar prints e anexar evidencias na subtarefa Jira. Se a coleta falhar por falta de browser automation ou upload, registre o fallback; se o app nao rodar, avalie como bug de QA.
- Compare o que foi feito com `Visao do Usuario` e registre se o comportamento entregue bate com o que o usuario queria.
- Execute obrigatoriamente `pakitec_validate_project_structure` para o `projectPath` e `stack` desta tarefa antes de considerar a entrega concluida.
- Se `pakitec_validate_project_structure` retornar violacoes, corrija ou registre explicitamente o motivo antes de finalizar.
- Registre validacoes executadas.
- Garanta que as subtarefas `Spec`, `Plan`, `Implementation`, `Tests` e `Review/Release` tenham comentario final atualizado.
- No comentario final da subtarefa `Review/Release`, inclua o resultado de `pakitec_validate_project_structure`.
- Comente na historia principal apenas o resumo final, arquivos alterados, validacoes, comparacao com `Visao do Usuario`, resultado de `pakitec_validate_project_structure` e pendencias.
