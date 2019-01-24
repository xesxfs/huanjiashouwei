package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class §_-Gt§ extends MovieClip
   {
       
      
      protected var cRoot:MenuOptions;
      
      protected var text:String;
      
      protected var action:String;
      
      public function §_-Gt§(param1:MenuOptions, param2:Point, param3:String, param4:String)
      {
         super();
         this.x = param2.x;
         this.y = param2.y;
         this.cRoot = param1;
         this.action = param4;
         this.text = param3;
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.clickEvent,false,0,true);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      protected function init(param1:Event) : void
      {
      }
      
      protected function clickEvent(param1:MouseEvent) : void
      {
         this.cRoot.cRoot.game.gameSounds.playGUIButtonCommon();
         this.cRoot.execAction(this.action);
      }
      
      public function destroyThis() : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.removeEventListener(MouseEvent.MOUSE_DOWN,this.clickEvent);
         this.parent.removeChild(this);
      }
   }
}
