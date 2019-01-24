package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class TowerSoldierElfDestroyed extends §_-Go§
   {
       
      
      public function TowerSoldierElfDestroyed(param1:int, param2:int, param3:Point)
      {
         super(param1,param2,param3);
         this.§_-3F§ = "elf";
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
            case "special_repair_elf":
               return {
                  "title":Locale.loadStringEx("SPECIAL_ELF_REPAIR_NAME",_loc2_),
                  "text":Locale.loadStringEx("SPECIAL_ELF_REPAIR_DESCRIPTION",_loc2_)
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
         MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,false,180,true,new Array(new Array("repair_elf","tw_repair",this.cRoot.gameSettings.specials.elves.repairCost,false,0,0,0,7,"TooltipBasic",this.getTooltipParams("special_repair_elf"))));
         this.cRoot.quickMenu.show(this.cRoot.gui);
      }
      
      override public function upgradeTower(param1:String) : void
      {
         var _loc2_:Tower = null;
         switch(param1)
         {
            case "repair_elf":
               this.§_-HP§();
               _loc2_ = new TowerSoldierElf(this.x,this.y,this.soldierRallyPoint);
               this.cRoot.entities.addChild(_loc2_);
               this.cRoot.towers[_loc2_] = _loc2_;
               this.destroyThis(true);
         }
      }
      
      override public function getGraphic() : MovieClip
      {
         return MovieClip(this);
      }
   }
}
