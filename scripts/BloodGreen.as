package
{
   import com.reintroducing.sound.SoundManager;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class BloodGreen extends MovieClip
   {
       
      
      private var level:Level;
      
      private var durationTime:int;
      
      private var durationTimeCounter:int;
      
      public function BloodGreen(param1:Point, param2:Number, param3:Level)
      {
         super();
         addFrameScript(10,this.frame11);
         this.x = param1.x;
         this.y = param1.y;
         this.rotation = param2;
         this.durationTime = 15;
         this.level = param3;
         if(Math.random() > 0.5)
         {
            SoundManager.getInstance().playSound("arrow_hit_2",this.level.game.gameSounds.§_-0§,0,0);
         }
         else
         {
            SoundManager.getInstance().playSound("arrow_hit_3",this.level.game.gameSounds.§_-0§,0,0);
         }
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
         if(this.currentFrame != this.totalFrames)
         {
            this.play();
         }
      }
      
      private function destroyThis() : void
      {
         this.level = null;
         this.parent.removeChild(this);
      }
      
      function frame11() : *
      {
         stop();
      }
   }
}
