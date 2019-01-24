package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.getDefinitionByName;
   
   public class §_-SC§ extends Tower
   {
      
      public static const §_-5C§:int = 0;
      
      public static const §_-KC§:int = 1;
      
      public static const §_-S§:int = 2;
      
      public static const §_-AC§:int = 3;
      
      public static const §_-Kc§:int = 4;
      
      public static const §_-63§:int = 5;
       
      
      private var bombType:String;
      
      public var charging:Boolean = false;
      
      public var §_-7L§:int = 34;
      
      public var §_-Ce§:int = 24;
      
      public var §_-BL§:int = 0;
      
      public var bombDestiny:Point;
      
      public function §_-SC§(param1:int, param2:int, param3:Point)
      {
         this.bombDestiny = new Point();
         super(param1,param2,param3);
         this.§_-3F§ = "engineer";
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.§_-5S§ = false;
         this.§_-6p§ = this.§_-6p§ + this.getCost(this.cRoot.gameSettings.engineers.level1.cost);
         this.cRoot.updateCash(-this.getCost(this.cRoot.gameSettings.engineers.level1.cost));
         this.building = true;
         this.buildingTime = this.cRoot.gameSettings.buildingTime;
         this.§_-2I§ = 0;
         this.§_-GI§(new §_-G7§());
         this.§_-FH§ = new §_-NQ§(-17,-41,this.buildingTime);
         this.getGraphic().addChild(this.§_-FH§);
         this.§_-RT§(new §_-HT§());
         this.§_-IP§ = new Point(this.x,this.y - 45);
         this.§_-Fl§ = new Point(this.x,this.y - 45);
         this.addEventListener(MouseEvent.ROLL_OVER,rollOverEvents,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,rollOutEvents,false,0,true);
      }
      
      override public function onFrameUpdate() : void
      {
         if(this.isDisabled)
         {
            return;
         }
         if(this.§_-OW§())
         {
            return;
         }
         this.§ if§();
         this.runSpecialTimers();
         if(this.charging)
         {
            this.§_-BL§++;
            if(this.§_-BL§ == this.§_-7L§)
            {
               this.§_-BL§ = 0;
               this.charging = false;
            }
            if(this.§_-BL§ == this.§_-7L§ - this.§_-Ce§)
            {
               this.shoot();
            }
         }
         else
         {
            if(this.runSpecial())
            {
               return;
            }
            this.§_-Ac§();
            if(this.§_-Nw§)
            {
               if(this.findNewTarget(this.cRoot.gameSettings.enemyMaxLevel,this.§_-5S§))
               {
                  this.§_-3g§();
               }
            }
         }
      }
      
      override public function pause() : void
      {
         if(this.building)
         {
            return;
         }
         if(MovieClip(this.getGraphic()).currentFrameLabel != "idle")
         {
            this.getGraphic().stop();
         }
         this.§_-f§();
         this.pauseSpecial();
      }
      
      public function pauseSpecial() : void
      {
      }
      
      override public function unPause() : void
      {
         if(this.building)
         {
            return;
         }
         if(MovieClip(this.getGraphic()).currentFrameLabel != "idle")
         {
            this.getGraphic().play();
         }
         this.§_-MJ§();
         this.unPauseSpecial();
      }
      
      public function unPauseSpecial() : void
      {
      }
      
      override public function getInfo() : Object
      {
         var _loc1_:Object = {};
         _loc1_.tName = Locale.loadStringEx("TOWER_ENGINEERS_NAME",Locale.getDefaultLang());
         _loc1_.tIconName = this.§_-3F§;
         _loc1_.tRangeHeight = this.rangeHeight;
         _loc1_.tRangeWidth = this.rangeWidth;
         _loc1_.tReload = this.reloadTime + this.§_-7L§;
         this.getDamageInfo(_loc1_);
         return _loc1_;
      }
      
      public function runSpecial() : Boolean
      {
         return false;
      }
      
      public function runSpecialTimers() : void
      {
      }
      
      public function clickEvent(param1:MouseEvent) : void
      {
         if(this.isDisabled)
         {
            return;
         }
         if(!this.cRoot.enableElements)
         {
            return;
         }
         this.cRoot.menu.showTowerInfo(this);
         this.displayTowerMenu();
      }
      
      public function §_-3g§() : *
      {
         this.getGraphic().gotoAndPlay("shoot");
         this.charging = true;
         this.§_-Nw§ = false;
         this.bombDestiny.x = this.target.road[this.target.currentNode + this.target.getNodesSpeed()].x;
         this.bombDestiny.y = this.target.road[this.target.currentNode + this.target.getNodesSpeed()].y;
      }
      
      override public function shoot() : void
      {
         if(this.target == null || !this.target.isActive)
         {
            if(this.findNewTarget(this.cRoot.gameSettings.enemyMaxLevel,this.§_-5S§))
            {
               this.bombDestiny.x = this.target.road[this.target.currentNode + this.target.getNodesSpeed()].x;
               this.bombDestiny.y = this.target.road[this.target.currentNode + this.target.getNodesSpeed()].y;
            }
         }
         else if(this.target.isBlocked)
         {
            this.bombDestiny.x = this.target.x;
            this.bombDestiny.y = this.target.y;
         }
         this.shootsTotal++;
         var _loc1_:Class = getDefinitionByName(this.bombType) as Class;
         this.cRoot.bullets.addChild(new _loc1_(this.level,this.§_-IP§,this.bombDestiny));
      }
      
      override public function onRange(param1:Enemy) : Boolean
      {
         return this.§_-R§(new Point(param1.road[param1.currentNode + param1.getNodesSpeed()].x,param1.road[param1.currentNode + param1.getNodesSpeed()].y));
      }
      
      override public function checkMenuRollOverAction(param1:String) : void
      {
         switch(param1)
         {
            case "level_1":
               this.showRangeNew(this.cRoot.gameSettings.engineers.level1.range,this.cRoot.gameSettings.engineers.level1.range * this.cRoot.gameSettings.rangeRatio);
               break;
            case "level_2":
               this.showRangeNew(this.cRoot.gameSettings.engineers.level2.range,this.cRoot.gameSettings.engineers.level2.range * this.cRoot.gameSettings.rangeRatio);
               break;
            case "level_3":
               this.showRangeNew(this.cRoot.gameSettings.engineers.level3.range,this.cRoot.gameSettings.engineers.level3.range * this.cRoot.gameSettings.rangeRatio);
               break;
            case "level_tesla":
               this.showRangeNew(this.cRoot.gameSettings.engineers.tesla.range,this.cRoot.gameSettings.engineers.tesla.range * this.cRoot.gameSettings.rangeRatio);
               break;
            case "level_bertha":
               this.showRangeNew(this.cRoot.gameSettings.engineers.bfg.range,this.cRoot.gameSettings.engineers.bfg.range * this.cRoot.gameSettings.rangeRatio);
         }
      }
      
      protected function getCost(param1:int) : int
      {
         if(this.cRoot.game.gameUpgrades.engineersUpFieldLogistics == true && (this.cRoot.maxUpgradeLevel == 0 || this.cRoot.maxUpgradeLevel >= 3))
         {
            return Math.ceil(param1 - param1 * 0.1);
         }
         return param1;
      }
      
      override public function displayTowerMenu() : void
      {
         if(this.cRoot.quickMenu.cTower == this)
         {
            this.cRoot.forceFreeQuickMenu();
            return;
         }
         var _loc1_:String = Locale.getDefaultLang();
         switch(this.currentLevel)
         {
            case "level_1":
               MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,true,50,true,new Array(new Array("level_2","lv_up",this.getCost(this.cRoot.gameSettings.engineers.level2.cost),this.cRoot.isTowerLocked(GameSettings.§_-Ko§,2),0,0,0,7,"TooltipBasic",{
                  "title":Locale.loadStringEx("TOWER_ENGINEERS_UPGRADE_LEVEL2_NAME",_loc1_),
                  "text":Locale.loadStringEx("TOWER_ENGINEERS_UPGRADE_LEVEL2_DESCRIPTION",_loc1_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc1_),this.cRoot.gameSettings.engineers.level2.minDamage + "-" + this.cRoot.gameSettings.engineers.level2.maxDamage,this.getColor(this.cRoot.gameSettings.engineers.level1.maxDamage,this.cRoot.gameSettings.engineers.level2.maxDamage)],[Locale.loadStringEx("C_RELOAD",_loc1_),this.cRoot.gameSettings.getReloadString(this.cRoot.gameSettings.engineers.level2.reload / this.cRoot.gameSettings.framesRate),this.getColor(this.cRoot.gameSettings.engineers.level1.reload,this.cRoot.gameSettings.engineers.level2.reload,true)]]
               })));
               break;
            case "level_2":
               MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,true,50,true,new Array(new Array("level_3","lv_up",this.getCost(this.cRoot.gameSettings.engineers.level3.cost),this.cRoot.isTowerLocked(GameSettings.§_-Ko§,3),0,0,0,7,"TooltipBasic",{
                  "title":Locale.loadStringEx("TOWER_ENGINEERS_UPGRADE_LEVEL3_NAME",_loc1_),
                  "text":Locale.loadStringEx("TOWER_ENGINEERS_UPGRADE_LEVEL3_DESCRIPTION",_loc1_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc1_),this.cRoot.gameSettings.engineers.level3.minDamage + "-" + this.cRoot.gameSettings.engineers.level3.maxDamage,this.getColor(this.cRoot.gameSettings.engineers.level2.maxDamage,this.cRoot.gameSettings.engineers.level3.maxDamage)],[Locale.loadStringEx("C_RELOAD",_loc1_),this.cRoot.gameSettings.getReloadString(this.cRoot.gameSettings.engineers.level3.reload / this.cRoot.gameSettings.framesRate),this.getColor(this.cRoot.gameSettings.engineers.level2.reload,this.cRoot.gameSettings.engineers.level3.reload,true)]]
               })));
               break;
            case "level_3":
               MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,true,50,true,new Array(new Array("level_tesla","tw_tesla",this.getCost(this.cRoot.gameSettings.engineers.tesla.cost),this.cRoot.isTowerLocked(GameSettings.§_-Ko§,5),0,0,0,1,"TooltipBasic",{
                  "title":Locale.loadStringEx("TOWER_TESLA_NAME",_loc1_),
                  "text":Locale.loadStringEx("TOWER_TESLA_DESCRIPTION",_loc1_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc1_),this.cRoot.gameSettings.engineers.tesla.minDamage + "-" + this.cRoot.gameSettings.engineers.tesla.maxDamage,this.getColor(this.cRoot.gameSettings.engineers.level3.maxDamage,this.cRoot.gameSettings.engineers.tesla.maxDamage)],[Locale.loadStringEx("C_RELOAD",_loc1_),this.cRoot.gameSettings.getReloadString(this.cRoot.gameSettings.engineers.tesla.reload / this.cRoot.gameSettings.framesRate),this.getColor(this.cRoot.gameSettings.engineers.level3.reload,this.cRoot.gameSettings.engineers.tesla.reload,true)]],
                  "extras":[Locale.loadStringEx("TOWER_TESLA_CHARGED_BOLT_NAME",_loc1_),Locale.loadStringEx("TOWER_TESLA_OVERCHARGE_NAME",_loc1_)]
               }),new Array("level_bertha","tw_bfg",this.getCost(this.cRoot.gameSettings.engineers.bfg.cost),this.cRoot.isTowerLocked(GameSettings.§_-Ko§,4),0,0,0,2,"TooltipBasic",{
                  "title":Locale.loadStringEx("TOWER_BFG_NAME",_loc1_),
                  "text":Locale.loadStringEx("TOWER_BFG_DESCRIPTION",_loc1_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc1_),this.cRoot.gameSettings.engineers.bfg.minDamage + "-" + this.cRoot.gameSettings.engineers.bfg.maxDamage,this.getColor(this.cRoot.gameSettings.engineers.level3.maxDamage,this.cRoot.gameSettings.engineers.bfg.maxDamage)],[Locale.loadStringEx("C_RELOAD",_loc1_),this.cRoot.gameSettings.getReloadString(this.cRoot.gameSettings.engineers.bfg.reload / this.cRoot.gameSettings.framesRate),this.getColor(this.cRoot.gameSettings.engineers.level3.reload,this.cRoot.gameSettings.engineers.bfg.reload,true)]],
                  "extras":[Locale.loadStringEx("TOWER_BFG_MISSILE_NAME",_loc1_),Locale.loadStringEx("TOWER_BFG_CLUSTER_NAME",_loc1_)]
               })));
         }
         this.cRoot.quickMenu.show(this.cRoot.gui);
         this.§_-JV§(this.rangeWidth,this.rangeHeight);
      }
      
      override public function upgradeTower(param1:String) : void
      {
         var _loc2_:Tower = null;
         var _loc3_:Tower = null;
         switch(param1)
         {
            case "level_1":
               this.cRoot.game.gameSounds.playEngineerTaunt();
               this.cRoot.game.gameAchievement.buildTower(this.cRoot,"engineer");
               this.§_-PA§(new GTowerEngineerStandar1());
               this.addEventListener(MouseEvent.CLICK,this.clickEvent,false,0,true);
               this.setBaseSettings(§_-KC§);
               this.bombType = "BombCommon";
               this.reloadTime = this.cRoot.gameSettings.engineers.level1.reload - this.§_-7L§;
               this.rangeHeight = this.cRoot.gameSettings.engineers.level1.range * this.cRoot.gameSettings.rangeRatio;
               this.rangeWidth = this.cRoot.gameSettings.engineers.level1.range;
               break;
            case "sell":
               this.§_-FS§();
               this.cRoot.updateCash(this.getSellValue());
               this.cRoot.entities.addChild(new TowerHolder(this.x,this.y,this.soldierRallyPoint));
               this.cRoot.entities.addChild(new TowerSellSmoke(new Point(this.x,this.y),this.getSellValue()));
               this.cRoot.addSellTowerAchievement();
               this.destroyThis();
               break;
            case "level_2":
               this.cRoot.game.gameSounds.playEngineerTaunt();
               this.§_-HP§();
               this.§_-6p§ = this.§_-6p§ + this.getCost(this.cRoot.gameSettings.engineers.level2.cost);
               this.cRoot.updateCash(-this.getCost(this.cRoot.gameSettings.engineers.level2.cost));
               this.§_-PA§(new GTowerEngineerStandar2());
               this.setBaseSettings(§_-S§);
               this.bombType = "BombDynamite";
               this.reloadTime = this.cRoot.gameSettings.engineers.level2.reload - this.§_-7L§;
               this.rangeHeight = this.cRoot.gameSettings.engineers.level2.range * this.cRoot.gameSettings.rangeRatio;
               this.rangeWidth = this.cRoot.gameSettings.engineers.level2.range;
               this.cRoot.menu.showTowerInfo(this);
               break;
            case "level_3":
               this.cRoot.game.gameSounds.playEngineerTaunt();
               this.§_-HP§();
               this.cRoot.game.gameAchievement.upgradeTowerLevel3(this.cRoot,"engineer");
               this.§_-6p§ = this.§_-6p§ + this.getCost(this.cRoot.gameSettings.engineers.level3.cost);
               this.cRoot.updateCash(-this.getCost(this.cRoot.gameSettings.engineers.level3.cost));
               this.§_-PA§(new GTowerEngineerStandar3());
               this.setBaseSettings(§_-AC§);
               this.bombType = "BombBlack";
               this.reloadTime = this.cRoot.gameSettings.engineers.level3.reload - this.§_-7L§;
               this.rangeHeight = this.cRoot.gameSettings.engineers.level3.range * this.cRoot.gameSettings.rangeRatio;
               this.rangeWidth = this.cRoot.gameSettings.engineers.level3.range;
               this.cRoot.menu.showTowerInfo(this);
               break;
            case "level_tesla":
               this.§_-HP§();
               _loc2_ = new TowerEngineerTesla(this.x,this.y,this.soldierRallyPoint,this.§_-6p§);
               this.cRoot.entities.addChild(_loc2_);
               this.cRoot.towers[_loc2_] = _loc2_;
               this.destroyThis();
               break;
            case "level_bertha":
               this.§_-HP§();
               _loc3_ = new TowerEngineerBfg(this.x,this.y,this.soldierRallyPoint,this.§_-6p§);
               this.cRoot.entities.addChild(_loc3_);
               this.cRoot.towers[_loc3_] = _loc3_;
               this.destroyThis();
         }
         this.currentLevel = param1;
      }
      
      public function getPowerCost(param1:int) : int
      {
         if(this.cRoot.game.gameUpgrades.engineersUpIndustrialization && (this.cRoot.maxUpgradeLevel == 0 || this.cRoot.maxUpgradeLevel >= 4))
         {
            return Math.floor(param1 - param1 * 0.25);
         }
         return param1;
      }
      
      public function setBaseSettings(param1:int) : void
      {
         this.level = param1;
      }
      
      private function getDamageInfo(param1:Object) : void
      {
         switch(this.bombType)
         {
            case "BombCommon":
               param1.tDamageMin = this.cRoot.gameSettings.engineers.level1.minDamage;
               param1.tDamageMax = this.cRoot.gameSettings.engineers.level1.maxDamage;
               break;
            case "BombDynamite":
               param1.tDamageMin = this.cRoot.gameSettings.engineers.level2.minDamage;
               param1.tDamageMax = this.cRoot.gameSettings.engineers.level2.maxDamage;
               break;
            case "BombBlack":
               param1.tDamageMin = this.cRoot.gameSettings.engineers.level3.minDamage;
               param1.tDamageMax = this.cRoot.gameSettings.engineers.level3.maxDamage;
         }
      }
      
      public function destroyThis() : void
      {
         this.§_-BN§();
         this.unSelect();
         this.target = null;
         this.removeEventListener(MouseEvent.ROLL_OVER,rollOverEvents);
         this.removeEventListener(MouseEvent.ROLL_OUT,rollOutEvents);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.removeEventListener(MouseEvent.CLICK,this.clickEvent);
         this.cRoot.entities.removeChild(this);
         this.§_-6Q§();
         this.cRoot.removeTower(this);
      }
   }
}
