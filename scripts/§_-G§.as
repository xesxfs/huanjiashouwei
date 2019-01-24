package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class §_-G§ extends MovieClip
   {
       
      
      public var selected:MovieClip;
      
      public var §_-LK§:MovieClip;
      
      public var §_-3W§:int;
      
      public function §_-G§()
      {
         super();
         this.selected.visible = false;
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOver,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOut,false,0,true);
         this.addEventListener(MouseEvent.CLICK,this.click,false,0,true);
      }
      
      public function setStatus() : void
      {
         if(§_-11§(this.parent).§_-KN§ == this.§_-3W§)
         {
            this.selected.visible = true;
         }
         else
         {
            this.selected.visible = false;
         }
         if(§_-11§(this.parent).game.gameUpgrades.selectedHero == this.§_-3W§)
         {
            this.gotoAndStop("on");
         }
         else
         {
            this.gotoAndStop("off");
         }
      }
      
      protected function click(param1:MouseEvent) : void
      {
         §_-11§(this.parent).game.gameSounds.stopSound("gui_open_tower_menu");
         §_-11§(this.parent).game.gameSounds.§_-DF§();
         §_-11§(this.parent).§_-Hi§(this.§_-3W§);
         §_-11§(this.parent).§_-7I§.play();
         this.§_-LK§.play();
      }
      
      protected function rollOver(param1:MouseEvent) : void
      {
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
      }
      
      protected function rollOut(param1:MouseEvent) : void
      {
         this.useHandCursor = false;
      }
      
      public function destroyThis() : void
      {
         this.removeEventListener(MouseEvent.ROLL_OVER,this.rollOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.rollOut);
         this.removeEventListener(MouseEvent.CLICK,this.click);
      }
   }
}
