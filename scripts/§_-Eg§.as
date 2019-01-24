package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class §_-Eg§ extends MovieClip
   {
       
      
      public var §super§:String;
      
      public function §_-Eg§()
      {
         super();
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOver,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOut,false,0,true);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown,false,0,true);
         this.addEventListener(MouseEvent.MOUSE_UP,this.mouseUp,false,0,true);
         this.addEventListener(MouseEvent.CLICK,this.click,false,0,true);
      }
      
      public function setStatus() : void
      {
         if(§_-11§(this.parent).game.gameUpgrades.§_-Ih§(§_-11§(this.parent).§_-KN§))
         {
            if(§_-11§(this.parent).game.gameUpgrades.selectedHero != §_-11§(this.parent).§_-KN§)
            {
               this.§super§ = "select";
            }
            else
            {
               this.§super§ = "deselect";
            }
         }
         else
         {
            this.§super§ = "buy";
         }
         this.gotoAndStop(this.§super§ + "Idle");
      }
      
      protected function click(param1:MouseEvent) : void
      {
         if(§_-11§(this.parent).game.gameUpgrades.§_-Ih§(§_-11§(this.parent).§_-KN§))
         {
            if(§_-11§(this.parent).game.gameUpgrades.selectedHero != §_-11§(this.parent).§_-KN§)
            {
               §_-11§(this.parent).game.gameUpgrades.selectedHero = §_-11§(this.parent).§_-KN§;
               §_-11§(this.parent).selectHero();
               §_-11§(this.parent).§_-IA§();
               §_-11§(this.parent).game.gameSounds.stopSound("gui_buy_upgrade");
               §_-11§(this.parent).game.gameSounds.playGUIBuyUpgrade();
               §_-11§(this.parent).§_-M6§.play();
            }
            else
            {
               §_-11§(this.parent).game.gameUpgrades.selectedHero = 0;
               §_-11§(this.parent).§_-3J§();
               §_-11§(this.parent).game.gameSounds.playGUIButtonCommon();
               §_-11§(this.parent).§_-7I§.play();
            }
            this.setStatus();
            §_-11§(this.parent).§_-2D§();
            §_-11§(this.parent).game.map.§_-Oq§();
            if(!§_-11§(this.parent).game.§_-Pd§)
            {
               §_-11§(this.parent).game.§_-Bn§();
               §_-11§(this.parent).game.gameUpgrades.saveData();
            }
            else
            {
               §_-11§(this.parent).game.map.§_-4z§();
            }
         }
         else
         {
            §_-11§(this.parent).closeAndOpenPremium();
         }
      }
      
      protected function rollOver(param1:MouseEvent) : void
      {
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
         this.gotoAndStop(this.§super§ + "Over");
      }
      
      protected function rollOut(param1:MouseEvent) : void
      {
         this.useHandCursor = false;
         this.gotoAndStop(this.§super§ + "Idle");
      }
      
      protected function mouseDown(param1:MouseEvent) : void
      {
         this.gotoAndStop(this.§super§ + "Press");
      }
      
      protected function mouseUp(param1:MouseEvent) : void
      {
         this.gotoAndStop(this.§super§ + "Over");
      }
      
      public function destroyThis() : void
      {
         this.removeEventListener(MouseEvent.ROLL_OVER,this.rollOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.rollOut);
         this.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown);
         this.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUp);
         this.removeEventListener(MouseEvent.CLICK,this.click);
      }
   }
}
