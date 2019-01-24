package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import org.casalib.math.geom.Ellipse;
   
   public class TowerSoldierSasquash extends §_-Go§
   {
       
      
      private var §_-9D§:int;
      
      public function TowerSoldierSasquash(param1:int, param2:int, param3:Point)
      {
         super(param1,param2,param3);
         this.§_-3F§ = "sasquash";
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.§_-9D§ = this.cRoot.gameSettings.specials.sasquash.max;
         this.building = false;
         this.soldiers = new Dictionary(true);
         this.soldierInit.x = this.x - 60;
         this.soldierInit.y = this.y + 15;
         this.addEventListener(MouseEvent.CLICK,clickEvent,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,rollOverEvents,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,rollOutEvents,false,0,true);
      }
      
      override public function getInfo() : Object
      {
         var _loc1_:Object = {};
         _loc1_.tName = Locale.loadStringEx("SPECIAL_SASQUASH_NAME",Locale.getDefaultLang());
         _loc1_.tIconName = this.§_-3F§;
         _loc1_.tSoldierName = "sasquash";
         _loc1_.tHealth = this.cRoot.gameSettings.specials.sasquash.health;
         _loc1_.tArmor = this.cRoot.gameSettings.specials.sasquash.armor;
         _loc1_.tDamageMin = this.cRoot.gameSettings.specials.sasquash.minDamage;
         _loc1_.tDamageMax = this.cRoot.gameSettings.specials.sasquash.maxDamage;
         _loc1_.tRespawn = "-";
         return _loc1_;
      }
      
      public function getTooltipParams(param1:String) : Object
      {
         var _loc2_:String = Locale.getDefaultLang();
         switch(param1)
         {
            case "special_sasquash":
               return {
                  "title":Locale.loadStringEx("SPECIAL_SASQUASH_NAME",_loc2_),
                  "text":Locale.loadStringEx("SPECIAL_SASQUASH_DESCRIPTION",_loc2_)
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
         MovieClip(this.cRoot).quickMenu.load(this.x,this.y + 15,this,false,180,true,new Array(new Array("buy_sasquash","tw_sasquash",this.cRoot.gameSettings.specials.sasquash.cost,false,0,0,0,7,"TooltipBasic",this.getTooltipParams("special_sasquash"),"max_sasquash"),new Array("rally","tw_rally",0,false,0,0,0,9,"TooltipBasic",this.getTooltipParams("rally_point"))));
         this.cRoot.quickMenu.show(this.cRoot.gui);
      }
      
      override public function upgradeTower(param1:String) : void
      {
         switch(param1)
         {
            case "buy_sasquash":
               this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.specials.sasquash.cost;
               this.cRoot.updateCash(-this.cRoot.gameSettings.specials.sasquash.cost);
               this.§_-8A§();
               break;
            case "rally":
               this.cRoot.bullets.addChild(new TowerRallyPoint(this.cRoot,this,false,this.cRoot.gameSettings.specials.sasquash.rallyRange,15));
               this.cRoot.disableLevelElements();
               this.showRangeRallyPoint(this.cRoot.gameSettings.specials.sasquash.rallyRange,this.cRoot.gameSettings.specials.sasquash.rallyRange * this.cRoot.gameSettings.rangeRatio);
         }
      }
      
      override public function showRangeRallyPoint(param1:int, param2:int) : void
      {
         this.cRoot.towerRangeRallyPoint.width = param1;
         this.cRoot.towerRangeRallyPoint.height = param2;
         this.cRoot.towerRangeRallyPoint.x = this.x;
         this.cRoot.towerRangeRallyPoint.y = this.y + 15;
         this.cRoot.towerRangeRallyPoint.visible = true;
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
         this.playSoldierTaunt();
      }
      
      public function checkDisableCondition(param1:String) : Boolean
      {
         return this.§_-5T§();
      }
      
      private function §_-5T§() : Boolean
      {
         if(this.getNumberOfSoldiers() == this.§_-9D§)
         {
            return false;
         }
         return true;
      }
      
      private function §_-8A§() : *
      {
         this.cRoot.game.gameAchievement.likeAHenderson(this.cRoot);
         var _loc1_:Soldier = new SoldierSasquash(this.soldierInit,null,this);
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
         return _loc1_;
      }
      
      override public function playSoldierTaunt() : void
      {
         this.cRoot.game.gameSounds.playSasquashRally();
      }
      
      override public function getGraphic() : MovieClip
      {
         return MovieClip(this);
      }
      
      override protected function addGlow() : void
      {
         var _loc8_:Number = BitmapFilterQuality.HIGH;
         var _loc9_:GlowFilter = new GlowFilter(16772164,0.7,6,6,6,_loc8_,true,false);
         this.getGraphic().filters = new Array(_loc9_);
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
   }
}
