package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class TowerEngineerBfg extends §_-SC§
   {
       
      
      private var §_-Oy§:Boolean;
      
      private var §_-P7§:Boolean;
      
      private var bombingBoxNodePoint:Point;
      
      private var bombingBoxNodePathIndex:int = 0;
      
      private var bombingBoxNodeIndex:int;
      
      private var bombingBoxCurrentLevel:int = 0;
      
      private var bombingBoxMaxLevel:int;
      
      private var bombingBoxReloadTime:int;
      
      private var bombingBoxReloadTimeCounter:int;
      
      private var §_-N0§:Boolean;
      
      private var §_-Hs§:Boolean = false;
      
      private var homingMissileCurrentLevel:int = 0;
      
      private var homingMissileMaxLevel:int;
      
      public var §_-SE§:int;
      
      public var §_-LJ§:int;
      
      private var §_-Bp§:int;
      
      private var §_-Kt§:int;
      
      private var §_-F2§:int = 29;
      
      private var §_-CN§:int;
      
      public function TowerEngineerBfg(param1:int, param2:int, param3:Point, param4:int)
      {
         this.bombingBoxNodePoint = new Point();
         super(param1,param2,param3);
         this.§_-3F§ = "bfg";
         this.§_-6p§ = param4;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.playBfgTaunt();
         this.§_-5S§ = false;
         this.§_-6p§ = this.§_-6p§ + this.getCost(this.cRoot.gameSettings.engineers.bfg.cost);
         this.cRoot.updateCash(-this.getCost(this.cRoot.gameSettings.engineers.bfg.cost));
         this.building = false;
         this.charging = false;
         this.§_-7L§ = 48;
         this.§_-Ce§ = 26;
         this.§_-BL§ = 0;
         this.setBaseSettings(§_-Kc§);
         this.§_-GI§(new §_-28§());
         this.cRoot.bullets.addChild(new TowerBuildingCloud(new Point(this.x,this.y)));
         this.§_-RT§(new §_-2O§());
         this.§_-IP§ = new Point(this.x,this.y - 60);
         this.§_-Fl§ = new Point(this.x - 20,this.y - 42);
         this.cRoot.game.gameAchievement.buildTowerBfg(this.cRoot);
         this.cRoot.menu.showTowerInfo(this);
         this.unSelect();
         this.addEventListener(MouseEvent.CLICK,clickEvent,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,rollOverEvents,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,rollOutEvents,false,0,true);
      }
      
      override public function pauseSpecial() : void
      {
      }
      
      override public function unPauseSpecial() : void
      {
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
         this.cRoot.bullets.addChild(new BombBfg(this.level,this.§_-IP§,this.bombDestiny));
      }
      
      override public function runSpecialTimers() : void
      {
         if(this.§_-N0§)
         {
            this.§_-Kt§++;
         }
         if(this.§_-Oy§)
         {
            this.bombingBoxReloadTimeCounter++;
         }
      }
      
      override public function runSpecial() : Boolean
      {
         if(this.§_-N0§ && this.§import§())
         {
            return true;
         }
         if(this.§_-Oy§ && this.§_-Jf§())
         {
            return true;
         }
         return false;
      }
      
      override public function getInfo() : Object
      {
         var _loc1_:Object = {};
         _loc1_.tName = Locale.loadStringEx("TOWER_BFG_NAME",Locale.getDefaultLang());
         _loc1_.tIconName = this.§_-3F§;
         _loc1_.tRangeHeight = this.rangeHeight;
         _loc1_.tRangeWidth = this.rangeWidth;
         _loc1_.tReload = this.reloadTime + this.§_-7L§;
         _loc1_.tDamageMin = this.cRoot.gameSettings.engineers.bfg.minDamage;
         _loc1_.tDamageMax = this.cRoot.gameSettings.engineers.bfg.maxDamage;
         return _loc1_;
      }
      
      public function getTooltipParams(param1:String) : Object
      {
         var _loc2_:String = Locale.getDefaultLang();
         switch(param1)
         {
            case "special_homing":
               return {
                  "title":Locale.loadStringEx("TOWER_BFG_MISSILE_NAME",_loc2_),
                  "text":Locale.loadStringEx("TOWER_BFG_MISSILE_DESCRIPTION",_loc2_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc2_),this.cRoot.gameSettings.engineers.bfg.missileMinDamage + this.getNextLevel(this.homingMissileCurrentLevel,this.homingMissileMaxLevel) * this.cRoot.gameSettings.engineers.bfg.missileIncrementDamage + "-" + (this.cRoot.gameSettings.engineers.bfg.missileMaxDamage + this.getNextLevel(this.homingMissileCurrentLevel,this.homingMissileMaxLevel) * this.cRoot.gameSettings.engineers.bfg.missileIncrementDamage),this.getColorByLevel(this.homingMissileCurrentLevel,this.homingMissileMaxLevel)],[Locale.loadStringEx("C_RELOAD",_loc2_),this.cRoot.gameSettings.engineers.bfg.missileCoolDown / this.cRoot.gameSettings.framesRate + Locale.loadStringEx("C_SEC",_loc2_),"white"]],
                  "notes":Locale.loadStringEx("TOWER_BFG_MISSILE_NOTE",_loc2_)
               };
            case "special_bombing_box":
               return {
                  "title":Locale.loadStringEx("TOWER_BFG_CLUSTER_NAME",_loc2_),
                  "text":Locale.loadStringEx("TOWER_BFG_CLUSTER_DESCRIPTION",_loc2_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc2_),this.cRoot.gameSettings.engineers.bfg.clusterMinDamage + "-" + this.cRoot.gameSettings.engineers.bfg.clusterMaxDamage,"white"],[Locale.loadStringEx("C_BOMBS",_loc2_),this.cRoot.gameSettings.engineers.bfg.clusterMinBombs + this.cRoot.gameSettings.engineers.bfg.clusterIncrementBombs * this.getNextLevel(this.bombingBoxCurrentLevel,this.bombingBoxMaxLevel),this.getColorByLevel(this.bombingBoxCurrentLevel,this.bombingBoxMaxLevel)],[Locale.loadStringEx("C_RELOAD",_loc2_),this.cRoot.gameSettings.engineers.bfg.clusterCoolDown / this.cRoot.gameSettings.framesRate + Locale.loadStringEx("C_SEC",_loc2_),"white"]],
                  "notes":Locale.loadStringEx("TOWER_BFG_CLUSTER_NOTE",_loc2_)
               };
            default:
               return null;
         }
      }
      
      override public function displayTowerMenu() : void
      {
         if(this.cRoot.quickMenu.cTower == this)
         {
            this.cRoot.forceFreeQuickMenu();
            return;
         }
         MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,true,180,false,new Array(new Array("special_bombing_box","sp_cluster",this.getPowerCost(this.cRoot.gameSettings.engineers.bfg.clusterCost),false,this.bombingBoxCurrentLevel,this.bombingBoxMaxLevel,this.getPowerCost(this.cRoot.gameSettings.engineers.bfg.clusterCostLevel),1,"TooltipBasic",this.getTooltipParams("special_bombing_box")),new Array("special_homing","sp_missile",this.getPowerCost(this.cRoot.gameSettings.engineers.bfg.missileCost),false,this.homingMissileCurrentLevel,this.homingMissileMaxLevel,this.getPowerCost(this.cRoot.gameSettings.engineers.bfg.missileCostLevel),2,"TooltipBasic",this.getTooltipParams("special_homing"))));
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
            case "special_bombing_box":
               this.cRoot.game.gameSounds.playBfgClsuter();
               this.bombingBoxCurrentLevel++;
               if(this.bombingBoxCurrentLevel == 1)
               {
                  this.§_-6p§ = this.§_-6p§ + this.getPowerCost(this.cRoot.gameSettings.engineers.bfg.clusterCost);
                  this.cRoot.updateCash(-this.getPowerCost(this.cRoot.gameSettings.engineers.bfg.clusterCost));
               }
               else
               {
                  this.§_-6p§ = this.§_-6p§ + this.getPowerCost(this.cRoot.gameSettings.engineers.bfg.clusterCostLevel);
                  this.cRoot.updateCash(-this.getPowerCost(this.cRoot.gameSettings.engineers.bfg.clusterCostLevel));
               }
               this.§_-Oy§ = true;
               this.§_-P7§ = false;
               this.bombingBoxReloadTimeCounter = 0;
               break;
            case "special_homing":
               this.cRoot.game.gameSounds.playBfgMissile();
               this.homingMissileCurrentLevel++;
               if(this.homingMissileCurrentLevel == 1)
               {
                  this.§_-6p§ = this.§_-6p§ + this.getPowerCost(this.cRoot.gameSettings.engineers.bfg.missileCost);
                  this.cRoot.updateCash(-this.getPowerCost(this.cRoot.gameSettings.engineers.bfg.missileCost));
               }
               else
               {
                  this.§_-6p§ = this.§_-6p§ + this.getPowerCost(this.cRoot.gameSettings.engineers.bfg.missileCostLevel);
                  this.cRoot.updateCash(-this.getPowerCost(this.cRoot.gameSettings.engineers.bfg.missileCostLevel));
               }
               this.§_-N0§ = true;
               this.§_-Hs§ = false;
               this.§_-Kt§ = 0;
               this.§_-CN§ = 0;
               this.§_-SE§ = this.rangeWidth + this.rangeWidth * (this.cRoot.gameSettings.engineers.bfg.missileRangeIncrement * this.homingMissileCurrentLevel);
               this.§_-LJ§ = this.rangeHeight + this.rangeHeight * (this.cRoot.gameSettings.engineers.bfg.missileRangeIncrement * this.homingMissileCurrentLevel);
         }
      }
      
      private function §_-Jf§() : Boolean
      {
         if(this.§_-P7§)
         {
            if(this.§_-BL§ < this.§_-7L§)
            {
               if(this.§_-BL§ == this.§_-7L§ - §_-Ce§)
               {
                  if(this.target == null || !this.target.isActive)
                  {
                     this.findNewBombingTarget();
                  }
                  this.cRoot.bullets.addChild(new BombBox(this.bombingBoxCurrentLevel,this.§_-IP§,this.bombingBoxNodePoint,this.bombingBoxNodePathIndex,this.bombingBoxNodeIndex));
               }
               this.§_-BL§++;
               return true;
            }
            this.bombingBoxReloadTimeCounter = 0;
            this.reloadTimeCounter = 0;
            this.§_-BL§ = 0;
            this.§_-P7§ = false;
            this.charging = false;
            return false;
         }
         if(this.bombingBoxReloadTimeCounter < this.bombingBoxReloadTime)
         {
            this.bombingBoxReloadTimeCounter++;
            return false;
         }
         if(this.findNewBombingTarget())
         {
            this.§_-P7§ = true;
            this.getGraphic().gotoAndPlay("shoot");
            return true;
         }
         return false;
      }
      
      private function findNewBombingTarget() : Boolean
      {
         var _loc2_:Enemy = null;
         var _loc1_:Enemy = null;
         this.target = null;
         for each(_loc2_ in this.cRoot.enemies)
         {
            if(_loc2_.isActive && _loc2_.level <= level && !_loc2_.isFlying && this.onRange(_loc2_))
            {
               if(_loc1_ == null || this.§_-ET§(_loc1_,_loc2_))
               {
                  _loc1_ = _loc2_;
               }
            }
         }
         if(_loc1_ != null)
         {
            this.target = _loc1_;
            this.bombingBoxNodePathIndex = _loc1_.roadIndex;
            this.bombingBoxNodeIndex = _loc1_.currentNode + 2;
            this.bombingBoxNodePoint.x = this.target.road[this.target.currentNode + this.target.getNodesSpeed()].x;
            this.bombingBoxNodePoint.y = this.target.road[this.target.currentNode + this.target.getNodesSpeed()].y - 60;
            return true;
         }
         return false;
      }
      
      private function §import§() : Boolean
      {
         if(this.§_-Hs§)
         {
            if(this.§_-CN§ < this.§_-F2§)
            {
               if(this.§_-CN§ == 14)
               {
                  this.cRoot.bullets.addChild(new Missile(this.homingMissileCurrentLevel,this.§_-Fl§,this.target));
                  this.cRoot.game.gameAchievement.missileFire(this.cRoot);
               }
               this.§_-CN§++;
               return true;
            }
            this.§_-Kt§ = 0;
            this.reloadTimeCounter = 0;
            this.§_-CN§ = 0;
            this.§_-Hs§ = false;
            return false;
         }
         if(this.§_-Kt§ < this.§_-Bp§)
         {
            this.§_-Kt§++;
            return false;
         }
         if(this.findNewMissileTarget())
         {
            this.§_-Hs§ = true;
            this.getGraphic().gotoAndPlay("shoot_missile");
            return true;
         }
         return false;
      }
      
      private function findNewMissileTarget() : Boolean
      {
         var _loc2_:Enemy = null;
         var _loc1_:Enemy = null;
         this.target = null;
         for each(_loc2_ in this.cRoot.enemies)
         {
            if(_loc2_.isActive && _loc2_.level <= level && this.§_-Pv§(_loc2_,this.§_-SE§,this.§_-LJ§))
            {
               if(_loc1_ == null || this.§_-ET§(_loc1_,_loc2_))
               {
                  _loc1_ = _loc2_;
               }
            }
         }
         if(_loc1_ != null)
         {
            this.target = _loc1_;
            return true;
         }
         return false;
      }
      
      override public function setBaseSettings(param1:int) : void
      {
         this.level = param1;
         this.reloadTime = this.cRoot.gameSettings.engineers.bfg.reload - this.§_-7L§;
         this.rangeHeight = this.cRoot.gameSettings.engineers.bfg.range * this.cRoot.gameSettings.rangeRatio;
         this.rangeWidth = this.cRoot.gameSettings.engineers.bfg.range;
         this.§_-Bp§ = this.cRoot.gameSettings.engineers.bfg.missileCoolDown;
         this.homingMissileMaxLevel = this.cRoot.gameSettings.engineers.bfg.missileLevels;
         this.bombingBoxReloadTime = this.cRoot.gameSettings.engineers.bfg.clusterCoolDown;
         this.bombingBoxMaxLevel = this.cRoot.gameSettings.engineers.bfg.clusterLevels;
      }
   }
}
