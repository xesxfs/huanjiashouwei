package
{
   import flash.display.MovieClip;
   
   public class AchievementItem extends MovieClip
   {
       
      
      public var §_-Fo§:MovieClip;
      
      public var fadeTime:int = 44;
      
      public var fadeTimeCounter:int;
      
      protected var level:Level;
      
      public function AchievementItem(param1:Level, param2:String, param3:String, param4:String)
      {
         super();
         addFrameScript(45,this.frame46);
         this.x = 255;
         this.y = 10;
         this.level = param1;
         this.§_-Fo§.txtTitle.text = param3.toUpperCase();
         this.§_-Fo§.itemIcon.gotoAndStop(param2);
      }
      
      public function onFrameUpdate() : void
      {
         if(this.fadeTimeCounter < this.fadeTime)
         {
            this.fadeTimeCounter++;
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
         if(this.currentFrame != this.totalFrames)
         {
            this.play();
         }
      }
      
      protected function destroyThis() : void
      {
         this.level.§_-NX§ = null;
         this.level = null;
         this.parent.removeChild(this);
      }
      
      function frame46() : *
      {
         stop();
      }
   }
}
