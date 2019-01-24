package
{
   import fl.lang.Locale;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import ironhide.utils.tooltip.TooltipBasic;
   
   public class PowerLightning extends §_-5g§
   {
       
      
      public function PowerLightning(param1:Level, param2:Point, param3:Boolean = true)
      {
         addFrameScript(17,this.frame18);
         super(param1,param2,param3);
         this.reloadTime = this.cRoot.gameSettings.powers.lightning.coolDown;
         this.reloadTimeCounter = this.reloadTime;
      }
      
      override public function getInfo() : Object
      {
         var _loc1_:Object = {};
         _loc1_.pName = Locale.loadStringEx("POWER_LIGHTNING_NAME",Locale.getDefaultLang()) + " [3]";
         _loc1_.pReload = this.cRoot.gameSettings.powers.lightning.coolDown / this.cRoot.gameSettings.framesRate;
         _loc1_.pDescription = Locale.loadStringEx("POWER_LIGHTNING_DESCRIPTION",Locale.getDefaultLang());
         return _loc1_;
      }
      
      override protected function createPointer() : void
      {
         this.cRoot.gui.addChild(new PowerPointerLightning(this.cRoot,this));
      }
      
      override public function rollOverEvents(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         if(this.§_-34§)
         {
            this.gotoAndStop("over");
         }
         this.cRoot.game.gameSounds.playGUIMouseOverCommon();
         if(this.cRoot.game.main.tooltipsStatus && !this.§_-P9§)
         {
            _loc2_ = Locale.getDefaultLang();
            this.cRoot.addToopTip(new TooltipBasic(new Point(this.cRoot.menu.x + this.x,this.cRoot.menu.y + this.y - 32),new Point(this.cRoot.menu.x + this.x,this.cRoot.menu.y + this.y - 32),140,{
               "title":Locale.loadStringEx("POWER_LIGHTNING_NAME",_loc2_) + " [3]",
               "text":Locale.loadStringEx("POWER_LIGHTNING_DESCRIPTION",_loc2_),
               "atts":[[Locale.loadStringEx("C_RELOAD",_loc2_),this.cRoot.gameSettings.powers.lightning.coolDown / this.cRoot.gameSettings.framesRate + Locale.loadStringEx("C_SEC",_loc2_),"white"]]
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
      
      function frame18() : *
      {
         stop();
      }
   }
}
