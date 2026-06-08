# SGFilialTransfer Updates

Repositorio de atualizacao do SGFilialTransfer.

Este repositorio usa dois enderecos:

- `manifest.json` fica no GitHub, acessado via `raw.githubusercontent.com`.
- O instalador grande fica em GitHub Releases.

A URL do manifesto atual:

`https://raw.githubusercontent.com/PaullorGuilherme/sgfilialtransfer-updates/main/manifest.json`

No cliente, configure essa URL no `AppConfig.json`:

```json
"Update": {
  "AutoUpdateEnabled": true,
  "ManifestUrl": "https://raw.githubusercontent.com/PaullorGuilherme/sgfilialtransfer-updates/main/manifest.json",
  "CheckIntervalHours": 6
}
```

Quando existir uma versao maior no `manifest.json`, o aplicativo baixa o instalador, valida o SHA256 e instala automaticamente em `C:\SGBR\SGFilial`.
