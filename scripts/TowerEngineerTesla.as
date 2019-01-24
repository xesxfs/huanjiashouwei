package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class TowerEngineerTesla extends §_-SC§
   {
       
      
      private var chargedBoltCurrentLevel:int = 0;
      
      private var chargedBoltMaxLevel:int;
      
      private var §default§:int;
      
      private var §_-M-§:int;
      
      private var overchargeCurrentLevel:int = 0;
      
      private var overchargeMaxLevel:int;
      
      private var overchargeReloadTime:int;
      
      private var overchargeReloadTimeCounter:int;
      
      public function TowerEngineerTesla(param1:int, param2:int, param3:Point, param4:int)
      {
         super(param1,param2,param3);
         this.§_-3F§ = "tesla";
         this.§_-6p§ = param4;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.playTeslaTaunt();
         this.§_-5S§ = true;
         this.§_-6p§ = this.§_-6p§ + this.getCost(this.cRoot.gameSettings.engineers.tesla.cost);
         this.cRoot.updateCash(-this.getCost(this.cRoot.gameSettings.engineers.tesla.cost));
         this.building = false;
         this.charging = false;
         this.§_-7L§ = 63;
         this.§_-Ce§ = 15;
         this.§_-BL§ = 0;
         this.setBaseSettings(§_-63§);
         this.§_-GI§(new §_-AE§());
         this.cRoot.bullets.addChild(new TowerBuildingCloud(new Point(this.x,this.y)));
         this.§_-RT§(new §_-Z§());
         this.§_-IP§ = new Point(this.x + 6,this.y - 62);
         this.§_-Fl§ = new Point(this.x + 6,this.y - 62);
         this.cRoot.game.gameAchievement.buildTowerTesla(this.cRoot);
         this.cRoot.addTeslaAchievement();
         this.cRoot.menu.showTowerInfo(this);
         this.unSelect();
         this.addEventListener(MouseEvent.CLICK,clickEvent,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,rollOverEvents,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,rollOutEvents,false,0,true);
      }
      
      override public function shoot() : void
      {
         if(!this.findBestTarget(this.cRoot.gameSettings.enemyMaxLevel))
         {
            return;
         }
         var _loc1_:int = 3;
         if(this.overchargeCurrentLevel != 0)
         {
            this.§_-9F§();
         }
         if(this.chargedBoltCurrentLevel != 0)
         {
            _loc1_ = _loc1_ + this.chargedBoltCurrentLevel;
         }
         this.cRoot.bullets.addChild(new RayTesla(this.§_-IP§,this.target,1,_loc1_,new Dictionary()));
         this.cRoot.game.gameSounds.playTeslaAttack();
      }
      
      override public function runSpecialTimers() : void
      {
         if(this.chargedBoltCurrentLevel != 0)
         {
            this.§_-M-§++;
         }
         if(this.overchargeCurrentLevel != 0)
         {
            this.overchargeReloadTimeCounter++;
         }
      }
      
      override public function runSpecial() : Boolean
      {
         this.runSpecialTimers();
         return false;
      }
      
      override public function getInfo() : Object
      {
         var _loc1_:Object = {};
         _loc1_.tName = Locale.loadStringEx("TOWER_TESLA_NAME",Locale.getDefaultLang());
         _loc1_.tIconName = this.§_-3F§;
         _loc1_.tRangeHeight = this.rangeHeight;
         _loc1_.tRangeWidth = this.rangeWidth;
         _loc1_.tReload = this.reloadTime + this.§_-7L§;
         _loc1_.tDamageMin = this.cRoot.gameSettings.engineers.tesla.minDamage;
         _loc1_.tDamageMax = this.cRoot.gameSettings.engineers.tesla.maxDamage;
         return _loc1_;
      }
      
      public function getTooltipParams(param1:String) : Object
      {
         var _loc2_:String = Locale.getDefaultLang();
         switch(param1)
         {
            case "special_charged_bolt":
               return {
                  "title":Locale.loadStringEx("TOWER_TESLA_CHARGED_BOLT_NAME",_loc2_),
                  "text":Locale.loadStringEx("TOWER_TESLA_CHARGED_BOLT_DESCRIPTION",_loc2_),
                  "atts":[[Locale.loadStringEx("C_MAX_ENEMIES",_loc2_),this.cRoot.gameSettings.engineers.tesla.chargedBoltEnemies + this.getNextLevel(this.chargedBoltCurrentLevel,this.chargedBoltMaxLevel) * this.cRoot.gameSettings.engineers.tesla.chargedBoltIncrementEnemies,this.getColor(this.chargedBoltCurrentLevel,this.chargedBoltMaxLevel)]],
                  "notes":Locale.loadStringEx("TOWER_TESLA_CHARGED_BOLT_NOTE",_loc2_)
               };
            case "special_overcharge":
               return {
                  "title":Locale.loadStringEx("TOWER_TESLA_OVERCHARGE_NAME",_loc2_),
                  "text":Locale.loadStringEx("TOWER_TESLA_OVERCHARGE_DESCRIPTION",_loc2_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc2_),this.cRoot.gameSettings.engineers.tesla.overchargeMinDamage + this.getNextLevel(this.overchargeCurrentLevel,this.overchargeMaxLevel) * this.cRoot.gameSettings.engineers.tesla.overchargeDamageIncrement + "-" + (this.cRoot.gameSettings.engineers.tesla.overchargeMaxDamage + this.getNextLevel(this.overchargeCurrentLevel,this.overchargeMaxLevel) * this.cRoot.gameSettings.engineers.tesla.overchargeDamageIncrement),this.getColorByLevel(this.overchargeCurrentLevel,this.overchargeMaxLevel)]],
                  "notes":Locale.loadStringEx("TOWER_TESLA_OVERCHARGE_NOTE",_loc2_)
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
         MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,true,180,false,new Array(new Array("special_overcharge","sp_overcharge",this.getPowerCost(this.cRoot.gameSettings.engineers.tesla.overchargeCost),false,this.overchargeCurrentLevel,this.overchargeMaxLevel,this.getPowerCost(this.cRoot.gameSettings.engineers.tesla.overchargeCostLevel),1,"TooltipBasic",this.getTooltipParams("special_overcharge")),new Array("special_charged_bolt","sp_charged_bolt",this.getPowerCost(this.cRoot.gameSettings.engineers.tesla.chargedBoltCost),false,this.chargedBoltCurrentLevel,this.chargedBoltMaxLevel,this.getPowerCost(this.cRoot.gameSettings.engineers.tesla.chargedBoltCostLevel),2,"TooltipBasic",this.getTooltipParams("special_charged_bolt"))));
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
            case "special_overcharge":
               this.cRoot.game.gameSounds.playTeslaOvercharge();
               this.overchargeCurrentLevel++;
               if(this.overchargeCurrentLevel == 1)
               {
                  this.§_-6p§ = this.§_-6p§ + this.getPowerCost(this.cRoot.gameSettings.engineers.tesla.overchargeCost);
                  this.cRoot.updateCash(-this.getPowerCost(this.cRoot.gameSettings.engineers.tesla.overchargeCost));
               }
               else
               {
                  this.§_-6p§ = this.§_-6p§ + this.getPowerCost(this.cRoot.gameSettings.engineers.tesla.overchargeCostLevel);
                  this.cRoot.updateCash(-this.getPowerCost(this.cRoot.gameSettings.engineers.tesla.overchargeCostLevel));
               }
               this.overchargeReloadTimeCounter = 0;
               break;
            case "special_charged_bolt":
               this.cRoot.game.gameSounds.playTeslaChargedBolt();
               this.chargedBoltCurrentLevel++;
               if(this.chargedBoltCurrentLevel == 1)
               {
                  this.§_-6p§ = this.§_-6p§ + this.getPowerCost(this.cRoot.gameSettings.engineers.tesla.chargedBoltCost);
                  this.cRoot.updateCash(-this.getPowerCost(this.cRoot.gameSettings.engineers.tesla.chargedBoltCost));
               }
               else
               {
                  this.§_-6p§ = this.§_-6p§ + this.getPowerCost(this.cRoot.gameSettings.engineers.tesla.chargedBoltCostLevel);
                  this.cRoot.updateCash(-this.getPowerCost(this.cRoot.gameSettings.engineers.tesla.chargedBoltCostLevel));
               }
               this.§_-M-§ = 0;
         }
      }
      
      private function §_-9F§() : Boolean
      {
         this.cRoot.bullets.addChild(new StaticField(this.overchargeCurrentLevel,new Point(this.x,this.y)));
         return true;
      }
      
      private function §_-Ng§() : Boolean
      {
         return true;
      }
      
      override public function findNewTarget(param1:int, param2:Boolean = true, param3:Boolean = true) : Boolean
      {
         return this.findAnyTarget(param1,param2);
      }
      
      override public function onRange(param1:Enemy) : Boolean
      {
         return this.§_-R§(new Point(param1.x,param1.y));
      }
      
      private function findBestTarget(param1:int) : Boolean
      {
         var _loc3_:Enemy = null;
         var _loc2_:Enemy = null;
         this.target = null;
         for each(_loc3_ in this.cRoot.enemies)
         {
            if(_loc3_.isActive && _loc3_.level <= param1 && this.onRange(_loc3_))
            {
               if(_loc2_ == null || this.§_-ET§(_loc2_,_loc3_))
               {
                  _loc2_ = _loc3_;
               }
            }
         }
         if(_loc2_ != null)
         {
            this.target = _loc2_;
            return true;
         }
         return false;
      }
      
      override public function setBaseSettings(param1:int) : void
      {
         this.level = param1;
         this.reloadTime = this.cRoot.gameSettings.engineers.tesla.reload - this.§_-7L§;
         this.rangeHeight = this.cRoot.gameSettings.engineers.tesla.range * this.cRoot.gameSettings.rangeRatio;
         this.rangeWidth = this.cRoot.gameSettings.engineers.tesla.range;
         this.chargedBoltMaxLevel = this.cRoot.gameSettings.engineers.tesla.chargedBoltLevels;
         this.§default§ = this.cRoot.gameSettings.engineers.tesla.chargedBoltCoolDown;
         this.overchargeMaxLevel = this.cRoot.gameSettings.engineers.tesla.overchargeLevels;
         this.overchargeReloadTime = this.cRoot.gameSettings.engineers.tesla.overchargeCoolDown;
      }
   }
}
