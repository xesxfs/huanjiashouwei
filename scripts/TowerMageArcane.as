package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class TowerMageArcane extends TowerMage
   {
       
      
      public var §_-AR§:Boolean = false;
      
      public var teleportMaxLevel:int;
      
      public var teleportCurrentLevel:int = 0;
      
      public var §_-6c§:Boolean = false;
      
      public var teleportingMaxEnemies:int;
      
      public var teleportingNodes:int;
      
      public var teleportingTime:int;
      
      public var teleportingTimeCounter:int;
      
      public var teleportingChargeTime:int = 20;
      
      public var teleportingChargeTimeCounter:int;
      
      public var §_-M0§:Boolean = false;
      
      public var §_-Qz§:Boolean = false;
      
      public var desintegrateMaxLevel:int;
      
      public var desintegrateCurrentLevel:int = 0;
      
      public var §_-A9§:int;
      
      public var §_-Sd§:int;
      
      public function TowerMageArcane(param1:int, param2:int, param3:Point, param4:int)
      {
         super(param1,param2,param3);
         this.§_-3F§ = "arcane";
         this.§_-6p§ = param4;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.playArcaneTaunt();
         this.building = false;
         this.§_-6p§ = this.§_-6p§ + this.getCost(this.cRoot.gameSettings.mages.arcane.cost);
         this.cRoot.updateCash(-this.getCost(this.cRoot.gameSettings.mages.arcane.cost));
         this.charging = false;
         this.§_-7L§ = 38;
         this.§_-Ce§ = 20;
         this.§_-BL§ = 0;
         this.idleTime = 90;
         this.idleTimeCounter = 0;
         this.setBaseSettings(§_-4G§);
         this.§_-GI§(new §_-DJ§());
         this.cRoot.bullets.addChild(new TowerBuildingCloud(new Point(this.x,this.y)));
         this.§_-RT§(new §_-TM§());
         this.§_-IP§ = new Point(this.x + 1,this.y - 59);
         this.§_-Fl§ = new Point(this.x + 1,this.y - 59);
         this.cRoot.game.gameAchievement.buildTowerArcane(this.cRoot);
         this.cRoot.menu.showTowerInfo(this);
         this.unSelect();
         this.addEventListener(MouseEvent.CLICK,clickEvent,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,rollOverEvents,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,rollOutEvents,false,0,true);
      }
      
      override public function getInfo() : Object
      {
         var _loc1_:Object = {};
         _loc1_.tName = Locale.loadStringEx("TOWER_ARCANE_NAME",Locale.getDefaultLang());
         _loc1_.tIconName = this.§_-3F§;
         _loc1_.tRangeHeight = this.rangeHeight;
         _loc1_.tRangeWidth = this.rangeWidth;
         _loc1_.tReload = this.reloadTime + this.§_-7L§;
         _loc1_.tDamageMin = this.cRoot.gameSettings.mages.arcane.minDamage;
         _loc1_.tDamageMax = this.cRoot.gameSettings.mages.arcane.maxDamage;
         _loc1_.tAttackDamage = 2;
         return _loc1_;
      }
      
      override public function shoot() : void
      {
         if(!this.target.isActive && !this.findNewTarget(this.cRoot.gameSettings.enemyMaxLevel))
         {
            return;
         }
         if(this.§_-Qz§ && this.§_-Dj§() && !this.target.isBoss)
         {
            this.§_-Sd§ = 0;
            this.cRoot.bullets.addChild(new RayArcaneDesintegrate(this.§_-Cc§,this.target));
         }
         else
         {
            this.cRoot.bullets.addChild(new RayArcaneCommon(this.§_-Cc§,this.target));
            this.shootsTotal++;
         }
      }
      
      override public function runSpecialTimers() : void
      {
         if(this.§_-Qz§)
         {
            this.§_-Sd§++;
         }
         if(this.§_-AR§)
         {
            this.teleportingTimeCounter++;
         }
      }
      
      public function getTooltipParams(param1:String) : Object
      {
         var _loc2_:String = Locale.getDefaultLang();
         switch(param1)
         {
            case "special_teleport":
               return {
                  "title":Locale.loadStringEx("TOWER_ARCANE_TELEPORT_NAME",_loc2_),
                  "text":Locale.loadStringEx("TOWER_ARCANE_TELEPORT_DESCRIPTION",_loc2_),
                  "atts":[[Locale.loadStringEx("C_MAX_ENEMIES",_loc2_),this.cRoot.gameSettings.mages.arcane.teleportMaxEnemies + this.getNextLevel(this.teleportCurrentLevel,this.teleportMaxLevel) * this.cRoot.gameSettings.mages.arcane.teleportExtraEnemies,this.getColorByLevel(this.teleportCurrentLevel,this.teleportMaxLevel)],[Locale.loadStringEx("C_RELOAD",_loc2_),this.cRoot.gameSettings.mages.arcane.teleportCoolDown / this.cRoot.gameSettings.framesRate + Locale.loadStringEx("C_SEC",_loc2_),"white"]],
                  "notes":Locale.loadStringEx("TOWER_ARCANE_TELEPORT_NOTE",_loc2_)
               };
            case "special_desintegration":
               return {
                  "title":Locale.loadStringEx("TOWER_ARCANE_DESINTEGRATE_NAME",_loc2_),
                  "text":Locale.loadStringEx("TOWER_ARCANE_DESINTEGRATE_DESCRIPTION",_loc2_),
                  "atts":[[Locale.loadStringEx("C_RELOAD",_loc2_),(this.cRoot.gameSettings.mages.arcane.deathRayCoolDown - this.cRoot.gameSettings.mages.arcane.deathRayLessCoolDown * this.getNextLevel(this.desintegrateCurrentLevel,this.desintegrateMaxLevel)) / this.cRoot.gameSettings.framesRate + Locale.loadStringEx("C_SEC",_loc2_),this.getColorByLevel(this.desintegrateCurrentLevel,this.desintegrateMaxLevel)]],
                  "notes":Locale.loadStringEx("TOWER_ARCANE_DESINTEGRATE_NOTE",_loc2_)
               };
            default:
               return null;
         }
      }
      
      override public function runSpecial() : Boolean
      {
         if(this.§_-AR§ && this.§_-Fw§())
         {
            return true;
         }
         return false;
      }
      
      override public function displayTowerMenu() : void
      {
         if(this.cRoot.quickMenu.cTower == this)
         {
            this.cRoot.forceFreeQuickMenu();
            return;
         }
         MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,true,180,false,new Array(new Array("special_desintegration","sp_desintegration",this.cRoot.gameSettings.mages.arcane.deathRayCost,false,this.desintegrateCurrentLevel,this.desintegrateMaxLevel,this.cRoot.gameSettings.mages.arcane.deathRayCostLevel,1,"TooltipBasic",this.getTooltipParams("special_desintegration")),new Array("special_teleport","sp_teleport",this.cRoot.gameSettings.mages.arcane.teleportCost,false,this.teleportCurrentLevel,this.teleportMaxLevel,this.cRoot.gameSettings.mages.arcane.teleportCostLevel,2,"TooltipBasic",this.getTooltipParams("special_teleport"))));
         this.cRoot.quickMenu.show(this.cRoot.gui);
         this.§_-JV§(this.rangeWidth,this.rangeHeight);
      }
      
      override public function upgradeTower(param1:String) : void
      {
         switch(param1)
         {
            case "sell":
               this.cRoot.updateCash(this.getSellValue());
               this.cRoot.entities.addChild(new TowerHolder(this.x,this.y,this.soldierRallyPoint));
               this.cRoot.entities.addChild(new TowerSellSmoke(new Point(this.x,this.y),this.getSellValue()));
               this.cRoot.addSellTowerAchievement();
               this.destroyThis();
               break;
            case "special_desintegration":
               this.cRoot.game.gameSounds.playArcaneDesintegrate();
               this.desintegrateCurrentLevel++;
               this.§_-Qz§ = true;
               this.§_-Sd§ = 0;
               if(this.desintegrateCurrentLevel == 1)
               {
                  this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.mages.arcane.deathRayCost;
                  this.cRoot.updateCash(-this.cRoot.gameSettings.mages.arcane.deathRayCost);
               }
               else
               {
                  this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.mages.arcane.deathRayCostLevel;
                  this.cRoot.updateCash(-this.cRoot.gameSettings.mages.arcane.deathRayCostLevel);
               }
               this.§_-A9§ = this.cRoot.gameSettings.mages.arcane.deathRayCoolDown - this.cRoot.gameSettings.mages.arcane.deathRayLessCoolDown * this.desintegrateCurrentLevel;
               break;
            case "special_teleport":
               this.cRoot.game.gameSounds.playArcaneTeleport();
               this.§_-AR§ = true;
               this.teleportCurrentLevel++;
               this.§_-6c§ = false;
               this.teleportingTimeCounter = 0;
               this.teleportingChargeTimeCounter;
               if(this.teleportCurrentLevel == 1)
               {
                  this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.mages.arcane.teleportCost;
                  this.cRoot.updateCash(-this.cRoot.gameSettings.mages.arcane.teleportCost);
               }
               else
               {
                  this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.mages.arcane.teleportCostLevel;
                  this.cRoot.updateCash(-this.cRoot.gameSettings.mages.arcane.teleportCostLevel);
               }
               this.teleportingMaxEnemies = this.cRoot.gameSettings.mages.arcane.teleportMaxEnemies + this.teleportCurrentLevel * this.cRoot.gameSettings.mages.arcane.teleportExtraEnemies;
               this.teleportingNodes = this.cRoot.gameSettings.mages.arcane.teleportNodes + this.teleportCurrentLevel * this.cRoot.gameSettings.mages.arcane.teleportExtraNodes;
         }
      }
      
      private function §_-Dj§() : Boolean
      {
         if(this.§_-Sd§ < this.§_-A9§)
         {
            this.§_-Sd§++;
            return false;
         }
         return true;
      }
      
      private function §_-Fw§() : Boolean
      {
         if(this.§_-6c§)
         {
            if(this.teleportingChargeTimeCounter < this.teleportingChargeTime)
            {
               if(this.teleportingChargeTimeCounter == 4)
               {
                  this.cRoot.decals.addChild(new TeleportPortal(new Point(this.target.x,this.target.y),this.teleportingMaxEnemies * this.teleportCurrentLevel,5,this.teleportingNodes));
               }
               this.teleportingChargeTimeCounter++;
               return true;
            }
            this.reloadTimeCounter = 0;
            this.teleportingChargeTimeCounter = 0;
            this.teleportingTimeCounter = 0;
            this.§_-6c§ = false;
            return false;
         }
         if(this.teleportingTimeCounter < this.teleportingTime)
         {
            this.teleportingTimeCounter++;
            return false;
         }
         if(this.findNewTeleportTarget(this.cRoot.gameSettings.enemyMaxLevel,true,false))
         {
            this.§_-6c§ = true;
            this.getGraphic().gotoAndPlay("teleport");
            if(this.target.y >= this.y)
            {
               this.getGraphic().mage.gotoAndPlay("teleport_down");
            }
            else
            {
               this.getGraphic().mage.gotoAndPlay("teleport_up");
            }
            return true;
         }
         return false;
      }
      
      public function findNewTeleportTarget(param1:int, param2:Boolean = true, param3:Boolean = true) : Boolean
      {
         var _loc5_:Enemy = null;
         var _loc4_:Enemy = null;
         this.target = null;
         for each(_loc5_ in this.cRoot.enemies)
         {
            if(_loc5_.isActive && (param3 || !_loc5_.isBoss) && _loc5_.§_-3Y§ && _loc5_.level <= param1 && (param2 || !_loc5_.isFlying) && this.onRange(_loc5_))
            {
               if(_loc4_ == null || this.§_-ET§(_loc4_,_loc5_))
               {
                  _loc4_ = _loc5_;
               }
            }
         }
         if(_loc4_ != null)
         {
            this.target = _loc4_;
            return true;
         }
         return false;
      }
      
      override public function setBaseSettings(param1:int) : void
      {
         this.level = param1;
         this.reloadTime = this.cRoot.gameSettings.mages.arcane.reload - this.§_-7L§;
         this.rangeHeight = this.cRoot.gameSettings.mages.arcane.range * this.cRoot.gameSettings.rangeRatio;
         this.rangeWidth = this.cRoot.gameSettings.mages.arcane.range;
         this.teleportingTime = this.cRoot.gameSettings.mages.arcane.teleportCoolDown;
         this.teleportMaxLevel = this.cRoot.gameSettings.mages.arcane.teleportLevels;
         this.§_-A9§ = this.cRoot.gameSettings.mages.arcane.deathRayCoolDown;
         this.desintegrateMaxLevel = this.cRoot.gameSettings.mages.arcane.deathRayLevels;
      }
   }
}
