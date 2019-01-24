package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class TowerSoldierSasquashFrozen extends §_-Go§
   {
       
      
      private var §_-DV§:Boolean = false;
      
      private var freeAnimationTime:int = 46;
      
      private var freeAnimationTimeCounter:int;
      
      public function TowerSoldierSasquashFrozen(param1:int, param2:int, param3:Point)
      {
         addFrameScript(0,this.frame1,43,this.frame44);
         super(param1,param2,param3);
         this.§_-3F§ = "sasquash";
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.building = false;
         this.addEventListener(MouseEvent.CLICK,clickEvent,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,rollOverEvents,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,rollOutEvents,false,0,true);
      }
      
      override public function onFrameUpdate() : void
      {
         if(!this.§_-DV§)
         {
            return;
         }
         if(this.freeAnimationTimeCounter < this.freeAnimationTime)
         {
            this.freeAnimationTimeCounter++;
            return;
         }
         var _loc1_:Tower = new TowerSoldierSasquash(202,169,this.soldierRallyPoint);
         this.cRoot.entities.addChild(_loc1_);
         this.cRoot.towers[_loc1_] = _loc1_;
         this.cRoot.forceFreeQuickMenu();
         this.destroyThis(false);
      }
      
      override public function pause() : void
      {
         this.stop();
      }
      
      override public function unPause() : void
      {
         if(this.currentFrameLabel != "idle")
         {
            this.play();
         }
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
                  "title":Locale.loadStringEx("SPECIAL_SASQUASH_REPAIR_NAME",_loc2_),
                  "text":Locale.loadStringEx("SPECIAL_SASQUASH_REPAIR_DESCRIPTION",_loc2_)
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
         MovieClip(this.cRoot).quickMenu.load(this.x,this.y + 15,this,false,180,true,new Array(new Array("buy_sasquash","tw_sasquash",0,false,0,0,0,7,"TooltipBasic",this.getTooltipParams("special_sasquash"),"frozen")));
         this.cRoot.quickMenu.show(this.cRoot.gui);
      }
      
      override public function upgradeTower(param1:String) : void
      {
         switch(param1)
         {
            case "free":
               this.gotoAndPlay("free");
               this.§_-DV§ = true;
               this.freeAnimationTimeCounter = 0;
         }
      }
      
      public function checkDisableCondition(param1:String) : Boolean
      {
         return false;
      }
      
      override public function getGraphic() : MovieClip
      {
         return MovieClip(this);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame44() : *
      {
         stop();
      }
   }
}
