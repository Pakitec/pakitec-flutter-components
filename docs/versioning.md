# Versionamento e releases

O `pakitec_flutter_components` segue Semantic Versioning e publica tags Git no
formato `vMAJOR.MINOR.PATCH`.

- `MAJOR`: remoção ou alteração incompatível da API pública.
- `MINOR`: novos componentes ou propriedades compatíveis.
- `PATCH`: correções compatíveis.

Antes de publicar, atualize `pubspec.yaml` e `CHANGELOG.md`, execute as
validações do projeto e crie uma tag anotada:

```sh
git tag -a v0.1.0 -m "Release v0.1.0"
git push origin v0.1.0
```

Tags publicadas são imutáveis e não devem ser reutilizadas.
