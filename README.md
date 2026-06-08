# SGFilialTransfer Updates

Repositorio de atualizacao do SGFilialTransfer.

Publique esta pasta em um endereco HTTPS. Exemplo com GitHub Pages:

1. Crie um repositorio chamado `sgfilialtransfer-updates`.
2. Envie todo o conteudo desta pasta para o repositorio.
3. Ative GitHub Pages usando a branch `main` e a pasta raiz.
4. A URL do manifesto ficara parecida com:

   `https://SEU_USUARIO.github.io/sgfilialtransfer-updates/manifest.json`

No cliente, configure essa URL no `AppConfig.json`:

```json
"Update": {
  "AutoUpdateEnabled": true,
  "ManifestUrl": "https://SEU_USUARIO.github.io/sgfilialtransfer-updates/manifest.json",
  "CheckIntervalHours": 6
}
```

Quando existir uma versao maior no `manifest.json`, o aplicativo baixa o instalador, valida o SHA256 e instala automaticamente em `C:\SGBR\SGFilial`.
