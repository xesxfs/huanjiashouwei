package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class LevelThumb extends MovieClip
   {
       
      
      public var data:SaveDataLevel;
      
      public var map:Map;
      
      public function LevelThumb(param1:Map, param2:Point, param3:SaveDataLevel)
      {
         super();
         this.data = param3;
         this.map = param1;
         this.x = param2.x;
         this.y = param2.y;
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOver,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOut,false,0,true);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
         this.addEventListener(MouseEvent.CLICK,this.clickEvent,false,0,true);
      }
      
      protected function clickEvent(param1:MouseEvent) : void
      {
         if(this.map.itemsLocked)
         {
            return;
         }
         if(this.data.levelIndex == 0)
         {
            this.map.destroySign();
         }
         this.map.game.gameSounds.playGUIButtonCommon();
         this.map.addMapBlock();
         this.map.addChild(new LevelSelect(this));
         this.goToSelected();
      }
      
      protected function init(param1:Event) : void
      {
         this.evaluateStatus();
      }
      
      protected function evaluateStatus() : void
      {
      }
      
      protected function goToSelected() : void
      {
         this.gotoAndStop("selected");
      }
      
      protected function rollOver(param1:MouseEvent) : void
      {
         this.map.game.gameSounds.playGUIMouseOverCommon();
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
         this.gotoAndStop("over");
      }
      
      protected function rollOut(param1:MouseEvent) : void
      {
         this.map.game.gameSounds.stopGUIMouseOverCommon();
         this.useHandCursor = false;
         this.gotoAndStop("idle");
      }
      
      public function destroyThis() : void
      {
         this.data = null;
         this.map = null;
         this.removeEventListener(MouseEvent.ROLL_OVER,this.rollOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.rollOut);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.removeEventListener(MouseEvent.CLICK,this.clickEvent);
      }
   }
}
