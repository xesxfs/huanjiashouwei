package
{
   import fl.lang.Locale;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import ironhide.utils.tooltip.TooltipBasic;
   
   public class PowerReinforcement extends §_-5g§
   {
       
      
      public function PowerReinforcement(param1:Level, param2:Point, param3:Boolean = true)
      {
         addFrameScript(17,this.frame18);
         super(param1,param2,param3);
         this.reloadTime = this.getReloadTime();
         this.reloadTimeCounter = this.reloadTime;
      }
      
      override public function getInfo() : Object
      {
         var _loc1_:Object = {};
         _loc1_.pName = Locale.loadStringEx("POWER_REINFORCEMENTS_NAME",Locale.getDefaultLang()) + " [2]";
         _loc1_.pReload = this.cRoot.gameSettings.powers.farmers.coolDown / this.cRoot.gameSettings.framesRate;
         _loc1_.pDescription = Locale.loadStringEx("POWER_REINFORCEMENTS_DESCRIPTION",Locale.getDefaultLang());
         return _loc1_;
      }
      
      override protected function createPointer() : void
      {
         var _loc1_:int = this.cRoot.game.gameUpgrades.reinforcementLevel;
         if(this.cRoot.maxUpgradeLevel != 0)
         {
            if(this.cRoot.maxUpgradeLevel < this.cRoot.game.gameUpgrades.reinforcementLevel)
            {
               _loc1_ = this.cRoot.maxUpgradeLevel;
            }
         }
         if(this.cRoot.game.pc && this.cRoot.game.pcSelectedReinforcement > GameSettings.§_-8-§)
         {
            switch(this.cRoot.game.pcSelectedReinforcement)
            {
               case GameSettings.§_-Oh§:
                  this.cRoot.gui.addChild(new PowerPointerReinforcementStreet(this.cRoot,this));
                  break;
               case GameSettings.§_-1§:
                  this.cRoot.gui.addChild(new PowerPointerReinforcementStars(this.cRoot,this));
                  break;
               case GameSettings.§_-TL§:
                  this.cRoot.gui.addChild(new PowerPointerReinforcementMortal(this.cRoot,this));
            }
         }
         else
         {
            switch(_loc1_)
            {
               case 0:
                  this.cRoot.gui.addChild(new PowerPointerFarmer(this.cRoot,this));
                  break;
               case 1:
                  this.cRoot.gui.addChild(new PowerPointerFarmer(this.cRoot,this));
                  break;
               case 2:
                  this.cRoot.gui.addChild(new PowerPointerReinforcementLevel2(this.cRoot,this));
                  break;
               case 3:
                  this.cRoot.gui.addChild(new PowerPointerReinforcementLevel3(this.cRoot,this));
                  break;
               case 4:
                  this.cRoot.gui.addChild(new PowerPointerReinforcementLevel4(this.cRoot,this));
                  break;
               case 5:
                  this.cRoot.gui.addChild(new PowerPointerReinforcementLevel4(this.cRoot,this));
            }
         }
      }
      
      override public function rollOverEvents(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         if(this.§_-34§)
         {
            this.gotoAndStop("over");
         }
         this.cRoot.game.gameSounds.playGUIMouseOverCommon();
         if(this.cRoot.game.main.tooltipsStatus)
         {
            _loc2_ = Locale.getDefaultLang();
            this.cRoot.addToopTip(new TooltipBasic(new Point(this.cRoot.menu.x + this.x,this.cRoot.menu.y + this.y - 32),new Point(this.cRoot.menu.x + this.x,this.cRoot.menu.y + this.y - 32),150,{
               "title":Locale.loadStringEx("POWER_REINFORCEMENTS_NAME",_loc2_) + " [2]",
               "text":Locale.loadStringEx("POWER_REINFORCEMENTS_DESCRIPTION",_loc2_),
               "atts":[[Locale.loadStringEx("C_RELOAD",_loc2_),this.reloadTime / this.cRoot.gameSettings.framesRate + Locale.loadStringEx("C_SEC",_loc2_),"white"]]
            }));
         }
      }
      
      override public function rollOutEvents(param1:MouseEvent) : void
      {
         if(this.§_-34§)
         {
            this.gotoAndStop("idle");
         }
         this.cRoot.game.gameSounds.stopGUIMouseOverCommon();
         this.cRoot.removeToopTip();
      }
      
      private function getReloadTime() : int
      {
         var _loc1_:int = this.cRoot.game.gameUpgrades.reinforcementLevel;
         if(this.cRoot.maxUpgradeLevel != 0)
         {
            if(this.cRoot.maxUpgradeLevel < this.cRoot.game.gameUpgrades.reinforcementLevel)
            {
               _loc1_ = this.cRoot.maxUpgradeLevel;
            }
         }
         switch(_loc1_)
         {
            case 0:
               return this.cRoot.gameSettings.powers.farmers.coolDown;
            case 1:
               return this.cRoot.gameSettings.powers.farmers.coolDown;
            case 2:
               return this.cRoot.gameSettings.powers.reinforcementLevel2.coolDown;
            case 3:
               return this.cRoot.gameSettings.powers.reinforcementLevel3.coolDown;
            case 4:
               return this.cRoot.gameSettings.powers.reinforcementLevel4.coolDown;
            case 5:
               return this.cRoot.gameSettings.powers.reinforcementLevel4.coolDown;
            default:
               return this.cRoot.gameSettings.powers.farmers.coolDown;
         }
      }
      
      function frame18() : *
      {
         stop();
      }
   }
}
