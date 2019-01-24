package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class TowerSoldierBarbarian extends §_-Go§
   {
       
      
      private var throwingCurrentLevel:int = 0;
      
      private var throwingMaxLevel:int;
      
      private var dualWeaponsCurrentLevel:int = 0;
      
      private var §_-ON§:int;
      
      private var huntingNetsCurrentLevel:int = 0;
      
      private var huntingNetsMaxLevel:int;
      
      public function TowerSoldierBarbarian(param1:int, param2:int, param3:Point, param4:Dictionary, param5:int)
      {
         addFrameScript(0,this.frame1,24,this.frame25);
         super(param1,param2,param3);
         this.soldiers = param4;
         this.§_-3F§ = "barbarian";
         this.§_-6p§ = param5;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override public function init(param1:Event) : void
      {
         var _loc2_:Soldier = null;
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.playBarbarianTaunt();
         this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.soldiers.barbarian.cost;
         this.cRoot.updateCash(-this.cRoot.gameSettings.soldiers.barbarian.cost);
         this.setBaseSettings(§_-K8§);
         this.building = false;
         this.soldierInit.x = this.x;
         this.soldierInit.y = this.y;
         this.cRoot.bullets.addChild(new TowerBuildingCloud(new Point(this.x,this.y)));
         for each(_loc2_ in this.soldiers)
         {
            _loc2_.updateTower(this);
            if(!this.cRoot.entities.contains(_loc2_))
            {
               _loc2_.isRespawning = true;
               _loc2_.doorQueed = false;
               this.cRoot.entities.addChild(_loc2_);
            }
         }
         this.§_-RT§(new §_-9i§());
         this.cRoot.game.gameAchievement.buildTowerBarbarian(this.cRoot);
         this.cRoot.menu.showTowerBarracksInfo(this);
         this.unSelect();
         this.addEventListener(MouseEvent.CLICK,clickEvent,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,rollOverEvents,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,rollOutEvents,false,0,true);
      }
      
      override public function getInfo() : Object
      {
         var _loc1_:Object = {};
         _loc1_.tName = Locale.loadStringEx("TOWER_BARBARIANS_NAME",Locale.getDefaultLang());
         _loc1_.tIconName = this.§_-3F§;
         _loc1_.tSoldierName = "barbarian";
         _loc1_.tHealth = this.cRoot.gameSettings.soldiers.barbarian.health;
         _loc1_.tArmor = this.cRoot.gameSettings.soldiers.barbarian.armor;
         _loc1_.tDamageMin = this.cRoot.gameSettings.soldiers.barbarian.minDamage + this.cRoot.gameSettings.soldiers.barbarian.dualWeaponsIncrementDamage * this.dualWeaponsCurrentLevel;
         _loc1_.tDamageMax = this.cRoot.gameSettings.soldiers.barbarian.maxDamage + this.cRoot.gameSettings.soldiers.barbarian.dualWeaponsIncrementDamage * this.dualWeaponsCurrentLevel;
         _loc1_.tRespawn = this.cRoot.gameSettings.soldiers.barbarian.respawn;
         return _loc1_;
      }
      
      public function getTooltipParams(param1:String) : Object
      {
         var _loc2_:String = Locale.getDefaultLang();
         switch(param1)
         {
            case "special_throwing":
               return {
                  "title":Locale.loadStringEx("TOWER_BARBARIANS_THROWING_AXES_NAME",_loc2_),
                  "text":Locale.loadStringEx("TOWER_BARBARIANS_THROWING_AXES_DESCRIPTION",_loc2_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc2_),this.cRoot.gameSettings.soldiers.barbarian.throwingMinDamage + this.cRoot.gameSettings.soldiers.barbarian.throwingIncrementDamage * this.getNextLevel(this.throwingCurrentLevel,this.throwingMaxLevel) + "-" + (this.cRoot.gameSettings.soldiers.barbarian.throwingMaxDamage + this.cRoot.gameSettings.soldiers.barbarian.throwingIncrementDamage * this.getNextLevel(this.throwingCurrentLevel,this.throwingMaxLevel)),this.getColorByLevel(this.throwingCurrentLevel,this.throwingMaxLevel)],[Locale.loadStringEx("C_RANGE",_loc2_),this.cRoot.gameSettings.soldiers.barbarian.throwingRange + this.cRoot.gameSettings.soldiers.barbarian.throwingIncrementRange * this.getNextLevel(this.throwingCurrentLevel,this.throwingMaxLevel),this.getColorByLevel(this.throwingCurrentLevel,this.throwingMaxLevel)],[Locale.loadStringEx("C_RELOAD",_loc2_),this.cRoot.gameSettings.soldiers.barbarian.throwingCoolDown / this.cRoot.gameSettings.framesRate + "s","white"]],
                  "notes":Locale.loadStringEx("TOWER_BARBARIANS_THROWING_AXES_NOTE",_loc2_)
               };
            case "special_dualweapons":
               return {
                  "title":Locale.loadStringEx("TOWER_BARBARIANS_DOUBLE_AXE_NAME",_loc2_),
                  "text":Locale.loadStringEx("TOWER_BARBARIANS_DOUBLE_AXE_DESCRIPTION",_loc2_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc2_),"+" + this.cRoot.gameSettings.soldiers.barbarian.dualWeaponsIncrementDamage * this.getNextLevel(this.dualWeaponsCurrentLevel,this.§_-ON§),this.getColor(this.dualWeaponsCurrentLevel,this.§_-ON§)]],
                  "notes":Locale.loadStringEx("TOWER_BARBARIANS_DOUBLE_AXE_NOTE",_loc2_)
               };
            case "special_huntingnets":
               return {
                  "title":Locale.loadStringEx("TOWER_BARBARIANS_HUNTER_NETS_NAME",_loc2_),
                  "text":Locale.loadStringEx("TOWER_BARBARIANS_HUNTER_NETS_DESCRIPTION",_loc2_),
                  "atts":[[Locale.loadStringEx("C_SLOW",_loc2_),this.cRoot.gameSettings.soldiers.barbarian.huntingNetsNewSpeed + this.cRoot.gameSettings.soldiers.barbarian.huntingNetsNewSpeedIncrement * this.getNextLevel(this.huntingNetsCurrentLevel,this.huntingNetsMaxLevel),this.getColorByLevel(this.huntingNetsCurrentLevel,this.huntingNetsMaxLevel)],[Locale.loadStringEx("C_RELOAD",_loc2_),this.cRoot.gameSettings.soldiers.barbarian.huntingNetsCoolDown / this.cRoot.gameSettings.framesRate + "s","white"]],
                  "notes":Locale.loadStringEx("TOWER_BARBARIANS_HUNTER_NETS_NOTE",_loc2_)
               };
            case "rally_point":
               return {
                  "title":Locale.loadStringEx("TOWER_BARRACKS_RALLY_POINT",_loc2_),
                  "text":Locale.loadStringEx("TOWER_BARRACKS_RALLY_POINT_DESCRIPTION",_loc2_)
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
         var _loc1_:String = Locale.getDefaultLang();
         MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,true,180,false,new Array(new Array("special_throwing","sp_throwing_axe",this.cRoot.gameSettings.soldiers.barbarian.throwingCost,false,this.throwingCurrentLevel,this.throwingMaxLevel,this.cRoot.gameSettings.soldiers.barbarian.throwingCostLevel,10,"TooltipBasic",this.getTooltipParams("special_throwing")),new Array("special_dualweapons","sp_dualweapons",this.cRoot.gameSettings.soldiers.barbarian.dualWeaponsCost,false,this.dualWeaponsCurrentLevel,this.§_-ON§,this.cRoot.gameSettings.soldiers.barbarian.dualWeaponsCostLevel,11,"TooltipBasic",this.getTooltipParams("special_dualweapons")),new Array("special_huntingnets","sp_nets",this.cRoot.gameSettings.soldiers.barbarian.huntingNetsCost,false,this.huntingNetsCurrentLevel,this.huntingNetsMaxLevel,this.cRoot.gameSettings.soldiers.barbarian.huntingNetsCostLevel,7,"TooltipBasic",this.getTooltipParams("special_huntingnets")),new Array("rally","tw_rally",0,false,0,0,0,9,"TooltipBasic",this.getTooltipParams("rally_point"))));
         this.cRoot.quickMenu.show(this.cRoot.gui);
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
               this.destroyThis(true);
               break;
            case "special_throwing":
               this.cRoot.game.gameSounds.playBarbarianTrowingAxesTaunt();
               this.upgradeThrowing();
               break;
            case "special_dualweapons":
               this.cRoot.game.gameSounds.playBarbarianDoubleAxesTaunt();
               this.upgradeDualWeapons();
               this.cRoot.menu.showTowerBarracksInfo(this);
               break;
            case "special_huntingnets":
               this.cRoot.game.gameSounds.playBarbarianNetTaunt();
               this.upgradeHuntingNets();
               break;
            case "rally":
               this.cRoot.bullets.addChild(new TowerRallyPoint(this.cRoot,this));
               this.cRoot.disableLevelElements();
               this.showRangeRallyPoint(this.cRoot.gameSettings.soldiers.barbarian.rangeRally,this.cRoot.gameSettings.soldiers.barbarian.rangeRally * this.cRoot.gameSettings.rangeRatio);
         }
      }
      
      override public function playSoldierTaunt() : void
      {
         this.cRoot.game.gameSounds.playBarbarianTaunt();
      }
      
      override public function getGraphic() : MovieClip
      {
         return MovieClip(this);
      }
      
      override public function openDoor() : void
      {
         if(this.§_-Kk§ == §_-82§)
         {
            this.§_-Kk§ = §_-DZ§;
            this.gotoAndPlay("open_door");
            this.§_-Cp§ = 0;
         }
      }
      
      private function upgradeThrowing() : void
      {
         var _loc1_:§_-D7§ = null;
         this.throwingCurrentLevel++;
         if(this.throwingCurrentLevel == 1)
         {
            this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.soldiers.barbarian.throwingCost;
            this.cRoot.updateCash(-this.cRoot.gameSettings.soldiers.barbarian.throwingCost);
         }
         else
         {
            this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.soldiers.barbarian.throwingCostLevel;
            this.cRoot.updateCash(-this.cRoot.gameSettings.soldiers.barbarian.throwingCostLevel);
         }
         for each(_loc1_ in this.soldiers)
         {
            _loc1_.upgradeThrowingAxes(this.throwingCurrentLevel);
         }
      }
      
      private function upgradeDualWeapons() : void
      {
         var _loc1_:§_-D7§ = null;
         this.dualWeaponsCurrentLevel++;
         if(this.dualWeaponsCurrentLevel == 1)
         {
            this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.soldiers.barbarian.dualWeaponsCost;
            this.cRoot.updateCash(-this.cRoot.gameSettings.soldiers.barbarian.dualWeaponsCost);
         }
         else
         {
            this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.soldiers.barbarian.dualWeaponsCostLevel;
            this.cRoot.updateCash(-this.cRoot.gameSettings.soldiers.barbarian.dualWeaponsCostLevel);
         }
         for each(_loc1_ in this.soldiers)
         {
            _loc1_.upgradeDualWeapons(this.dualWeaponsCurrentLevel);
         }
      }
      
      private function upgradeHuntingNets() : void
      {
         var _loc1_:§_-D7§ = null;
         this.huntingNetsCurrentLevel++;
         if(this.huntingNetsCurrentLevel == 1)
         {
            this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.soldiers.barbarian.huntingNetsCost;
            this.cRoot.updateCash(-this.cRoot.gameSettings.soldiers.barbarian.huntingNetsCost);
         }
         else
         {
            this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.soldiers.barbarian.huntingNetsCostLevel;
            this.cRoot.updateCash(-this.cRoot.gameSettings.soldiers.barbarian.huntingNetsCostLevel);
         }
         for each(_loc1_ in this.soldiers)
         {
            _loc1_.upgradeHuntingNettings(this.huntingNetsCurrentLevel);
         }
      }
      
      public function setBaseSettings(param1:int) : void
      {
         this.level = param1;
         this.§_-2G§ = 3;
         this.throwingMaxLevel = this.cRoot.gameSettings.soldiers.barbarian.throwingLevels;
         this.huntingNetsMaxLevel = this.cRoot.gameSettings.soldiers.barbarian.huntingNetsLevels;
         this.§_-ON§ = this.cRoot.gameSettings.soldiers.barbarian.dualWeaponsLevels;
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame25() : *
      {
         stop();
      }
   }
}
