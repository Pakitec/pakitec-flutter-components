# Tasks: migrar-componentes-legados

**Feature ID**: `TASK-001`  
**Jira Issue**: `SCRUM-880`  
**Branch**: `feature/scrum-880-migrar-componentes-legados`  
**Projeto Jira/GitHub**: pakitec-flutter-components
**Input**: `spec.md`, `plan.md`, `jira-context.md`

## Phase 1: SDD Mapping

- [x] T001 Ler `AGENTS.md`, constituicao e padrao Flutter.
- [x] T002 Confirmar que o campo `Projeto` do Jira bate com o repo GitHub carregado.
- [x] T003 Revisar contexto Jira, criterios aprovados e campos obrigatorios.
- [x] T004 Confirmar arquivos impactados no projeto antes de editar.

## Phase 2: Implementation

- [x] T010 Migrar componentes estruturais e de feedback.
- [x] T011 Migrar campos com `PakiSelect`, `PakiDateField` e `PakiZipCodeField`.
- [x] T012 Migrar dialogs, rich text, color picker, lista editavel e utilitarios.
- [x] T013 Exportar somente a nova API publica, sem aliases legados.
- [x] T014 Replicar todos os componentes no Dashbook Nimbus Light/Dark.
- [x] T015 Documentar matriz legado -> novo e preparar release.

## Phase 3: Validation

- [x] T020 Rodar testes/lints/checks definidos em `plan.md`.
- [x] T021 Validar manualmente os criterios de aceite.
- [x] T022 Comparar o que foi feito com `Visao do Usuario` e registrar se o comportamento bate com o pedido.
- [x] T023 Conferir que nenhuma `Regra de Negocio` foi violada.
- [x] T024 Executar `pakitec_validate_project_structure` para este projeto.
- [x] T025 Registrar no Jira arquivos alterados, validacoes, comparacao com `Visao do Usuario`, resultado de `pakitec_validate_project_structure` e pendencias.

## Notes

- Use a branch `feature/scrum-880-migrar-componentes-legados`.
- Nao marque a historia como concluida sem evidencia de validacao.
- Se houver duvida de escopo, comente no Jira antes de expandir a implementacao.
- O validador estrutural foi executado, mas aplica regras de aplicativo a um
  package Flutter: exige `lib/main.dart`, `android/`, `ios/` e `assets/`, e
  sinaliza incorretamente o diretório convencional `lib/src/`. Essas ocorrências
  são falsos positivos para este repositório de biblioteca; a estrutura do
  package foi validada por `flutter analyze`, `flutter test` e build do exemplo.
