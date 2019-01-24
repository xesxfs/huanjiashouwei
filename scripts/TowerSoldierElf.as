package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import org.casalib.math.geom.Ellipse;
   
   public class TowerSoldierElf extends §_-Go§
   {
       
      
      private var maxElves:int;
      
      public function TowerSoldierElf(param1:int, param2:int, param3:Point)
      {
         addFrameScript(0,this.frame1,24,this.frame25);
         super(param1,param2,param3);
         this.§_-3F§ = "elf";
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.specials.elves.repairCost;
         this.cRoot.updateCash(-this.cRoot.gameSettings.specials.elves.repairCost);
         this.maxElves = this.cRoot.gameSettings.specials.elves.max;
         this.building = false;
         this.soldiers = new Dictionary(true);
         this.soldierInit.x = this.x;
         this.soldierInit.y = this.y;
         this.cRoot.bullets.addChild(new TowerBuildingCloud(new Point(this.x,this.y)));
         this.addEventListener(MouseEvent.CLICK,clickEvent,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,rollOverEvents,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,rollOutEvents,false,0,true);
      }
      
      override public function getInfo() : Object
      {
         var _loc1_:Object = {};
         _loc1_.tName = Locale.loadStringEx("SPECIAL_ELF_NAME",Locale.getDefaultLang());
         _loc1_.tIconName = this.§_-3F§;
         _loc1_.tSoldierName = "elf";
         _loc1_.tHealth = this.cRoot.gameSettings.specials.elves.health;
         _loc1_.tArmor = this.cRoot.gameSettings.specials.elves.armor;
         _loc1_.tDamageMin = this.cRoot.gameSettings.specials.elves.minDamage;
         _loc1_.tDamageMax = this.cRoot.gameSettings.specials.elves.maxDamage;
         _loc1_.tRespawn = "-";
         return _loc1_;
      }
      
      public function getTooltipParams(param1:String) : Object
      {
         var _loc2_:String = Locale.getDefaultLang();
         switch(param1)
         {
            case "special_elf":
               return {
                  "title":Locale.loadStringEx("SPECIAL_ELF_NAME",_loc2_),
                  "text":Locale.loadStringEx("SPECIAL_ELF_NAME_DESCRIPTION",_loc2_)
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
         MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,false,180,true,new Array(new Array("buy_elf","tw_elf",this.cRoot.gameSettings.specials.elves.elfCost,false,0,0,0,7,"TooltipBasic",this.getTooltipParams("special_elf"),"max_elf"),new Array("rally","tw_rally",0,false,0,0,0,9,"TooltipBasic",this.getTooltipParams("rally_point"))));
         this.cRoot.quickMenu.show(this.cRoot.gui);
      }
      
      override public function upgradeTower(param1:String) : void
      {
         switch(param1)
         {
            case "buy_elf":
               this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.specials.elves.elfCost;
               this.cRoot.updateCash(-this.cRoot.gameSettings.specials.elves.elfCost);
               this.§_-56§();
               break;
            case "rally":
               this.cRoot.bullets.addChild(new TowerRallyPoint(this.cRoot,this));
               this.cRoot.disableLevelElements();
               this.showRangeRallyPoint(this.cRoot.gameSettings.soldiers.level1.rangeRally,this.cRoot.gameSettings.soldiers.level1.rangeRally * this.cRoot.gameSettings.rangeRatio);
         }
      }
      
      override public function gotoIdle(param1:Point) : void
      {
         var _loc6_:Soldier = null;
         this.soldierRallyPoint.x = param1.x;
         this.soldierRallyPoint.y = param1.y;
         var _loc2_:int = this.getNumberOfSoldiers();
         var _loc3_:int = 360 / _loc2_;
         var _loc4_:* = new Ellipse(param1.x - 40 / 2,param1.y + 10 - 28 / 2,40,28);
         var _loc5_:* = _loc3_;
         for each(_loc6_ in this.soldiers)
         {
            _loc6_.changeRallyPoint(_loc4_.getPointOfDegree(_loc5_));
            _loc5_ = _loc5_ + _loc3_;
         }
         this.cRoot.game.gameSounds.playElfTaunt();
      }
      
      public function checkDisableCondition(param1:String) : Boolean
      {
         return this.§_-5k§();
      }
      
      private function §_-5k§() : Boolean
      {
         if(this.getNumberOfSoldiers() == this.maxElves)
         {
            return false;
         }
         return true;
      }
      
      private function §_-56§() : *
      {
         this.cRoot.game.gameSounds.playElfTaunt();
         var _loc1_:Soldier = new §_-M7§(this.soldierInit,null,this);
         this.addSoldier(_loc1_);
         var _loc2_:int = this.getNumberOfSoldiers();
         var _loc3_:int = 360 / _loc2_;
         var _loc4_:* = new Ellipse(this.soldierRallyPoint.x - 40 / 2,this.soldierRallyPoint.y + 10 - 28 / 2,40,28);
         var _loc5_:* = _loc3_;
         for each(_loc1_ in this.soldiers)
         {
            _loc1_.§_-K0§(_loc4_.getPointOfDegree(_loc5_));
            _loc5_ = _loc5_ + _loc3_;
         }
      }
      
      private function getNumberOfSoldiers() : int
      {
         var _loc2_:* = undefined;
         var _loc1_:int = 0;
         for each(_loc2_ in this.soldiers)
         {
            _loc1_++;
         }
         if(_loc1_ == this.maxElves)
         {
            this.cRoot.game.gameAchievement.checkMaxElves(this.cRoot);
         }
         return _loc1_;
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
      
      function frame1() : *
      {
         stop();
      }
      
      function frame25() : *
      {
         gotoAndStop("idle");
      }
   }
}
