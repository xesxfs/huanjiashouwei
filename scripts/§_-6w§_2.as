package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class §_-6w§ extends MovieClip
   {
       
      
      protected var cRoot:MenuOptions;
      
      protected var text:String;
      
      protected var §_-9t§:String;
      
      public function §_-6w§(param1:MenuOptions, param2:Point, param3:String, param4:String)
      {
         super();
         this.x = param2.x;
         this.y = param2.y;
         this.cRoot = param1;
         this.§_-9t§ = param4;
         this.text = param3;
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.clickEvent,false,0,true);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      protected function init(param1:Event) : void
      {
      }
      
      protected function clickEvent(param1:MouseEvent) : void
      {
         if(stage.quality != this.§_-9t§)
         {
            this.cRoot.cRoot.game.gameSounds.playGUIButtonCommon();
            stage.quality = this.§_-9t§;
            this.cRoot.§_-6h§();
         }
      }
      
      public function destroyThis() : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.removeEventListener(MouseEvent.MOUSE_DOWN,this.clickEvent);
         this.parent.removeChild(this);
      }
   }
}
