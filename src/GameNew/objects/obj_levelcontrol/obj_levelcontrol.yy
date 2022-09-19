{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "obj_levelcontrol",
  "spriteId": {
    "name": "spr_control",
    "path": "sprites/spr_control/spr_control.yy",
  },
  "solid": false,
  "visible": false,
  "managed": true,
  "spriteMaskId": null,
  "persistent": false,
  "parentObjectId": {
    "name": "par_alwaysactive",
    "path": "objects/par_alwaysactive/par_alwaysactive.yy",
  },
  "physicsObject": false,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsGroup": 1,
  "physicsDensity": 0.5,
  "physicsRestitution": 0.1,
  "physicsLinearDamping": 0.1,
  "physicsAngularDamping": 0.1,
  "physicsFriction": 0.2,
  "physicsStartAwake": true,
  "physicsKinematic": false,
  "physicsShapePoints": [],
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":0,"eventType":2,"collisionObjectId":null,},
  ],
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"levelbiome","varType":6,"value":"biome.plains","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[
        "biome.plains",
        "biome.forest",
        "biome.bog",
      ],"multiselect":false,"filters":[],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"inside","varType":3,"value":"False","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"cave","varType":3,"value":"0","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"loopAudio[0]","varType":5,"value":"snd_none","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[
        "GMSound",
      ],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"loopAudio[1]","varType":5,"value":"snd_none","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[
        "GMSound",
      ],},
  ],
  "overriddenProperties": [],
  "parent": {
    "name": "Important Objects",
    "path": "folders/Objects/Important Objects.yy",
  },
}