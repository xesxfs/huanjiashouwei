package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class TowerTemple extends Tower
   {
      
      public static const §_-Ez§:int = 0;
      
      public static const §_-Ca§:int = 1;
      
      public static const §_-KV§:int = 2;
      
      public static const §_-H7§:int = 3;
      
      public static const §_-Mj§:int = 4;
       
      
      private var maxMages:int;
      
      private var magesArray:Array;
      
      private var shootTarget:Enemy;
      
      private var shootTime:int = 16;
      
      private var shootTimeCounter:int;
      
      private var readyInTime:int = 10;
      
      private var readyInTimeCounter:int;
      
      public var §_-Pl§:int = 0;
      
      public function TowerTemple(param1:int, param2:int, param3:Point)
      {
         this.magesArray = [];
         addFrameScript(0,this.frame1,20,this.frame21,30,this.frame31,50,this.frame51,66,this.frame67);
         super(param1,param2,param3);
         this.§_-3F§ = "sunray";
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.maxMages = 4;
         this.building = false;
         this.reloadTime = 0;
         this.addEventListener(MouseEvent.CLICK,this.clickEvent,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,rollOverEvents,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,rollOutEvents,false,0,true);
      }
      
      override public function onFrameUpdate() : void
      {
         if(this.§_-Pl§ == §_-Ez§)
         {
            return;
         }
         if(this.§_-Pl§ == §_-Ca§)
         {
            if(this.reloadTimeCounter < this.reloadTime)
            {
               this.reloadTimeCounter++;
               return;
            }
            this.§_-Pl§ = §_-KV§;
         }
         if(this.§_-Pl§ == §_-KV§)
         {
            if(this.readyInTimeCounter < this.readyInTime)
            {
               this.readyInTimeCounter++;
               return;
            }
            this.§_-Pl§ = §_-H7§;
            this.magesEndCharging();
            this.gotoAndPlay("readyIdle");
         }
         if(this.§_-Pl§ == §_-Mj§)
         {
            if(this.shootTimeCounter < this.shootTime)
            {
               this.shootTimeCounter++;
               if(this.shootTimeCounter == 1)
               {
                  this.cRoot.bullets.addChild(new RayTemple(new Point(this.x,this.y - 90),this.shootTarget,this.magesArray.length));
               }
            }
            else
            {
               this.reloadTimeCounter = 0;
               this.readyInTimeCounter = 0;
               this.shootTimeCounter = 0;
               this.§_-Gk§();
            }
         }
      }
      
      override public function pause() : void
      {
         this.stop();
         var _loc1_:int = 0;
         while(_loc1_ < this.magesArray.length)
         {
            MovieClip(this.magesArray[_loc1_]).stop();
            _loc1_++;
         }
      }
      
      override public function unPause() : void
      {
         switch(this.currentFrameLabel)
         {
            case "chargingEnd":
               this.gotoAndPlay("charging");
               break;
            case "readyInEnd":
               break;
            case "readyIdleEnd":
               this.gotoAndPlay("readyIdle");
               break;
            case "shootEnd":
               break;
            case "inactive":
               break;
            default:
               this.play();
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.magesArray.length)
         {
            switch(MovieClip(this.magesArray[_loc1_]).currentFrameLabel)
            {
               case "idleDown":
                  break;
               case "ChargingDownEnd":
                  MovieClip(this.magesArray[_loc1_]).gotoAndPlay("ChargingDown");
                  break;
               case "endChargeDownEnd":
                  break;
               case "idleUp":
                  break;
               case "ChargingUpEnd":
                  MovieClip(this.magesArray[_loc1_]).gotoAndPlay("ChargingUp");
                  break;
               case "endChargeUpEnd":
                  break;
               default:
                  MovieClip(this.magesArray[_loc1_]).play();
            }
            _loc1_++;
         }
      }
      
      public function clickEvent(param1:MouseEvent) : void
      {
         if(!this.cRoot.enableElements)
         {
            return;
         }
         this.cRoot.menu.showTowerInfo(this);
         this.displayTowerMenu();
      }
      
      override public function getInfo() : Object
      {
         var _loc1_:Object = {};
         _loc1_.tName = Locale.loadStringEx("SPECIAL_SUNRAY_NAME",Locale.getDefaultLang());
         _loc1_.tIconName = this.§_-3F§;
         _loc1_.tRangeHeight = "-";
         _loc1_.tRangeWidth = "-";
         if(this.reloadTime == 0)
         {
            _loc1_.tReload = "-";
         }
         else
         {
            _loc1_.tReload = this.reloadTime;
         }
         _loc1_.tDamageMin = this.cRoot.gameSettings.specials.templeTower.minDamage + this.cRoot.gameSettings.specials.templeTower.damageIncrement * this.magesArray.length;
         _loc1_.tDamageMax = this.cRoot.gameSettings.specials.templeTower.maxDamage + this.cRoot.gameSettings.specials.templeTower.damageIncrement * this.magesArray.length;
         _loc1_.tAttackDamage = 2;
         return _loc1_;
      }
      
      public function getTooltipParams(param1:String) : Object
      {
         var _loc2_:String = Locale.getDefaultLang();
         switch(param1)
         {
            case "special_ray":
               return {
                  "title":Locale.loadStringEx("SPECIAL_SUNRAY_CROSSHAIR_NAME",_loc2_) + " [4]",
                  "text":Locale.loadStringEx("SPECIAL_SUNRAY_CROSSHAIR_DESCRIPTION",_loc2_)
               };
            case "special_mages":
               return {
                  "title":Locale.loadStringEx("SPECIAL_SUNRAY_MAGE_NAME",_loc2_),
                  "text":Locale.loadStringEx("SPECIAL_SUNRAY_MAGE_DESCRIPTION",_loc2_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc2_),this.cRoot.gameSettings.specials.templeTower.minDamage + this.cRoot.gameSettings.specials.templeTower.damageIncrement * this.getNextLevelTemple() + "-" + (this.cRoot.gameSettings.specials.templeTower.maxDamage + this.cRoot.gameSettings.specials.templeTower.damageIncrement * this.getNextLevelTemple()),this.getColorByLevelTemple()],[Locale.loadStringEx("C_RELOAD",_loc2_),(this.cRoot.gameSettings.specials.templeTower.reloadTime - this.cRoot.gameSettings.specials.templeTower.reloadDecrease * this.getNextLevelTemple()) / this.cRoot.gameSettings.framesRate + Locale.loadStringEx("C_SEC",_loc2_),this.getColorByLevelTemple()]]
               };
            default:
               return null;
         }
      }
      
      public function getColorByLevelTemple() : String
      {
         if(this.magesArray.length == 0 || this.magesArray.length == this.maxMages)
         {
            return "white";
         }
         return "green";
      }
      
      private function getNextLevelTemple() : int
      {
         if(this.magesArray.length == this.maxMages)
         {
            return this.maxMages;
         }
         return this.magesArray.length + 1;
      }
      
      override public function displayTowerMenu() : void
      {
         if(this.cRoot.quickMenu.cTower == this)
         {
            this.cRoot.forceFreeQuickMenu();
            return;
         }
         var _loc1_:String = Locale.getDefaultLang();
         MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 33,this,false,180,true,new Array(new Array("ray","tw_crosshair",0,false,0,0,0,6,"TooltipBasic",this.getTooltipParams("special_ray"),"can_shoot"),new Array("buy_mage","tw_sunray_mage",this.cRoot.gameSettings.specials.templeTower.mageCost,false,0,0,0,7,"TooltipBasic",this.getTooltipParams("special_mages"),"max_mages")));
         this.cRoot.quickMenu.show(this.cRoot.gui);
      }
      
      public function tryLoadCrosshair() : void
      {
         if(this.§_-T8§())
         {
            this.cRoot.bullets.addChild(new TowerTempleCrosshair(Level9(this.cRoot),this));
            this.cRoot.disableLevelElements();
         }
      }
      
      override public function upgradeTower(param1:String) : void
      {
         switch(param1)
         {
            case "ray":
               this.cRoot.bullets.addChild(new TowerTempleCrosshair(Level9(this.cRoot),this));
               this.cRoot.disableLevelElements();
               break;
            case "buy_mage":
               this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.specials.templeTower.mageCost;
               this.cRoot.updateCash(-this.cRoot.gameSettings.specials.templeTower.mageCost);
               this.§_-H-§();
               this.cRoot.menu.showTowerInfo(this);
         }
      }
      
      public function shootRay(param1:Enemy) : void
      {
         this.shootTarget = param1;
         this.§_-Pl§ = §_-Mj§;
      }
      
      public function checkDisableCondition(param1:String) : Boolean
      {
         if(param1 == "max_mages")
         {
            return this.§_-FX§();
         }
         return this.§_-T8§();
      }
      
      private function §_-T8§() : Boolean
      {
         if(this.§_-Pl§ == §_-H7§)
         {
            return true;
         }
         return false;
      }
      
      private function §_-FX§() : Boolean
      {
         if(this.magesArray.length == this.maxMages)
         {
            return false;
         }
         return true;
      }
      
      private function §_-H-§() : void
      {
         var _loc1_:§_-8X§ = new §_-8X§();
         switch(this.magesArray.length)
         {
            case 0:
               _loc1_.x = -28;
               _loc1_.y = -56;
               break;
            case 1:
               _loc1_.x = 17;
               _loc1_.y = -56;
               break;
            case 2:
               _loc1_.x = -30;
               _loc1_.y = -30;
               break;
            case 3:
               _loc1_.x = 19;
               _loc1_.y = -30;
         }
         this.magesArray.push(_loc1_);
         this.addChild(_loc1_);
         this.reloadTime = this.cRoot.gameSettings.specials.templeTower.reloadTime - this.cRoot.gameSettings.specials.templeTower.reloadDecrease * this.magesArray.length;
         this.reloadTimeCounter = 0;
         this.§_-Pl§ = §_-H7§;
         this.gotoAndPlay("readyIdle");
         this.cRoot.game.gameSounds.playSorcererAshestoAshesTaunt();
         this.magesAllIdle();
      }
      
      private function §_-Gk§() : void
      {
         this.§_-Pl§ = §_-Ca§;
         this.gotoAndPlay("charging");
         this.magesStartCharging();
      }
      
      private function §_-Iw§(param1:MovieClip, param2:int) : void
      {
         switch(this.§_-Pl§)
         {
            case §_-Ez§:
               this.magesAnimIdle(param1,param2);
               break;
            case §_-Ca§:
               this.magesAnimStartCharging(param1,param2);
               break;
            case §_-KV§:
               this.magesAnimIdle(param1,param2);
               break;
            case §_-H7§:
               this.magesAnimIdle(param1,param2);
               break;
            case §_-Mj§:
               this.magesAnimIdle(param1,param2);
         }
      }
      
      private function magesAllIdle() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.magesArray.length)
         {
            this.magesAnimIdle(this.magesArray[_loc1_],_loc1_);
            _loc1_++;
         }
      }
      
      private function magesAnimIdle(param1:MovieClip, param2:int) : void
      {
         if(param2 <= 1)
         {
            param1.gotoAndStop("idleDown");
         }
         else
         {
            param1.gotoAndStop("idleUp");
         }
      }
      
      private function magesStartCharging() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.magesArray.length)
         {
            this.magesAnimStartCharging(this.magesArray[_loc1_],_loc1_);
            _loc1_++;
         }
      }
      
      private function magesAnimStartCharging(param1:MovieClip, param2:int) : void
      {
         if(param2 <= 1)
         {
            param1.gotoAndPlay("startChargeDown");
         }
         else
         {
            param1.gotoAndPlay("startChargeUp");
         }
      }
      
      private function magesEndCharging() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.magesArray.length)
         {
            this.magesAnimEndCharging(this.magesArray[_loc1_],_loc1_);
            _loc1_++;
         }
      }
      
      private function magesAnimEndCharging(param1:MovieClip, param2:int) : void
      {
         if(param2 <= 1)
         {
            param1.gotoAndPlay("endChargeDown");
         }
         else
         {
            param1.gotoAndPlay("endChargeUp");
         }
      }
      
      override public function getGraphic() : MovieClip
      {
         return MovieClip(this);
      }
      
      public function destroyThis() : void
      {
         this.unSelect();
         this.shootTarget = null;
         this.removeEventListener(MouseEvent.ROLL_OVER,rollOverEvents);
         this.removeEventListener(MouseEvent.ROLL_OUT,rollOutEvents);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.removeEventListener(MouseEvent.CLICK,this.clickEvent);
         this.cRoot.entities.removeChild(this);
         this.§_-6Q§();
         this.cRoot.removeTower(this);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame21() : *
      {
         gotoAndPlay("charging");
      }
      
      function frame31() : *
      {
         stop();
      }
      
      function frame51() : *
      {
         gotoAndPlay("readyIdle");
      }
      
      function frame67() : *
      {
         stop();
      }
   }
}
