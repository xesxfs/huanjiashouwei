package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class §_-T2§ extends MovieClip
   {
       
      
      public function §_-T2§()
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
         this.gotoAndStop("idle");
      }
      
      protected function click(param1:MouseEvent) : void
      {
         §_-11§(this.parent).game.stars = §_-11§(this.parent).game.stars + §_-11§(this.parent).game.gameUpgrades.§ true§;
         §_-11§(this.parent).game.gameUpgrades.heroRoomEnabled = false;
         §_-11§(this.parent).game.gameUpgrades.selectedHero = 0;
         §_-11§(this.parent).game.gameSounds.playGUIButtonCommon();
         §_-11§(this.parent).game.map.§_-Oq§();
         §_-11§(this.parent).§_-Sa§();
      }
      
      protected function rollOver(param1:MouseEvent) : void
      {
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
         this.gotoAndStop("over");
      }
      
      protected function rollOut(param1:MouseEvent) : void
      {
         this.useHandCursor = false;
         this.gotoAndStop("idle");
      }
      
      protected function mouseDown(param1:MouseEvent) : void
      {
         this.gotoAndStop("press");
      }
      
      protected function mouseUp(param1:MouseEvent) : void
      {
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
