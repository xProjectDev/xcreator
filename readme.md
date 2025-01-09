# iCreator Script Documentation

## Description
**iCreator** est un script permettant aux joueurs de personnaliser leurs personnages avec un créateur d'apparences intégré. Il supporte les frameworks **ESX** et **QB-Core**, et est conçu pour assurer une compatibilité flexible entre différents gestionnaires de skins (comme `esx_skin`, `fivem-appearance`, etc.).

---

## Événement Principal : Ouvrir le Créateur

Vous pouvez utiliser l’événement suivant pour ouvrir le créateur de personnage :

```lua
TriggerClientEvent('iCreator:openCreator', <playerId>, <additionalData>, true)
```

### Arguments :
- **playerId** : L'ID du joueur cible.
- **additionalData** : (Optionnel) Données supplémentaires (le sexe du joueur par défaut 0 / 1).
- **true** : Cet argument définit si le créateur doit s'ouvrir.

#### Exemple :
```lua
TriggerClientEvent('iCreator:openCreator', 1, 0, true)
```

Ce déclenchement peut être utilisé à partir du serveur pour n'importe quel joueur.

---

## Commande Admin Pour Ouvrir le Créateur

Le script permet aussi d'utiliser une commande admin configurable pour ouvrir le créateur. Voici les détails pour chaque framework :

### ESX
- Commande : `/creator <playerId>`
- Exemple d'utilisation dans le chat :
  ```text
  /creator 1
  ```

### QB-Core
- Commande : `/creator <playerId>`
- Exemple d'utilisation dans le chat :
  ```text
  /creator 1
  ```

---

## Exemple : Déclencher le Créateur

### 1. Côté Serveur

#### Avec ESX
Voici un exemple pour ouvrir le créateur de personnage lorsqu'un joueur spawn depuis le serveur :

```lua
AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
    MySQL.Async.fetchScalar('SELECT skin FROM users WHERE identifier = @identifier', {
        ['@identifier'] = xPlayer.identifier
    }, function(skin)
        if not skin then
            -- Si le joueur n'a pas de skin, ouvrir le créateur
            TriggerClientEvent('iCreator:openCreator', playerId, 0, false)
        end
    end)
end)
```

#### Avec QB-Core
Pour QB-Core, vous pouvez utiliser l'événement `QBCore:Server:PlayerLoaded` :

```lua
AddEventHandler('QBCore:Server:PlayerLoaded', function(player)
    local Player = QBCore.Functions.GetPlayer(player)
    
    local result = MySQL.query.await('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', {Player.PlayerData.citizenid, 1})
    if not result[1] then
        -- Si aucun skin actif n'est trouvé, ouvrir le créateur
        TriggerClientEvent('iCreator:openCreator', player, 0, false)
    end
end)
```

---

### 2. Côté Client

#### Avec ESX
Depuis le côté client, vous pouvez ouvrir directement le créateur avec cette logique :

```lua
RegisterNetEvent('esx:playerLoaded', function()
    ESX.TriggerServerCallback("esx_skin:getPlayerSkin", function(skin)
        if skin == nil then
            TriggerEvent('iCreator:openCreator', 0, false)
            Wait(100)
        else
            TriggerEvent("skinchanger:loadSkin", skin)
            Wait(100)
        end
    end)
end)
```
---

## Crédits
Développé par [xProject](https://discord.gg/xSdjj9N5MQ) / **@__ismael**