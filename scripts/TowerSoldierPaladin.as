package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class TowerSoldierPaladin extends §_-Go§
   {
       
      
      public var flag:MovieClip;
      
      private var healingCurrenLevel:int = 0;
      
      private var healingMaxLevel:int;
      
      private var holyStrikeCurrentLevel:int = 0;
      
      private var holyStrikeMaxLevel:int;
      
      private var shieldCurrentLevel:int = 0;
      
      private var shieldMaxLevel:int;
      
      public function TowerSoldierPaladin(param1:int, param2:int, param3:Point, param4:Dictionary, param5:int)
      {
         addFrameScript(0,this.frame1,24,this.frame25);
         super(param1,param2,param3);
         this.soldiers = param4;
         this.§_-3F§ = "paladin";
         this.§_-6p§ = param5;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override public function init(param1:Event) : void
      {
         var _loc2_:Soldier = null;
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.playPaladinTaunt();
         this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.soldiers.paladin.cost;
         this.cRoot.updateCash(-this.cRoot.gameSettings.soldiers.paladin.cost);
         this.setBaseSettings(§_-NS§);
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
         this.cRoot.game.gameAchievement.buildTowerPaladin(this.cRoot);
         this.cRoot.menu.showTowerBarracksInfo(this);
         this.unSelect();
         this.addEventListener(MouseEvent.CLICK,clickEvent,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,rollOverEvents,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,rollOutEvents,false,0,true);
      }
      
      override public function getInfo() : Object
      {
         var _loc1_:Object = {};
         _loc1_.tName = Locale.loadStringEx("TOWER_PALADINS_NAME",Locale.getDefaultLang());
         _loc1_.tIconName = this.§_-3F§;
         _loc1_.tSoldierName = "paladin";
         _loc1_.tHealth = this.cRoot.gameSettings.soldiers.paladin.health;
         _loc1_.tArmor = this.cRoot.gameSettings.soldiers.paladin.armor + this.cRoot.gameSettings.soldiers.paladin.shieldArmor * this.shieldCurrentLevel;
         _loc1_.tDamageMin = this.cRoot.gameSettings.soldiers.paladin.minDamage;
         _loc1_.tDamageMax = this.cRoot.gameSettings.soldiers.paladin.maxDamage;
         _loc1_.tRespawn = this.cRoot.gameSettings.soldiers.paladin.respawn;
         return _loc1_;
      }
      
      override public function pause() : void
      {
         if(this.building)
         {
            return;
         }
         this.getGraphic().stop();
         this.getGraphic().flag.stop();
      }
      
      override public function unPause() : void
      {
         if(this.building)
         {
            return;
         }
         if(MovieClip(this.getGraphic()).currentFrameLabel != "idle" && MovieClip(this.getGraphic()).currentFrameLabel != "door_closed")
         {
            this.getGraphic().play();
         }
         this.getGraphic().flag.play();
      }
      
      public function getTooltipParams(param1:String) : Object
      {
         var _loc2_:String = Locale.getDefaultLang();
         switch(param1)
         {
            case "special_healing":
               return {
                  "title":Locale.loadStringEx("TOWER_PALADINS_HEALING_NAME",_loc2_),
                  "text":Locale.loadStringEx("TOWER_PALADINS_HEALING_DESCRIPTION",_loc2_),
                  "atts":[[Locale.loadStringEx("C_HEALING",_loc2_),this.cRoot.gameSettings.soldiers.paladin.healingMin * this.getNextLevel(this.healingCurrenLevel,this.healingMaxLevel) + "-" + this.cRoot.gameSettings.soldiers.paladin.healingMax * this.getNextLevel(this.healingCurrenLevel,this.healingMaxLevel),this.getColorByLevel(this.healingCurrenLevel,this.healingMaxLevel)],[Locale.loadStringEx("C_RELOAD",_loc2_),this.cRoot.gameSettings.soldiers.paladin.healingCoolDown / this.cRoot.gameSettings.framesRate + "s","white"]],
                  "notes":Locale.loadStringEx("TOWER_PALADINS_HEALING_NOTE",_loc2_)
               };
            case "special_strike":
               return {
                  "title":Locale.loadStringEx("TOWER_PALADINS_HOLY_STRIKE_NAME",_loc2_),
                  "text":Locale.loadStringEx("TOWER_PALADINS_HOLY_STRIKE_DESCRIPTION",_loc2_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc2_),this.cRoot.gameSettings.soldiers.paladin.holyStrikeMinDamage * this.getNextLevel(this.holyStrikeCurrentLevel,this.holyStrikeMaxLevel) + "-" + this.cRoot.gameSettings.soldiers.paladin.holyStrikeMaxDamage * this.getNextLevel(this.holyStrikeCurrentLevel,this.holyStrikeMaxLevel),this.getColorByLevel(this.holyStrikeCurrentLevel,this.holyStrikeMaxLevel)]],
                  "notes":Locale.loadStringEx("TOWER_PALADINS_HOLY_STRIKE_NOTE",_loc2_)
               };
            case "special_shield":
               return {
                  "title":Locale.loadStringEx("TOWER_PALADINS_SHIELD_NAME",_loc2_),
                  "text":Locale.loadStringEx("TOWER_PALADINS_SHIELD_DESCRIPTION",_loc2_),
                  "atts":[[Locale.loadStringEx("C_ARMOR",_loc2_),this.cRoot.gameSettings.getArmorString(this.cRoot.gameSettings.soldiers.paladin.armor + this.cRoot.gameSettings.soldiers.paladin.shieldArmor),this.getColor(this.shieldCurrentLevel,this.shieldMaxLevel)]],
                  "notes":Locale.loadStringEx("TOWER_PALADINS_SHIELD_NOTE",_loc2_)
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
         MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,true,180,false,new Array(new Array("special_healing","sp_healing",this.cRoot.gameSettings.soldiers.paladin.healingCost,false,this.healingCurrenLevel,this.healingMaxLevel,this.cRoot.gameSettings.soldiers.paladin.healingCostLevel,10,"TooltipBasic",this.getTooltipParams("special_healing")),new Array("special_strike","sp_holystrike",this.cRoot.gameSettings.soldiers.paladin.holyStrikeCost,false,this.holyStrikeCurrentLevel,this.holyStrikeMaxLevel,this.cRoot.gameSettings.soldiers.paladin.holyStrikeCostLevel,11,"TooltipBasic",this.getTooltipParams("special_strike")),new Array("special_shield","sp_shield",this.cRoot.gameSettings.soldiers.paladin.shieldCost,false,this.shieldCurrentLevel,this.shieldMaxLevel,this.cRoot.gameSettings.soldiers.paladin.shieldCostLevel,7,"TooltipBasic",this.getTooltipParams("special_shield")),new Array("rally","tw_rally",0,false,0,0,0,9,"TooltipBasic",this.getTooltipParams("rally_point"))));
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
            case "special_healing":
               this.cRoot.game.gameSounds.playPaladinHealingTaunt();
               this.upgradeSoldierHealing();
               break;
            case "special_strike":
               this.cRoot.game.gameSounds.playPaladinHolyStrikeTaunt();
               this.upgradeHolyStrike();
               break;
            case "special_shield":
               this.cRoot.game.gameSounds.playPaladinShieldTaunt();
               this.upgradeShieldOfValor();
               this.cRoot.menu.showTowerBarracksInfo(this);
               break;
            case "rally":
               this.cRoot.bullets.addChild(new TowerRallyPoint(this.cRoot,this));
               this.cRoot.disableLevelElements();
               this.showRangeRallyPoint(this.cRoot.gameSettings.soldiers.paladin.rangeRally,this.cRoot.gameSettings.soldiers.paladin.rangeRally * this.cRoot.gameSettings.rangeRatio);
         }
      }
      
      override public function playSoldierTaunt() : void
      {
         this.cRoot.game.gameSounds.playPaladinTaunt();
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
      
      private function upgradeSoldierHealing() : void
      {
         var _loc1_:SoldierPaladin = null;
         this.healingCurrenLevel++;
         if(this.healingCurrenLevel == 1)
         {
            this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.soldiers.paladin.healingCost;
            this.cRoot.updateCash(-this.cRoot.gameSettings.soldiers.paladin.healingCost);
         }
         else
         {
            this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.soldiers.paladin.healingCostLevel;
            this.cRoot.updateCash(-this.cRoot.gameSettings.soldiers.paladin.healingCostLevel);
         }
         for each(_loc1_ in this.soldiers)
         {
            _loc1_.upgradeHealing(this.healingCurrenLevel);
         }
      }
      
      private function upgradeHolyStrike() : void
      {
         var _loc1_:SoldierPaladin = null;
         this.holyStrikeCurrentLevel++;
         if(this.holyStrikeCurrentLevel == 1)
         {
            this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.soldiers.paladin.holyStrikeCost;
            this.cRoot.updateCash(-this.cRoot.gameSettings.soldiers.paladin.holyStrikeCost);
         }
         else
         {
            this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.soldiers.paladin.holyStrikeCostLevel;
            this.cRoot.updateCash(-this.cRoot.gameSettings.soldiers.paladin.holyStrikeCostLevel);
         }
         for each(_loc1_ in this.soldiers)
         {
            _loc1_.upgradeHolyStrike(this.holyStrikeCurrentLevel);
         }
      }
      
      private function upgradeShieldOfValor() : void
      {
         var _loc1_:SoldierPaladin = null;
         this.shieldCurrentLevel++;
         if(this.shieldCurrentLevel == 1)
         {
            this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.soldiers.paladin.shieldCost;
            this.cRoot.updateCash(-this.cRoot.gameSettings.soldiers.paladin.shieldCost);
         }
         else
         {
            this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.soldiers.paladin.shieldCostLevel;
            this.cRoot.updateCash(-this.cRoot.gameSettings.soldiers.paladin.shieldCostLevel);
         }
         for each(_loc1_ in this.soldiers)
         {
            _loc1_.upgradeShiledOfValor();
         }
      }
      
      public function setBaseSettings(param1:int) : void
      {
         this.level = param1;
         this.§_-2G§ = 3;
         this.healingMaxLevel = this.cRoot.gameSettings.soldiers.paladin.healingLevels;
         this.holyStrikeMaxLevel = this.cRoot.gameSettings.soldiers.paladin.holyStrikeLevels;
         this.shieldMaxLevel = this.cRoot.gameSettings.soldiers.paladin.shieldLevels;
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
