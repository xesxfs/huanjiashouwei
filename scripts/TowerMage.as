package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class TowerMage extends Tower
   {
      
      public static const §_-5C§:int = 0;
      
      public static const §_-KC§:int = 1;
      
      public static const §_-S§:int = 2;
      
      public static const §_-AC§:int = 3;
      
      public static const §_-4G§:int = 4;
      
      public static const §_-RM§:int = 5;
       
      
      public var charging:Boolean = false;
      
      public var §_-7L§:int = 15;
      
      public var §_-Ce§:int = 5;
      
      public var §_-BL§:int = 0;
      
      public var idleTime:int;
      
      public var idleTimeCounter:int;
      
      public var sName:String;
      
      public function TowerMage(param1:int, param2:int, param3:Point, param4:String = "")
      {
         super(param1,param2,param3,param4);
         this.§_-3F§ = "mage";
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.idleTime = 90;
         this.idleTimeCounter = 0;
         if(this.preMadeLevel == "")
         {
            this.§_-6p§ = this.§_-6p§ + this.getCost(this.cRoot.gameSettings.mages.level1.cost);
            this.cRoot.updateCash(-this.getCost(this.cRoot.gameSettings.mages.level1.cost));
            this.building = true;
            this.buildingTime = this.cRoot.gameSettings.buildingTime;
            this.§_-2I§ = 0;
            this.§_-GI§(new §_-3K§());
            this.§_-FH§ = new §_-NQ§(-17,-41,this.buildingTime);
            this.getGraphic().addChild(this.§_-FH§);
         }
         else
         {
            this.addEventListener(MouseEvent.CLICK,this.clickEvent,false,0,true);
            this.building = false;
            this.upgradeTower(this.preMadeLevel);
         }
         this.§_-IP§ = new Point(this.x + 6,this.y - 48);
         this.§_-Fl§ = new Point(this.x - 6,this.y - 48);
         this.§_-RT§(new §_-TM§());
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
         this.updateSpecial();
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
               if(this.findNewTarget(this.cRoot.gameSettings.enemyMaxLevel))
               {
                  this.§_-3g§();
               }
               else
               {
                  this.playIdle();
               }
            }
         }
      }
      
      public function updateSpecial() : void
      {
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
         if(MovieClip(this.getGraphic().mage).currentFrameLabel != "idleUp" && MovieClip(this.getGraphic().mage).currentFrameLabel != "idleDown")
         {
            this.getGraphic().mage.stop();
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
         if(MovieClip(this.getGraphic().mage).currentFrameLabel != "idleUp" && MovieClip(this.getGraphic().mage).currentFrameLabel != "idleDown")
         {
            this.getGraphic().mage.play();
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
         _loc1_.tName = Locale.loadStringEx("TOWER_MAGES_NAME",Locale.getDefaultLang());
         _loc1_.tIconName = this.§_-3F§;
         _loc1_.tRangeHeight = this.rangeHeight;
         _loc1_.tRangeWidth = this.rangeWidth;
         _loc1_.tReload = this.reloadTime + this.§_-7L§;
         _loc1_.tAttackDamage = 2;
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
         if(this.target.y >= this.y)
         {
            this.§_-Cc§ = this.§_-Fl§;
            this.getGraphic().mage.gotoAndPlay("shoot_down");
         }
         else
         {
            this.§_-Cc§ = this.§_-IP§;
            this.getGraphic().mage.gotoAndPlay("shoot_up");
         }
         this.charging = true;
         this.§_-Nw§ = false;
         this.idleTimeCounter = 0;
      }
      
      public function playIdle() : void
      {
         this.idleTimeCounter++;
         if(this.idleTimeCounter == this.idleTime)
         {
            MovieClip(this.getGraphic().mage).gotoAndStop("idleDown");
         }
      }
      
      override public function shoot() : void
      {
         if((this.target == null || !this.target.isActive) && !this.findNewTarget(this.cRoot.gameSettings.enemyMaxLevel))
         {
            return;
         }
         if(this.target.y >= this.y)
         {
            this.§_-Cc§ = this.§_-Fl§;
         }
         else
         {
            this.§_-Cc§ = this.§_-IP§;
         }
         this.cRoot.bullets.addChild(new §_-Lt§(this.§_-Cc§,this.target,this.level));
         this.shootsTotal++;
      }
      
      override public function checkMenuRollOverAction(param1:String) : void
      {
         switch(param1)
         {
            case "level_1":
               this.showRangeNew(this.cRoot.gameSettings.mages.level1.range,this.cRoot.gameSettings.mages.level1.range * this.cRoot.gameSettings.rangeRatio);
               break;
            case "level_2":
               this.showRangeNew(this.cRoot.gameSettings.mages.level2.range,this.cRoot.gameSettings.mages.level2.range * this.cRoot.gameSettings.rangeRatio);
               break;
            case "level_3":
               this.showRangeNew(this.cRoot.gameSettings.mages.level3.range,this.cRoot.gameSettings.mages.level3.range * this.cRoot.gameSettings.rangeRatio);
               break;
            case "level_arcane":
               this.showRangeNew(this.cRoot.gameSettings.mages.arcane.range,this.cRoot.gameSettings.mages.arcane.range * this.cRoot.gameSettings.rangeRatio);
               break;
            case "level_sorcerer":
               this.showRangeNew(this.cRoot.gameSettings.mages.sorcerer.range,this.cRoot.gameSettings.mages.sorcerer.range * this.cRoot.gameSettings.rangeRatio);
         }
      }
      
      override public function displayTowerMenu() : void
      {
         if(this.cRoot.quickMenu.cTower == this)
         {
            this.cRoot.forceFreeQuickMenu();
            return;
         }
         var _loc1_:String = Locale.getDefaultLang();
         switch(this.level)
         {
            case §_-KC§:
               MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,true,50,true,new Array(new Array("level_2","lv_up",this.getCost(this.cRoot.gameSettings.mages.level2.cost),this.cRoot.isTowerLocked(GameSettings.§_-5d§,2),0,0,0,7,"TooltipBasic",{
                  "title":Locale.loadStringEx("TOWER_MAGES_UPGRADE_LEVEL2_NAME",_loc1_),
                  "text":Locale.loadStringEx("TOWER_MAGES_UPGRADE_LEVEL2_DESCRIPTION",_loc1_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc1_),this.cRoot.gameSettings.mages.level2.minDamage + "-" + this.cRoot.gameSettings.mages.level2.maxDamage,this.getColor(this.cRoot.gameSettings.mages.level1.maxDamage,this.cRoot.gameSettings.mages.level2.maxDamage)],[Locale.loadStringEx("C_RELOAD",_loc1_),this.cRoot.gameSettings.getReloadString(this.cRoot.gameSettings.mages.level2.reload / this.cRoot.gameSettings.framesRate),this.getColor(this.cRoot.gameSettings.mages.level1.reload,this.cRoot.gameSettings.mages.level2.reload,true)]]
               })));
               break;
            case §_-S§:
               MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,true,50,true,new Array(new Array("level_3","lv_up",this.getCost(this.cRoot.gameSettings.mages.level3.cost),this.cRoot.isTowerLocked(GameSettings.§_-5d§,3),0,0,0,7,"TooltipBasic",{
                  "title":Locale.loadStringEx("TOWER_MAGES_UPGRADE_LEVEL3_NAME",_loc1_),
                  "text":Locale.loadStringEx("TOWER_MAGES_UPGRADE_LEVEL3_DESCRIPTION",_loc1_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc1_),this.cRoot.gameSettings.mages.level3.minDamage + "-" + this.cRoot.gameSettings.mages.level3.maxDamage,this.getColor(this.cRoot.gameSettings.mages.level2.maxDamage,this.cRoot.gameSettings.mages.level3.maxDamage)],[Locale.loadStringEx("C_RELOAD",_loc1_),this.cRoot.gameSettings.getReloadString(this.cRoot.gameSettings.mages.level3.reload / this.cRoot.gameSettings.framesRate),this.getColor(this.cRoot.gameSettings.mages.level2.reload,this.cRoot.gameSettings.mages.level3.reload,true)]]
               })));
               break;
            case §_-AC§:
               MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,true,50,true,new Array(new Array("level_arcane","tw_arcane",this.getCost(this.cRoot.gameSettings.mages.arcane.cost),this.cRoot.isTowerLocked(GameSettings.§_-5d§,4),0,0,0,1,"TooltipBasic",{
                  "title":Locale.loadStringEx("TOWER_ARCANE_NAME",_loc1_),
                  "text":Locale.loadStringEx("TOWER_ARCANE_DESCRIPTION",_loc1_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc1_),this.cRoot.gameSettings.mages.arcane.minDamage + "-" + this.cRoot.gameSettings.mages.arcane.maxDamage,this.getColor(this.cRoot.gameSettings.mages.level3.maxDamage,this.cRoot.gameSettings.mages.arcane.maxDamage)],[Locale.loadStringEx("C_RELOAD",_loc1_),this.cRoot.gameSettings.getReloadString(this.cRoot.gameSettings.mages.arcane.reload / this.cRoot.gameSettings.framesRate),this.getColor(this.cRoot.gameSettings.mages.level3.reload,this.cRoot.gameSettings.mages.arcane.reload,true)]],
                  "extras":[Locale.loadStringEx("TOWER_ARCANE_TELEPORT_NAME",_loc1_),Locale.loadStringEx("TOWER_ARCANE_DESINTEGRATE_NAME",_loc1_)]
               }),new Array("level_sorcerer","tw_sorcerer",this.getCost(this.cRoot.gameSettings.mages.sorcerer.cost),this.cRoot.isTowerLocked(GameSettings.§_-5d§,5),0,0,0,2,"TooltipBasic",{
                  "title":Locale.loadStringEx("TOWER_SORCERER_NAME",_loc1_),
                  "text":Locale.loadStringEx("TOWER_SORCERER_DESCRIPTION",_loc1_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc1_),this.cRoot.gameSettings.mages.sorcerer.minDamage + "-" + this.cRoot.gameSettings.mages.sorcerer.maxDamage,this.getColor(this.cRoot.gameSettings.mages.level3.maxDamage,this.cRoot.gameSettings.mages.sorcerer.maxDamage)],[Locale.loadStringEx("C_RELOAD",_loc1_),this.cRoot.gameSettings.getReloadString(this.cRoot.gameSettings.mages.sorcerer.reload / this.cRoot.gameSettings.framesRate),this.getColor(this.cRoot.gameSettings.mages.level3.reload,this.cRoot.gameSettings.mages.sorcerer.reload,true)],[Locale.loadStringEx("C_CURSE",_loc1_),Locale.loadStringEx("C_CURSE_PRE",_loc1_),"white"]],
                  "extras":[Locale.loadStringEx("TOWER_SORCERER_POLIMORPH_NAME",_loc1_),Locale.loadStringEx("TOWER_SORCERER_ELEMENTAL_NAME",_loc1_)]
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
               if(this.preMadeLevel == "")
               {
                  this.cRoot.game.gameSounds.playMageTaunt();
                  this.§_-PA§(new GTowerMageStandar1());
                  this.cRoot.game.gameAchievement.buildTower(this.cRoot,"mages");
                  this.addEventListener(MouseEvent.CLICK,this.clickEvent,false,0,true);
               }
               else
               {
                  this.§_-GI§(new GTowerMageStandar1());
               }
               this.setBaseSettings(§_-KC§);
               this.reloadTime = this.cRoot.gameSettings.mages.level1.reload - this.§_-7L§;
               this.rangeHeight = this.cRoot.gameSettings.mages.level1.range * this.cRoot.gameSettings.rangeRatio;
               this.rangeWidth = this.cRoot.gameSettings.mages.level1.range;
               this.preMadeLevel = "";
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
               if(this.preMadeLevel == "")
               {
                  this.cRoot.game.gameSounds.playMageTaunt();
                  this.§_-HP§();
                  this.§_-6p§ = this.§_-6p§ + this.getCost(this.cRoot.gameSettings.mages.level2.cost);
                  this.cRoot.updateCash(-this.getCost(this.cRoot.gameSettings.mages.level2.cost));
                  this.§_-PA§(new GTowerMageStandar2());
               }
               else
               {
                  this.§_-GI§(new GTowerMageStandar2());
               }
               this.setBaseSettings(§_-S§);
               this.reloadTime = this.cRoot.gameSettings.mages.level2.reload - this.§_-7L§;
               this.rangeHeight = this.cRoot.gameSettings.mages.level2.range * this.cRoot.gameSettings.rangeRatio;
               this.rangeWidth = this.cRoot.gameSettings.mages.level2.range;
               if(this.preMadeLevel == "")
               {
                  this.cRoot.menu.showTowerInfo(this);
               }
               this.preMadeLevel = "";
               break;
            case "level_3":
               if(this.preMadeLevel == "")
               {
                  this.cRoot.game.gameSounds.playMageTaunt();
                  this.§_-HP§();
                  this.cRoot.game.gameAchievement.upgradeTowerLevel3(this.cRoot,"mage");
                  this.§_-6p§ = this.§_-6p§ + this.getCost(this.cRoot.gameSettings.mages.level3.cost);
                  this.cRoot.updateCash(-this.getCost(this.cRoot.gameSettings.mages.level3.cost));
                  this.§_-PA§(new GTowerMageStandar3());
               }
               else
               {
                  this.§_-GI§(new GTowerMageStandar3());
               }
               this.setBaseSettings(§_-AC§);
               this.§_-IP§ = new Point(this.x + 6,this.y - 51);
               this.§_-Fl§ = new Point(this.x - 7,this.y - 53);
               this.reloadTime = this.cRoot.gameSettings.mages.level3.reload - this.§_-7L§;
               this.rangeHeight = this.cRoot.gameSettings.mages.level3.range * this.cRoot.gameSettings.rangeRatio;
               this.rangeWidth = this.cRoot.gameSettings.mages.level3.range;
               if(this.preMadeLevel == "")
               {
                  this.cRoot.menu.showTowerInfo(this);
               }
               this.preMadeLevel = "";
               break;
            case "level_arcane":
               this.§_-HP§();
               _loc2_ = new TowerMageArcane(this.x,this.y,this.soldierRallyPoint,this.§_-6p§);
               this.cRoot.entities.addChild(_loc2_);
               this.cRoot.towers[_loc2_] = _loc2_;
               this.destroyThis();
               break;
            case "level_sorcerer":
               this.§_-HP§();
               _loc3_ = new TowerMageSorcerer(this.x,this.y,this.soldierRallyPoint,this.§_-6p§);
               this.cRoot.entities.addChild(_loc3_);
               this.cRoot.towers[_loc3_] = _loc3_;
               this.destroyThis();
         }
      }
      
      public function setBaseSettings(param1:int) : void
      {
         this.level = param1;
         this.§_-BL§ = 0;
      }
      
      protected function getCost(param1:int) : int
      {
         if(this.cRoot.game.gameUpgrades.magesUpHermeticStudy == true && (this.cRoot.maxUpgradeLevel == 0 || this.cRoot.maxUpgradeLevel >= 3))
         {
            return Math.ceil(param1 - param1 * 0.1);
         }
         return param1;
      }
      
      private function getDamageInfo(param1:Object) : void
      {
         switch(this.level)
         {
            case 1:
               param1.tDamageMin = this.cRoot.gameSettings.mages.level1.minDamage;
               param1.tDamageMax = this.cRoot.gameSettings.mages.level1.maxDamage;
               break;
            case 2:
               param1.tDamageMin = this.cRoot.gameSettings.mages.level2.minDamage;
               param1.tDamageMax = this.cRoot.gameSettings.mages.level2.maxDamage;
               break;
            case 3:
               param1.tDamageMin = this.cRoot.gameSettings.mages.level3.minDamage;
               param1.tDamageMax = this.cRoot.gameSettings.mages.level3.maxDamage;
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
