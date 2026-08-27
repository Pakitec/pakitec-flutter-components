<!-- pakitec-sdd:start -->
## Constituição de desenvolvimento

Antes de planejar ou alterar código, leia e siga todos os padrões detectados:

- `docs/sdd/templates/flutter.md`

Regras específicas do projeto escritas fora deste bloco prevalecem quando forem mais restritivas.

### Validação mínima

- `dart format .`
- `flutter analyze`
- `flutter test`

### Jira

Este workspace está vinculado ao projeto Pakitec (`SCRUM`) no Jira. Features e
mudanças de comportamento devem manter rastreabilidade entre issue, spec,
implementação, validação e release.

### Biblioteca de componentes

- Widgets públicos devem resolver aparência a partir do `ThemeData` ativo e de
  propriedades explícitas; não devem fixar o modo claro ou escuro.
- Nimbus Light e Nimbus Dark são as referências visuais oficiais, fornecidas por
  `pakitec_themes`, sem impedir o uso de um `ThemeData` próprio do consumidor.
- Integrações externas, como consulta de CEP e impressão, entram por callback;
  o pacote não escolhe cliente HTTP, backend ou infraestrutura do aplicativo.
- O package permanece em `lib/src/widgets/`, exposto somente pelo barrel
  `lib/pakitec_flutter_components.dart`. O aplicativo de catálogo fica em
  `example/`.
<!-- pakitec-sdd:end -->
