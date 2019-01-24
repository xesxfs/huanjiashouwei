package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class TowerArcherRanger extends TowerArcher
   {
       
      
      private var poisonMaxLevel:int;
      
      private var poisonCurrentLevel:int = 0;
      
      private var §_-22§:int;
      
      private var §_-K3§:int;
      
      private var druidMaxLevel:int;
      
      private var druidCurrentLevel:int = 0;
      
      private var §_-OP§:Point;
      
      private var druid:TowerArcherDruid;
      
      public function TowerArcherRanger(param1:int, param2:int, param3:Point, param4:int)
      {
         super(param1,param2,param3);
         this.§_-3F§ = "ranger";
         this.§_-6p§ = param4;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.playRangerTaunt();
         this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.archers.ranger.cost;
         this.cRoot.updateCash(-this.cRoot.gameSettings.archers.ranger.cost);
         this.setBaseSettings(§class§);
         this.building = false;
         this.idleTime = 90;
         this.idleTimeCounter = 0;
         this.§_-OP§ = new Point(7.3,-24.6);
         this.§_-GI§(new §_-9G§());
         this.cRoot.bullets.addChild(new TowerBuildingCloud(new Point(this.x,this.y)));
         this.§_-RT§(new §_-Av§());
         this.§_-IP§ = new Point(this.x + 5,this.y - 53);
         this.§_-Fl§ = new Point(this.x - 9,this.y - 53);
         this.cRoot.menu.showTowerInfo(this);
         this.cRoot.game.gameAchievement.buildTowerRanger(this.cRoot);
         this.unSelect();
         this.addEventListener(MouseEvent.CLICK,clickEvent,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,rollOverEvents,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,rollOutEvents,false,0,true);
      }
      
      override public function createBullet() : MovieClip
      {
         var _loc1_:§_-27§ = null;
         var _loc2_:Point = null;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         if(this.poisonCurrentLevel != 0 && this.§_-77§())
         {
            if(this.target == null || !this.target.isActive || this.target.hasDebuff("DebuffPoison") || !this.target.canPoison)
            {
               this.findNewUnPoisonTarget(this.cRoot.gameSettings.enemyMaxLevel);
            }
            if(this.target == null || !this.target.isActive)
            {
               _loc2_ = new Point(this.arrowDestiny.x,this.arrowDestiny.y);
            }
            else if(this.target.canPoison)
            {
               _loc1_ = new DebuffPoison(this.cRoot,this.poisonCurrentLevel,this.target);
            }
            else
            {
               _loc1_ = null;
            }
         }
         else if(this.target == null || !this.target.isActive)
         {
            if(!this.findNewTarget(this.cRoot.gameSettings.enemyMaxLevel))
            {
               _loc2_ = new Point(this.arrowDestiny.x,this.arrowDestiny.y);
            }
         }
         if(this.cRoot.game.gameUpgrades.archersUpPrecision && (this.cRoot.maxUpgradeLevel == 0 || this.cRoot.maxUpgradeLevel == 5))
         {
            if(Math.random() <= 0.1)
            {
               _loc3_ = true;
            }
         }
         if(this.cRoot.game.gameUpgrades.archersUpPiercing && (this.cRoot.maxUpgradeLevel == 0 || this.cRoot.maxUpgradeLevel >= 3))
         {
            _loc4_ = 10;
         }
         return new Arrow(this.level,this.target,_loc2_,_loc1_,0,_loc3_,_loc4_);
      }
      
      override public function runSpecialTimers() : void
      {
         this.§_-K3§++;
         if(this.druidCurrentLevel != 0)
         {
            this.druid.onFrameUpdate();
         }
      }
      
      override public function getInfo() : Object
      {
         var _loc1_:Object = {};
         _loc1_.tName = Locale.loadStringEx("TOWER_RANGERS_NAME",Locale.getDefaultLang());
         _loc1_.tIconName = this.§_-3F§;
         _loc1_.tRangeHeight = this.rangeHeight;
         _loc1_.tRangeWidth = this.rangeWidth;
         _loc1_.tReload = this.reloadTime + this.§_-7L§;
         _loc1_.tDamageMin = this.cRoot.gameSettings.archers.ranger.minDamage;
         _loc1_.tDamageMax = this.cRoot.gameSettings.archers.ranger.maxDamage;
         return _loc1_;
      }
      
      public function getTooltipParams(param1:String) : Object
      {
         var _loc2_:String = Locale.getDefaultLang();
         switch(param1)
         {
            case "special_poison":
               return {
                  "title":Locale.loadStringEx("TOWER_RANGERS_POISON_NAME",_loc2_),
                  "text":Locale.loadStringEx("TOWER_RANGERS_POISON_DESCRIPTION",_loc2_),
                  "atts":[[Locale.loadStringEx("C_DURATION",_loc2_),this.cRoot.gameSettings.archers.ranger.poisonDuration / this.cRoot.gameSettings.framesRate + Locale.loadStringEx("C_SEC",_loc2_),"white"],[Locale.loadStringEx("C_DAMAGE",_loc2_),this.cRoot.gameSettings.archers.ranger.poisonDamage * this.getNextLevel(this.poisonCurrentLevel,this.poisonMaxLevel) + " " + Locale.loadStringEx("C_OVER_DURATION",_loc2_),this.getColorByLevel(this.poisonCurrentLevel,this.poisonMaxLevel)]],
                  "notes":Locale.loadStringEx("TOWER_RANGERS_POISON_NOTE",_loc2_)
               };
            case "special_druid":
               return {
                  "title":Locale.loadStringEx("TOWER_RANGERS_THORNS_NAME",_loc2_),
                  "text":Locale.loadStringEx("TOWER_RANGERS_THORNS_DESCRIPTION",_loc2_),
                  "atts":[[Locale.loadStringEx("C_DURATION",_loc2_),this.cRoot.gameSettings.archers.ranger.thornDuration * this.getNextLevel(this.druidCurrentLevel,this.druidMaxLevel) / this.cRoot.gameSettings.framesRate + Locale.loadStringEx("C_SEC",_loc2_),this.getColorByLevel(this.druidCurrentLevel,this.druidMaxLevel)],[Locale.loadStringEx("C_DAMAGE",_loc2_),this.cRoot.gameSettings.archers.ranger.thornDamage + " " + Locale.loadStringEx("C_OVER_DURATION",_loc2_),"white"],[Locale.loadStringEx("C_RELOAD",_loc2_),this.cRoot.gameSettings.archers.ranger.thornCoolDown / this.cRoot.gameSettings.framesRate + Locale.loadStringEx("C_SEC",_loc2_),"white"]],
                  "notes":Locale.loadStringEx("TOWER_RANGERS_THORNS_NOTE",_loc2_)
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
         MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,true,180,false,new Array(new Array("special_poison","sp_poison",this.cRoot.gameSettings.archers.ranger.poisonCost,false,this.poisonCurrentLevel,this.poisonMaxLevel,this.cRoot.gameSettings.archers.ranger.poisonCostLevel,1,"TooltipBasic",this.getTooltipParams("special_poison")),new Array("special_druid","sp_thorns",this.cRoot.gameSettings.archers.ranger.thornCost,false,this.druidCurrentLevel,this.druidMaxLevel,this.cRoot.gameSettings.archers.ranger.thornCostLevel,2,"TooltipBasic",this.getTooltipParams("special_druid"))));
         this.cRoot.quickMenu.show(this.cRoot.gui);
         this.§_-JV§(this.rangeWidth,this.rangeHeight);
      }
      
      override public function pauseSpecial() : void
      {
         if(this.druidCurrentLevel != 0)
         {
            this.druid.pause();
         }
      }
      
      override public function unPauseSpecial() : void
      {
         if(this.druidCurrentLevel != 0)
         {
            this.druid.unPause();
         }
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
            case "special_poison":
               this.cRoot.game.gameSounds.playRangerPoisonTaunt();
               this.poisonCurrentLevel++;
               if(this.poisonCurrentLevel == 1)
               {
                  this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.archers.ranger.poisonCost;
                  this.cRoot.updateCash(-this.cRoot.gameSettings.archers.ranger.poisonCost);
                  break;
               }
               this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.archers.ranger.poisonCostLevel;
               this.cRoot.updateCash(-this.cRoot.gameSettings.archers.ranger.poisonCostLevel);
               break;
            case "special_druid":
               this.cRoot.game.gameSounds.playRangerThornsTaunt();
               this.druidCurrentLevel++;
               if(this.druidCurrentLevel == 1)
               {
                  this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.archers.ranger.thornCost;
                  this.cRoot.updateCash(-this.cRoot.gameSettings.archers.ranger.thornCost);
                  this.druid = new TowerArcherDruid(this.§_-OP§,this);
                  this.addChild(this.druid);
                  break;
               }
               this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.archers.ranger.thornCostLevel;
               this.cRoot.updateCash(-this.cRoot.gameSettings.archers.ranger.thornCostLevel);
               this.druid.upgrade(this.druidCurrentLevel);
               break;
         }
      }
      
      private function findNewUnPoisonTarget(param1:int) : void
      {
         var _loc4_:Enemy = null;
         var _loc2_:Enemy = null;
         var _loc3_:Enemy = null;
         for each(_loc4_ in this.cRoot.enemies)
         {
            if(_loc4_.isActive && _loc4_.canPoison && _loc4_.level <= param1 && this.onRange(_loc4_))
            {
               if(!_loc4_.hasDebuff("DebuffPoison"))
               {
                  if(_loc2_ == null || this.§_-ET§(_loc2_,_loc4_))
                  {
                     _loc2_ = Enemy(_loc4_);
                  }
               }
               else if(_loc3_ == null || this.§_-ET§(_loc3_,_loc4_))
               {
                  _loc3_ = Enemy(_loc4_);
               }
            }
         }
         if(_loc2_ != null)
         {
            this.target = _loc2_;
            return;
         }
         if(_loc3_ != null)
         {
            this.target = _loc3_;
            return;
         }
      }
      
      private function §_-77§() : Boolean
      {
         if(this.§_-K3§ >= this.§_-22§)
         {
            this.§_-K3§ = 0;
            return true;
         }
         this.§_-K3§++;
         return false;
      }
      
      override public function setBaseSettings(param1:int) : void
      {
         this.level = param1;
         this.reloadTime = this.cRoot.gameSettings.archers.ranger.reload - this.§_-7L§;
         this.rangeHeight = this.cRoot.gameSettings.archers.ranger.range * this.cRoot.gameSettings.rangeRatio;
         this.rangeWidth = this.cRoot.gameSettings.archers.ranger.range;
         this.poisonMaxLevel = this.cRoot.gameSettings.archers.ranger.poisonLevels;
         this.§_-22§ = this.cRoot.gameSettings.archers.ranger.poisonCoolDown;
         this.druidMaxLevel = this.cRoot.gameSettings.archers.ranger.thornLevels;
      }
      
      override public function destroyThis() : void
      {
         this.§_-BN§();
         this.unSelect();
         this.target = null;
         if(this.druid != null)
         {
            this.druid.destroyThis();
         }
         this.removeEventListener(MouseEvent.ROLL_OVER,rollOverEvents);
         this.removeEventListener(MouseEvent.ROLL_OUT,rollOutEvents);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.removeEventListener(MouseEvent.CLICK,clickEvent);
         this.cRoot.entities.removeChild(this);
         this.§_-6Q§();
         this.cRoot.removeTower(this);
      }
   }
}
