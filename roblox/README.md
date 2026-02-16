# Selector de personajes para Roblox

Este ejemplo crea una interfaz para elegir personaje al iniciar la partida.

## Estructura

- `ReplicatedStorage/CharacterCatalog.lua`: catálogo de personajes editables.
- `ServerScriptService/CharacterSelectServer.server.lua`: recibe la selección y aplica apariencia.
- `StarterGui/CharacterSelection.client.lua`: genera la UI y envía la opción elegida.

## Cómo usarlo

1. Abre Roblox Studio.
2. Copia `CharacterCatalog.lua` dentro de `ReplicatedStorage`.
3. Copia `CharacterSelectServer.server.lua` dentro de `ServerScriptService`.
4. Copia `CharacterSelection.client.lua` dentro de `StarterGui`.
5. Ejecuta el juego en modo Play y elige un personaje.

## Personalizar personajes

En `CharacterCatalog.lua` puedes:

- Cambiar `displayName` y `description`.
- Cambiar `shirtTemplate` y `pantsTemplate` por IDs de tus assets.
- Ajustar `bodyColor` para modificar el color base del avatar.
