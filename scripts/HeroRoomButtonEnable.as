package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class HeroRoomButtonEnable extends MovieClip
   {
       
      
      public var active:Boolean;
      
      public function HeroRoomButtonEnable()
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
         if(§_-11§(this.parent).game.stars < 15)
         {
            this.gotoAndStop("disabled");
            this.active = false;
         }
         else
         {
            this.gotoAndStop("idle");
            this.active = true;
         }
      }
      
      protected function click(param1:MouseEvent) : void
      {
         if(!this.active)
         {
            return;
         }
         §_-11§(this.parent).game.stars = §_-11§(this.parent).game.stars - §_-11§(this.parent).game.gameUpgrades.§ true§;
         §_-11§(this.parent).game.gameUpgrades.heroRoomEnabled = true;
         §_-11§(this.parent).§_-8m§.play();
         §_-11§(this.parent).game.gameSounds.stopSound("gui_buy_upgrade");
         §_-11§(this.parent).game.gameSounds.playGUIBuyUpgrade();
         if(!§_-11§(this.parent).game.§_-Pd§)
         {
            §_-11§(this.parent).game.§_-Bn§();
            §_-11§(this.parent).game.gameUpgrades.saveData();
         }
         else
         {
            §_-11§(this.parent).game.map.§_-4z§();
         }
         §_-11§(this.parent).§_-0S§();
      }
      
      protected function rollOver(param1:MouseEvent) : void
      {
         if(!this.active)
         {
            return;
         }
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
         this.gotoAndStop("over");
      }
      
      protected function rollOut(param1:MouseEvent) : void
      {
         if(!this.active)
         {
            return;
         }
         this.useHandCursor = false;
         this.gotoAndStop("idle");
      }
      
      protected function mouseDown(param1:MouseEvent) : void
      {
         if(!this.active)
         {
            return;
         }
         this.gotoAndStop("press");
      }
      
      protected function mouseUp(param1:MouseEvent) : void
      {
         if(!this.active)
         {
            return;
         }
         this.gotoAndStop("over");
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
