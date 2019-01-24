package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class TowerSellSmoke extends MovieClip
   {
       
      
      public var sellHolder:MovieClip;
      
      protected var durationTime:int = 16;
      
      protected var durationTimeCounter:int;
      
      public function TowerSellSmoke(param1:Point, param2:int)
      {
         super();
         addFrameScript(15,this.frame16);
         this.x = param1.x;
         this.y = param1.y;
         this.durationTimeCounter = 0;
         this.sellHolder.txtSellValue.text = "+" + param2;
      }
      
      public function onFrameUpdate() : void
      {
         if(this.durationTimeCounter < this.durationTime)
         {
            this.durationTimeCounter++;
            return;
         }
         this.destroyThis();
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         this.play();
      }
      
      protected function destroyThis() : void
      {
         this.parent.removeChild(this);
      }
      
      function frame16() : *
      {
         stop();
      }
   }
}
