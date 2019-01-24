package
{
   import com.reintroducing.sound.SoundManager;
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   
   public class TowerHolder extends MovieClip
   {
       
      
      public var soldierRallyPoint:Point;
      
      public var rallyPoint:§_-OK§;
      
      public var yAdjust:int = 36;
      
      public var §_-96§:Sprite;
      
      public var cRoot:Level;
      
      public var game:MovieClip;
      
      public function TowerHolder(param1:int, param2:int, param3:Point)
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2);
         this.x = param1;
         this.y = param2 - this.yAdjust;
         this.soldierRallyPoint = param3;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.game = MovieClip(this.parent.parent.parent);
         this.gotoAndStop(this.cRoot.§_-JX§);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.clickEvent,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOverEvents,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOutEvents,false,0,true);
      }
      
      public function onFrameUpdate() : void
      {
      }
      
      public function pause() : void
      {
      }
      
      public function unPause() : void
      {
      }
      
      public function showRangeNew(param1:int, param2:int) : void
      {
         this.cRoot.towerRangeNew.width = param1;
         this.cRoot.towerRangeNew.height = param2;
         this.cRoot.towerRangeNew.x = this.x;
         this.cRoot.towerRangeNew.y = this.y - 10 + this.yAdjust;
         this.cRoot.towerRangeNew.visible = true;
      }
      
      public function showRangeRallyPoint(param1:int, param2:int) : void
      {
         this.cRoot.towerRangeRallyPoint.width = param1;
         this.cRoot.towerRangeRallyPoint.height = param2;
         this.cRoot.towerRangeRallyPoint.x = this.x;
         this.cRoot.towerRangeRallyPoint.y = this.y - 10 + this.yAdjust;
         this.cRoot.towerRangeRallyPoint.visible = true;
      }
      
      public function §_-4A§() : void
      {
         this.cRoot.towerRangeRallyPoint.visible = false;
      }
      
      public function removeRangeNew() : void
      {
         this.cRoot.towerRangeNew.visible = false;
      }
      
      public function checkMenuRollOverAction(param1:String) : void
      {
         switch(param1)
         {
            case "archer":
               this.showRangeNew(this.cRoot.gameSettings.archers.level1.range,this.cRoot.gameSettings.archers.level1.range * this.cRoot.gameSettings.rangeRatio);
               break;
            case "soldier":
               this.showRangeRallyPoint(this.cRoot.gameSettings.soldiers.level1.rangeRally,this.cRoot.gameSettings.soldiers.level1.rangeRally * this.cRoot.gameSettings.rangeRatio);
               break;
            case "mage":
               this.showRangeNew(this.cRoot.gameSettings.mages.level1.range,this.cRoot.gameSettings.mages.level1.range * this.cRoot.gameSettings.rangeRatio);
               break;
            case "engineer":
               this.showRangeNew(this.cRoot.gameSettings.engineers.level1.range,this.cRoot.gameSettings.engineers.level1.range * this.cRoot.gameSettings.rangeRatio);
         }
      }
      
      protected function getCostMage(param1:int) : int
      {
         if(this.cRoot.game.gameUpgrades.magesUpHermeticStudy == true && (this.cRoot.maxUpgradeLevel == 0 || this.cRoot.maxUpgradeLevel >= 3))
         {
            return Math.ceil(param1 - param1 * 0.1);
         }
         return param1;
      }
      
      protected function getCostEngineer(param1:int) : int
      {
         if(this.cRoot.game.gameUpgrades.engineersUpFieldLogistics == true && (this.cRoot.maxUpgradeLevel == 0 || this.cRoot.maxUpgradeLevel >= 3))
         {
            return Math.ceil(param1 - param1 * 0.1);
         }
         return param1;
      }
      
      public function checkMenuRollOutAction(param1:String) : void
      {
         this.removeRangeNew();
         this.§_-4A§();
      }
      
      public function §_-P9§() : Boolean
      {
         if(this.cRoot.quickMenu == null)
         {
            return false;
         }
         if(this.cRoot.quickMenu.cTower == this)
         {
            return true;
         }
         return false;
      }
      
      public function unSelect() : void
      {
         this.cRoot.towerRange.visible = false;
         this.cRoot.towerRangeNew.visible = false;
         this.cRoot.towerRangeRallyPoint.visible = false;
         this.§_-9H§();
      }
      
      public function clickEvent(param1:MouseEvent) : void
      {
         this.cRoot.menu.forceHideInfo();
         if(!this.cRoot.enableElements)
         {
            return;
         }
         if(this.cRoot.quickMenu.cTower == this)
         {
            this.cRoot.forceFreeQuickMenu();
            return;
         }
         var _loc2_:String = Locale.getDefaultLang();
         this.cRoot.quickMenu.load(this.x,this.y - 10 + this.yAdjust,this,false,0,true,new Array(new Array("archer","tw_archer",this.cRoot.gameSettings.archers.level1.cost,this.cRoot.isTowerLocked(GameSettings.§_-U§,1),false,0,0,1,"TooltipBasic",{
            "title":Locale.loadStringEx("TOWER_ARCHERS_NAME",_loc2_),
            "text":Locale.loadStringEx("TOWER_ARCHERS_DESCRIPTION",_loc2_),
            "atts":[[Locale.loadStringEx("C_DAMAGE",_loc2_),this.cRoot.gameSettings.archers.level1.minDamage + "-" + this.cRoot.gameSettings.archers.level1.maxDamage,"white"],[Locale.loadStringEx("C_RELOAD",_loc2_),this.cRoot.gameSettings.getReloadString(this.cRoot.gameSettings.archers.level1.reload / this.cRoot.gameSettings.framesRate),"white"]]
         }),new Array("soldier","tw_soldier",this.cRoot.gameSettings.soldiers.level1.cost,this.cRoot.isTowerLocked(GameSettings.§_-5z§,1),0,0,0,2,"TooltipBasic",{
            "title":Locale.loadStringEx("TOWER_BARRACKS_NAME",_loc2_),
            "text":Locale.loadStringEx("TOWER_BARRACKS_DESCRIPTION",_loc2_),
            "atts":[[Locale.loadStringEx("C_LIFE",_loc2_),this.cRoot.gameSettings.soldiers.level1.health,"white"],[Locale.loadStringEx("C_DAMAGE",_loc2_),this.cRoot.gameSettings.soldiers.level1.minDamage + "-" + this.cRoot.gameSettings.soldiers.level1.maxDamage,"white"],[Locale.loadStringEx("C_ARMOR",_loc2_),this.cRoot.gameSettings.getArmorString(this.cRoot.gameSettings.soldiers.level1.armor),"white"],[Locale.loadStringEx("C_RESPAWN",_loc2_),this.cRoot.gameSettings.soldiers.level1.respawn / this.cRoot.gameSettings.framesRate + Locale.loadStringEx("C_SEC",_loc2_),"white"]]
         }),new Array("mage","tw_mage",this.getCostMage(this.cRoot.gameSettings.mages.level1.cost),this.cRoot.isTowerLocked(GameSettings.§_-5d§,1),0,0,0,3,"TooltipBasic",{
            "title":Locale.loadStringEx("TOWER_MAGES_NAME",_loc2_),
            "text":Locale.loadStringEx("TOWER_MAGES_DESCRIPTION",_loc2_),
            "atts":[[Locale.loadStringEx("C_DAMAGE",_loc2_),this.cRoot.gameSettings.mages.level1.minDamage + "-" + this.cRoot.gameSettings.mages.level1.maxDamage,"white"],[Locale.loadStringEx("C_RELOAD",_loc2_),this.cRoot.gameSettings.getReloadString(this.cRoot.gameSettings.mages.level1.reload / this.cRoot.gameSettings.framesRate),"white"]]
         }),new Array("engineer","tw_engineer",this.getCostEngineer(this.cRoot.gameSettings.engineers.level1.cost),this.cRoot.isTowerLocked(GameSettings.§_-Ko§,1),0,0,0,4,"TooltipBasic",{
            "title":Locale.loadStringEx("TOWER_ENGINEERS_NAME",_loc2_),
            "text":Locale.loadStringEx("TOWER_ENGINEERS_DESCRIPTION",_loc2_),
            "atts":[[Locale.loadStringEx("C_DAMAGE",_loc2_),this.cRoot.gameSettings.engineers.level1.minDamage + "-" + this.cRoot.gameSettings.engineers.level1.maxDamage,"white"],[Locale.loadStringEx("C_RELOAD",_loc2_),this.cRoot.gameSettings.getReloadString(this.cRoot.gameSettings.engineers.level1.reload / this.cRoot.gameSettings.framesRate),"white"]]
         })));
         this.cRoot.quickMenu.show(this.cRoot.gui);
      }
      
      public function rollOverEvents(param1:MouseEvent) : void
      {
         if(!this.cRoot.enableElements)
         {
            return;
         }
         if(!this.§_-P9§())
         {
            this.cRoot.game.gameSounds.playGUIMouseOverCommon();
            this.buttonMode = true;
            this.mouseChildren = false;
            this.useHandCursor = true;
            this.addGlow();
         }
      }
      
      public function rollOutEvents(param1:MouseEvent) : void
      {
         if(!this.cRoot.enableElements)
         {
            return;
         }
         if(!this.§_-P9§())
         {
            this.cRoot.game.gameSounds.stopSound("gui_mouse_over_tower_common");
            this.useHandCursor = false;
            this.§_-9H§();
         }
      }
      
      public function upgradeTower(param1:String) : void
      {
         var _loc2_:Tower = null;
         SoundManager.getInstance().playSound("tower_building",this.cRoot.game.gameSounds.§_-2P§,0,0);
         if(param1 == "mage")
         {
            _loc2_ = new TowerMage(this.x,this.y + this.yAdjust,this.soldierRallyPoint);
         }
         else if(param1 == "archer")
         {
            _loc2_ = new TowerArcher(this.x,this.y + this.yAdjust,this.soldierRallyPoint);
         }
         else if(param1 == "soldier")
         {
            _loc2_ = new §_-Go§(this.x,this.y + this.yAdjust,this.soldierRallyPoint);
         }
         else if(param1 == "engineer")
         {
            _loc2_ = new §_-SC§(this.x,this.y + this.yAdjust,this.soldierRallyPoint);
         }
         this.cRoot.entities.addChild(_loc2_);
         this.cRoot.towers[_loc2_] = _loc2_;
         if(this.cRoot.data.levelIndex == 0 && Level1(this.cRoot).§_-FP§ != null)
         {
            Level1(this.cRoot).§_-FP§.closeMe();
         }
         this.destroyThis();
      }
      
      private function addGlow() : void
      {
         var _loc8_:Number = BitmapFilterQuality.HIGH;
         var _loc9_:GlowFilter = new GlowFilter(16772164,0.9,4,4,8,_loc8_,false,false);
         this.filters = new Array(_loc9_);
      }
      
      private function §_-9H§() : void
      {
         var _loc1_:ColorMatrixFilter = new ColorMatrixFilter([1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0]);
         this.filters = [_loc1_];
      }
      
      private function destroyThis() : void
      {
         this.unSelect();
         this.soldierRallyPoint = null;
         this.rallyPoint = null;
         this.§_-96§ = null;
         this.cRoot = null;
         this.game = null;
         this.removeEventListener(MouseEvent.ROLL_OVER,this.rollOverEvents);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.rollOutEvents);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.removeEventListener(MouseEvent.CLICK,this.clickEvent);
         this.parent.removeChild(this);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame2() : *
      {
         stop();
      }
   }
}
