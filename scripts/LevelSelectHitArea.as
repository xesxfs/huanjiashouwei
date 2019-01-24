package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class LevelSelectHitArea extends MovieClip
   {
       
      
      protected var title:String;
      
      protected var description:String;
      
      protected var levelSelect:LevelSelect;
      
      public function LevelSelectHitArea(param1:Point, param2:LevelSelect, param3:String, param4:String)
      {
         super();
         this.x = param1.x;
         this.y = param1.y;
         this.levelSelect = param2;
         this.title = param3;
         this.description = param4;
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOver,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOut,false,0,true);
      }
      
      protected function rollOver(param1:MouseEvent) : void
      {
         this.levelSelect.showTooltip(this.title,this.description);
      }
      
      protected function rollOut(param1:MouseEvent) : void
      {
         this.levelSelect.hideTooltip();
      }
      
      public function hideMe() : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function showMe() : void
      {
         if(!this.levelSelect.contains(this))
         {
            this.levelSelect.addChild(this);
         }
      }
      
      public function destroyThis() : void
      {
         this.levelSelect = null;
         this.removeEventListener(MouseEvent.ROLL_OVER,this.rollOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.rollOut);
         this.hideMe();
      }
   }
}
