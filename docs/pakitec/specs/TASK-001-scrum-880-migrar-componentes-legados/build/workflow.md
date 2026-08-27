# Pakitec Build Workflow: SCRUM-880

Projeto: /Volumes/External HD/Projetos/pakitec/pakitec-flutter-components
TASK: /Volumes/External HD/Projetos/pakitec/pakitec-flutter-components/docs/pakitec/specs/TASK-001-scrum-880-migrar-componentes-legados

## Fases

### SDD Orquestracao
- Status: pending
- Agentes: sdd-orchestrator
- Subtarefas Jira: Spec: SCRUM-881, Plan: SCRUM-882

### SDD Implementacao
- Status: pending
- Agentes: sdd-implementer
- Subtarefas Jira: Implementation: SCRUM-883

### SDD QA Validacao
- Status: pending
- Agentes: sdd-qa-reviewer
- Subtarefas Jira: Tests: SCRUM-884

### SDD Revisao Constitucional
- Status: pending
- Agentes: sdd-constitution
- Subtarefas Jira: Review/Release: SCRUM-885

### SDD Release
- Status: pending
- Agentes: sdd-planner
- Subtarefas Jira: Review/Release: SCRUM-885

## Regras

- Nao concluir a historia principal automaticamente.
- Se sdd-qa-reviewer encontrar bug, state volta para SDD Implementacao com bug registrado.
- Limite de 3 ciclos de correcao.
- Use somente subagentes SDD de .claude/agents no workflow de build.
- sdd-orchestrator deve validar regras de negocio e visao do usuario antes do release.
- Use as tools pakitec_build_next, _start_role, _finish_role, _block_role.
- Siga o workflow Pakitec completo sem pedir confirmacao entre fases.
- Para cada fase: execute pakitec_build_start_role, realize o trabalho necessario, rode as validacoes cabiveis, execute pakitec_build_finish_role com evidencias e avance automaticamente para a proxima fase.
- So pare para chamar o usuario se houver bloqueio real, duvida de escopo que possa alterar regra de negocio, falha de teste/build que voce nao consiga corrigir, ou risco de sobrescrever mudanca de outra pessoa.